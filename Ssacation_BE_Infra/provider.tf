terraform {

  required_version = "1.5.0"

  required_providers {

    aws = "~> 5.4.0"
  }
}

provider "aws" {
  
  # access_key = "<AWS_ACCESS_KEY>"
  # secret_key = "<AWS_SECRET_KEY>"
  region = "ap-northeast-2"
  shared_credentials_files = [
    "~/.aws/credentials" # Credential 파일 위치
  ]
  profile = "ssacation" # Credential 파일 내의 저장된 profile 중 선택
}

#============== 환경변수로 DB 정보 설정 ==============#
# 터미널에서, $ export TF_VAR_db_username=<DB 유저이름>
variable "db_username" {
  description = "username for ssacation_db"
  type        = string
  default     = ""
}

# 터미널에서, $ export TF_VAR_db_password=<DB 비밀번호>
variable "db_password" {
  description = "password for ssacation_db"
  type        = string
  default     = ""
}