# Create IAM users
resource "aws_iam_user" "users" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

# Create IAM group
resource "aws_iam_group" "group" {
  name = var.group_name
}

# Add users to group
resource "aws_iam_group_membership" "membership" {
  name  = "membership"
  users = aws_iam_user.users[*].name
  group = aws_iam_group.group.name
}

# Attach policies to group
resource "aws_iam_group_policy_attachment" "group_attach" {
  count      = length(var.policies)
  group      = aws_iam_group.group.name
  policy_arn = var.policies[count.index]
}

# Create login profile (passwords)
resource "aws_iam_user_login_profile" "login" {
  count                   = length(var.user_names)
  user                    = aws_iam_user.users[count.index].name
  password_reset_required = true
}