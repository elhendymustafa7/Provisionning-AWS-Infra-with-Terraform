resource "aws_instance" "main" {
  ami               = "ami-06878d265978313ca"
  instance_type     = "t2.micro"
  key_name          = "myKey"
  subnet_id       = aws_subnet.main.id
  security_groups = [aws_security_group.main.id]
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install apache2 -y
              sudo systemctl start apache2
              sudo bash -c 'hello > /var/www/html/index.html'
              EOF
 
  tags = {
    Name = "main"
  }
}