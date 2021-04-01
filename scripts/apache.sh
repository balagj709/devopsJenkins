#!/bin/bash
yum upgrade
yum update
yum install httpd -y
systemctl start httpd
systemctl enable httpd

echo "<h1> My first Web Home Page on AWS EC2 from Terraform Code </h1>" > /var/www/html/index.html