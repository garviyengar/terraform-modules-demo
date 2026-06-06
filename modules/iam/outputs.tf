output "iam_user_names" {
  value = aws_iam_user.users[*].name
}

output "iam_user_passwords" {
  value     = aws_iam_user_login_profile.login[*].password
  sensitive = true
}