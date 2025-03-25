#!/bin/bash
systemctl stop httpd
sh -c "echo Welcome_back >> /var/www/html/index.html"
