module "ec2" {
  source = "./ec2"
}

#module "s3" {
#  source = "./s3"
#}

module "lambda" {
  source = "./lambda"
}
