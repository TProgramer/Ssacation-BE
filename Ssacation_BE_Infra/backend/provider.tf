provider "aws" {

  region = "ap-northeast-2"
  shared_credentials_files = [
    
    "~/.aws/credentials" # Credential 파일 위치
  ]
  profile = "ssacation" # Credential 파일 내의 저장된 profile 중 선택
}