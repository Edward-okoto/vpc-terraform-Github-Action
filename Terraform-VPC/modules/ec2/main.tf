resource "aws_instance" "web" {
  count = length(var.ec2_names)
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.Sg_id]
  associate_public_ip_address = true
  subnet_id = var.subnet_id[count.index]
  availability_zone = data.aws_availability_zones.availability_zones.names[count.index]
  user_data = <<EOF
    #!/bin/bash
    # Update package lists and install Apache HTTP server
    sudo apt update -y
    sudo apt install apache2 -y

    # Start the Apache service and enable it to start on boot
    sudo systemctl start apache2
    sudo systemctl enable apache2

    # Create a simple HTML page as the default web content
    echo "<html>
    <head>
    <title>Welcome to Your Web Service</title>
    </head>
    <body>
    <h1>HTTP Web Service is running on Ubuntu!</h1>
    </body>
    </html>" | sudo tee /var/www/html/index.html

    # Restart the Apache service to apply changes
    sudo systemctl restart apache2
    EOF

  tags = {
    Name = var.ec2_names[count.index]
  }
}

