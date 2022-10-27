#!/bin/bash
cd /var/www/pc_client
git pull
sudo service nginx restart
NGINX_PROC_COUNT=$(ps -ef|grep -i nginx|grep -E "master|worker"|grep -v grep |wc -l)
PREDIFIX_BCKEND_PROC_COUNT=$(ps -ef|grep -i 4224 |grep -v grep|wc -l)
echo "front end $NGINX_PROC_COUNT"
echo "backend $PREDIFIX_BCKEND_PROC_COUNT"