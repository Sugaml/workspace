# Generate a new SSH key pair
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create an AWS key pair using the generated public key
resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = tls_private_key.ssh_key.public_key_openssh
}

# Save the private key locally
resource "local_file" "private_key" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "${path.module}/${var.key_name}.pem"
}

resource "aws_instance" "this" {
  ami                    = "ami-04b4f1a9cf54c11d0"
  instance_type          = var.instance_type
  vpc_security_group_ids = var.security_group_ids
  key_name      = aws_key_pair.deployer.key_name

  depends_on = [aws_key_pair.deployer]

  tags = {
    Name = "Terraform-EC2"
  }
}
