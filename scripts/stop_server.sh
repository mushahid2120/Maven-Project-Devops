#!/bin/bash
systemctl stop httpd
sh -c "echo Welcome >> /var/www/html/index.html"
