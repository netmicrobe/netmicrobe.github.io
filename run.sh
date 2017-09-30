#!/bin/bash

# iptables 设置
# iptables -I INPUT 1 -p tcp --dport 4000 -j ACCEPT

bundle exec jekyll serve --incremental --host=192.168.56.96
