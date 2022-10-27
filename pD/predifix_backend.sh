#!/bin/bash
cd /Toronto_POC/pc_predifix_git
git pull
. ./venv/bin/activate
touch print/models.py
touch pc/models.py
python manage.py migrate
echo "Completed"
NGINX_PROC_COUNT=$(ps -ef|grep -i nginx|grep -E "master|worker"|grep -v grep |wc -l)
PREDIFIX_BCKEND_PROC_COUNT=$(ps -ef|grep -i 4224 |grep -v grep|wc -l)
echo "front end $NGINX_PROC_COUNT"
echo "backend $PREDIFIX_BCKEND_PROC_COUNT"