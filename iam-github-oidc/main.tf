locals {
  # GitHub stamps every workflow token with a "sub" like:
  #   repo:<owner>/<repo>:pull_request
  #   repo:<owner>/<repo>:ref:refs/heads/main
  # The trust policies below only trust those exact subs.
  oidc_sub_prefix = "repo:${var.github_owner}/${var.github_repo}"
}

# GitHub's OIDC issuer certificate -> thumbprint (resolved automatically).
data "tls_certificate" "github" {
  url = "https://token.actions.githubusercontent.com/.well-known/openid-configuration"
}

# Registers GitHub as a trusted identity provider in YOUR AWS account.
resource "aws_iam_openid_connect_provider" "github" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.github.certificates[0].sha1_fingerprint]
}

# ---------------- PLAN role: read-only, used on pull_request ----------------
data "aws_iam_policy_document" "plan_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["${local.oidc_sub_prefix}:pull_request"]
    }
  }
}

resource "aws_iam_role" "plan" {
  name               = "gha-tf-plan"
  assume_role_policy = data.aws_iam_policy_document.plan_assume.json
}

resource "aws_iam_role_policy_attachment" "plan_readonly" {
  role       = aws_iam_role.plan.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

# ---------------- APPLY role: only assumable from the main branch ----------------
data "aws_iam_policy_document" "apply_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    # The key line: only a run ON main can assume the apply role.
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["${local.oidc_sub_prefix}:ref:refs/heads/main"]
    }
  }
}

resource "aws_iam_role" "apply" {
  name               = "gha-tf-apply"
  assume_role_policy = data.aws_iam_policy_document.apply_assume.json
}

# Broad perms for the experiment. Scope down for real workloads.
resource "aws_iam_role_policy_attachment" "apply_power" {
  role       = aws_iam_role.apply.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}
