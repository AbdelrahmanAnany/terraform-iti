
resource "aws_instance" "public1" {
  ami               = var.ami
  instance_type     = var.instance
  key_name          = var.key
  subnet_id       = module.network.public_subnet1_id
  security_groups = [aws_security_group.publicEc2.id]
  user_data = <<-EOF
              #!/bin/bash
              # Use this for your user data (script from top to bottom)
              # install httpd (Linux 2 version)
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello World from $(hostname -f)</h1>" >> /var/www/html/index.html
              echo "<h1>${aws_lb.lb_private.dns_name}</h1>" >> /var/www/html/index.html
              echo "<h1>public1</h1>" >> /var/www/html/index.html
              "sudo chmod 777 /etc/httpd/conf/httpd.conf",
              "sudo echo '<VirtualHost :>' >> /etc/httpd/conf/httpd.conf",
              "sudo echo -e '\t ProxyPreserveHost on' >> /etc/httpd/conf/httpd.conf",
              "sudo echo -e '\t ServerAdmin ec2-user@localhost' >> /etc/httpd/conf/httpd.conf",
              "sudo echo -e '\t ProxyPass / http://${aws_lb.lb_private.dns_name}/' >> /etc/httpd/conf/httpd.conf",
              "sudo echo -e '\t ProxyPassReverse / http://${aws_lb.lb_private.dns_name}/' >> /etc/httpd/conf/httpd.conf",
              "sudo echo '</VirtualHost>' >> /etc/httpd/conf/httpd.conf",
              "sudo sleep 5",
              "sudo systemctl restart httpd",
              EOF
 
  tags = {
    Name = "public1"
  }

}



resource "aws_instance" "public2" {
  ami               = var.ami
  instance_type     = var.instance
  key_name          = var.key
  subnet_id       = module.network.public_subnet2_id
  security_groups = [aws_security_group.publicEc2.id]
  user_data = <<-EOF
              #!/bin/bash
              # Use this for your user data (script from top to bottom)
              # install httpd (Linux 2 version)
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello World from $(hostname -f)</h1>" >> /var/www/html/index.html
              echo "<h1>${aws_lb.lb_private.dns_name}</h1>" >> /var/www/html/index.html
              echo "<h1>public2</h1>" >> /var/www/html/index.html
              "sudo chmod 777 /etc/httpd/conf/httpd.conf",
              "sudo echo '<VirtualHost :>' >> /etc/httpd/conf/httpd.conf",
              "sudo echo -e '\t ProxyPreserveHost on' >> /etc/httpd/conf/httpd.conf",
              "sudo echo -e '\t ServerAdmin ec2-user@localhost' >> /etc/httpd/conf/httpd.conf",
              "sudo echo -e '\t ProxyPass / http://${aws_lb.lb_private.dns_name}/' >> /etc/httpd/conf/httpd.conf",
              "sudo echo -e '\t ProxyPassReverse / http://${aws_lb.lb_private.dns_name}/' >> /etc/httpd/conf/httpd.conf",
              "sudo echo '</VirtualHost>' >> /etc/httpd/conf/httpd.conf",
              "sudo sleep 5",
              "sudo systemctl restart httpd",
              EOF
 
  tags = {
    Name = "public2"
  }
}

