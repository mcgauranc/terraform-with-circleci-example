resource "aws_security_group" "allow-external-ssh" {
  name        = "allow-external-ssh"
  description = "Allow incoming ssh connections from the world."
  vpc_id      = "${var.vpc-id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow-all-http-outgoing" {
  name        = "allow-all-http-outgoing"
  description = "Allow outgoing http connections to the world."
  vpc_id      = "${var.vpc-id}"

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow-all-http-incoming" {
  name        = "allow-all-http-incoming"
  description = "Allow incoming http connections from the world."
  vpc_id      = "${var.vpc-id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow-mysql-egress" {
  name        = "allow-mysql-egress"
  description = "Allow outgoing mysql connections to the VPC."
  vpc_id      = "${var.vpc-id}"

  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc-cidr-block}"]
  }
}
