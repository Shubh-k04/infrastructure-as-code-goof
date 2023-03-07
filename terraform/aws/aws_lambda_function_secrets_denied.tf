resource "aws_lambda_function" "denied" {
  environment {
    variables = {
      password = "REDACTED" 
    }
  }
}

resource "aws_lambda_function" "denied_2" {
  environment {
    variables = {
      private_key = "REDACTED" 
    }
  }
}

resource "aws_lambda_function" "denied_3" {
  environment {
    variables = {
      aws_access_key_id = "REDACTED" 
    }
  }
}

resource "aws_lambda_function" "denied_4" {
  environment {
    variables = {
      token = "REDACTED" 
    }
  }
}

resource "aws_lambda_function" "denied_5" {
  environment {
    variables = {
      foo = "bar"
      api_key = "REDACTED" 
    }
  }
}

resource "aws_lambda_function" "denied_6" {
  environment {
    variables = {
      aws_secret_access_key = "REDACTED" 
      secret = "REDACTED"
    }
  }
} 
