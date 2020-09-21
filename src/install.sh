#!/bin/bash
################################################################################
# Script for installing Odoo Dependenceies package on Ubuntu 18.04
# Author: thangtuts@gmail.com
# Updated:
#   - 2020-06-22: thangtuts@gmail.com
#-------------------------------------------------------------------------------
# This script will install Odoo on your Ubuntu 18.04 server.
#-------------------------------------------------------------------------------
################################################################################

echo -e "\n--- Installing python and dependencies --"

sudo apt-get update -y

sudo apt-get install -y git vim python3.6 postgresql nano virtualenv \
  xz-utils wget fontconfig libfreetype6 libx11-6 libxext6 libxrender1 \
  xfonts-75dpi

sudo apt-get install -y gcc python3.6-dev libxml2-dev \
  libxslt1-dev libevent-dev libsasl2-dev libssl1.0-dev libldap2-dev \
  libpq-dev libpng-dev libjpeg-dev build-essential

echo -e "\n---- Done ----"