#########################################
resource "aws_instance" "private1" {
  ami               = var.ami
  instance_type     = var.instance
  key_name          =var.key
  subnet_id       = module.network.private_subnet1_id
  security_groups = [aws_security_group.privateEc2.id]
  user_data = <<-EOF
              #!/bin/bash
              # Use this for your user data (script from top to bottom)
              # install httpd (Linux 2 version)
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello World from $(hostname -f)</h1>" >> /var/www/html/index.html
              echo "<h1>${aws_lb.lb_private.dns_name}</h1>" >> /var/www/html/index.html
              echo "<h1>private1</h1>" >> /var/www/html/index.html
              "sudo chmod 777 /etc/httpd/conf/httpd.conf",
              "sudo echo '<VirtualHost :>' >> /etc/httpd/conf/httpd.conf",
              "sudo echo -e '\t ProxyPreserveHost on' >> /etc/httpd/conf/httpd.conf",
              "sudo echo -e '\t ServerAdmin ec2-user@localhost' >> /etc/httpd/conf/httpd.conf",
              "sudo echo -e '\t ProxyPass / http://${aws_lb.lb_private.dns_name}/' >> /etc/httpd/conf/httpd.conf",
              "sudo echo -e '\t ProxyPassReverse / http://${aws_lb.lb_private.dns_name}/' >> /etc/httpd/conf/httpd.conf",
              "sudo echo '</VirtualHost>' >> /etc/httpd/conf/httpd.conf",
              "sudo sleep 5",
              "sudo systemctl restart httpd",
              EOF
 
  tags = {
    Name = "private1"
  }
}

resource "aws_instance" "private2" {
  ami               = var.ami
  instance_type     = var.instance
  key_name          = var.key
  subnet_id       = module.network.private_subnet2_id
  security_groups = [aws_security_group.privateEc2.id]
  user_data = <<-EOF
              #!/bin/bash
              # Use this for your user data (script from top to bottom)
              # install httpd (Linux 2 version)
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello World from $(hostname -f)</h1>" >> /var/www/html/index.html
              echo "<h1>${aws_lb.lb_private.dns_name}</h1>" >> /var/www/html/index.html
              echo "<h1>private2</h1>" >> /var/www/html/index.html
              "sudo chmod 777 /etc/httpd/conf/httpd.conf",
              "sudo echo '<VirtualHost :>' >> /etc/httpd/conf/httpd.conf",
              "sudo echo -e '\t ProxyPreserveHost on' >> /etc/httpd/conf/httpd.conf",
              "sudo echo -e '\t ServerAdmin ec2-user@localhost' >> /etc/httpd/conf/httpd.conf",
              "sudo echo -e '\t ProxyPass / http://${aws_lb.lb_private.dns_name}/' >> /etc/httpd/conf/httpd.conf",
              "sudo echo -e '\t ProxyPassReverse / http://${aws_lb.lb_private.dns_name}/' >> /etc/httpd/conf/httpd.conf",
              "sudo echo '</VirtualHost>' >> /etc/httpd/conf/httpd.conf",
              "sudo sleep 5",
              "sudo systemctl restart httpd",
              EOF
 
  tags = {
    Name = "private2"
  }
































  
  # provisioner "remote-exec" {
  #   inline = [
  #       "sudo yum update -y",
  #       "sudo yum install -y httpd",
  #       "sudo systemctl start httpd",
  #       "sudo systemctl enable httpd",
  #       "sudo chmod 777 /var/www/html/",
  #       "sudo echo '<h1>Hello World from $(hostname -f)</h1>' > /var/www/html/index.html",
  #       "sudo chmod 777 /etc/httpd/conf/httpd.conf",
  #       "sudo echo '<VirtualHost:>' >> /etc/httpd/conf/httpd.conf",
  #       "sudo echo -e '\t ProxyPreserveHost on' >> /etc/httpd/conf/httpd.conf",
  #       "sudo echo -e '\t ServerAdmin ec2-user@localhost' >> /etc/httpd/conf/httpd.conf",
  #       "sudo echo -e '\t ProxyPass / http://${var.dns_alb}/' >> /etc/httpd/conf/httpd.conf",
  #       "sudo echo -e '\t ProxyPassReverse / http://${var.dns_alb}/' >> /etc/httpd/conf/httpd.conf",
  #       "sudo echo '</VirtualHost>' >> /etc/httpd/conf/httpd.conf",
  #       "sudo systemctl restart httpd",

  #   ]
  # }
  # connection {
  #   type     = "ssh"
  #   user     = "ec2-user"
  #   # private_key = file("mykey")
  #   host = self.public_ip
  # }
}


