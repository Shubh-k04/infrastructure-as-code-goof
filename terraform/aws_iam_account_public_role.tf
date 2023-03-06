# Usecase handled by SNYK-CC-TF-117
resource "aws_iam_role" "allowed" {
  name = "test_role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": "*",
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  })
}

# Usecase handled by SNYK-CC-TF-117
resource "aws_iam_role" "allowed_2" {
  name = "test_role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      },
      {
        "Action": "sts:AssumeRole",
        "Principal": "*",
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  })
}

resource "aws_iam_role" "denied" {
  name = "test_role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "AWS": "arn:aws:iam::123456789012:root"
        },
        "Effect": "Deny",
        "Sid": ""
      }
    ]
  })
}

resource "aws_iam_role" "denied_3" {
  name = "test_role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "AWS": [
            "arn:aws:iam::123456789012:root",
            "123456789012"
          ]
        },
        "Effect": "Deny",
        "Sid": ""
      }
    ]
  })
}

resource "aws_iam_role" "denied_2" {
  name = "test_role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "AWS": "123456789012"
        },
        "Effect": "Deny",
        "Sid": ""
      }
    ]
  })
}

resource "aws_iam_role" "denied_4" {
  name = "test_role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Deny",
        "Sid": ""
      },
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "AWS": "123456789012"
        },
        "Effect": "Deny",
        "Sid": ""
      }
    ]
  })
}

# Usecase handled by SNYK-CC-TF-117
data "aws_iam_policy_document" "denied_4" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::123456789012:arn:role/test"]
    }
  }
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["123456789012"]
    }
  }
} 
