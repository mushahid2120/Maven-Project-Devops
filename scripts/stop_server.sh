#!/bin/bash
systemctl stop httpd
echo "Welcome" >> /var/www/html/index.html
