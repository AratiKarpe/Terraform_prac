resource "aws_instance" "webserver" {
   
   key_name = var.this_key_name
   ami = var.this_ami 
   instance_type = var.This_instance_type
   
   disable_api_termination = var.this_disable_api_termination
   subnet_id = var.this_subnetid
   user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install apache2 -y
    sudo systemctl start apache2
    sudo systemctl enable apache2
    EOF
  tags = {
    Name = "Webserver"
  }

}