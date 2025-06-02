resource "aws_ecr_repository" "app_repo" {
  name = "devops-demo-app"
  image_scanning_configuration {
    scan_on_push = true
  }
}
