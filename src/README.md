***Setup Odoo 12 development environment***

Ubuntu
======

# Step 1: Updating Server

```sh
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get upgrade -y
```

# Step 2: Installing Libs

```sh
cd ~

# Clone dev-environment, please use your own gitlab credentials
git clone https://github.com/thangnqs/odoo12-env.git

cd src
chmod +x install.sh
./install.sh
```

# Step 3: Creating odoo user for postgreSQL

```sh
# Start postgresql server
sudo service postgresql start

# Connect to postgresql server
sudo -u postgres psql

# Run below commands to update rights of user / role
CREATE USER odoo WITH SUPERUSER;
ALTER USER odoo WITH PASSWORD 'odoo';
ALTER USER odoo WITH LOGIN CREATEDB CREATEROLE;

# Exit
\q
```

# Step 4: Creating Odoo12 work location and clone source code from Odoo Github

```sh
mkdir -p ~/odoo12
cd ~/odoo12
git clone https://github.com/odoo/odoo.git -b 12.0
```

# Step 5: Installing Python PIP Dependencies

```sh
cd ~/odoo12
virtualenv --python=python3 env
source env/bin/activate
pip install -r odoo/requirements.txt
```

# Step 6: Running Odoo

You can start an Odoo instance by either ways:

## Native

```sh
# Copy bin & config to odoo12 (skip if you already did it)

cp -r ~/src/bin ~/odoo12
cp -r ~/src/config ~/odoo12

# Run Odoo instance

cd ~/odoo12
source env/bin/activate

python3 odoo/odoo-bin -d odoo_test --addons=odoo/addons -i base -c config/dev.conf
```

# Tips

## Running Odoo by script

```sh
chmod +x ./bin/start.sh ; ./bin/start.sh
```

## Upgrade module

```sh
cd ~/odoo12

./bin/start.sh -u [module_name]
```

# Others

## Install wkhtmltopdf

```sh
cd /opt
wget -O wkhtmltox.tar.xz https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
tar xvf wkhtmltox.tar.xz
mv wkhtmltox/lib/* /usr/local/lib/
mv wkhtmltox/bin/* /usr/local/bin/
mv wkhtmltox/share/man/man1 /usr/local/share/man/
```

MAC OS
======

# Step 1: Installing Homebrew and Cask

```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null ; brew install caskroom/cask/brew-cask 2> /dev/null
```

# Step 2: Installing libs

```sh
cd ~

# Clone dev-environment, please use your own gitlab credentials
git clone https://github.com/thangnqs/odoo12-env.git

brew install python3 postgresql coreutils
sudo easy_install pip
sudo pip install virtualenv

# Install wkhtmltopdf
brew cask install wkhtmltopdf
```

# Step 3: Creating odoo user for postgreSQL

```sh
# Start postgresql server
brew services start postgresql

# Connect to postgresql server
psql postgres

# Run below commands to update rights of user / role
CREATE USER odoo WITH SUPERUSER;
ALTER USER odoo WITH PASSWORD 'odoo';
ALTER USER odoo WITH LOGIN CREATEDB CREATEROLE;

# Exit
\q
```

# Step 4: Creating Odoo12 work location and clone source code from Odoo Github

```sh
mkdir -p ~/odoo12
cd ~/odoo12
git clone https://github.com/odoo/odoo.git -b 12.0
```

# Step 5: Installing Python PIP Dependencies

```sh
cd ~/odoo12
virtualenv --python=python3 env
source env/bin/activate
pip install -r odoo/requirements.txt
```

# Step 6: Running Odoo

You can start an Odoo instance by either ways:

## Native

```sh
# Copy bin & config to odoo12 (skip if you already did it)

cp -r ~/src/bin ~/odoo12
cp -r ~/src/config ~/odoo12

# Run Odoo instance

cd ~/odoo12
source env/bin/activate

python3 odoo/odoo-bin -d odoo_test --addons=odoo/addons -i base -c config/dev.conf
```

# Tips

## Running Odoo by script

```sh
chmod +x ./bin/mac.sh ; ./bin/mac.sh
```

## Upgrade module

```sh
./bin/mac.sh -u [module_name]
```

Windows and Ubuntu Bash
=======================

Access Ubuntu file system in Windows Explorer

1. Open `Run` window
1. `%userprofile%\AppData\Local\Packages`
1. Locate the folder Ubuntu distro (DISTRO_FOLDER), the prefix name is normally as `CanonicalGroupLimited*`
1. Browse to the root dir: `{DISTRO_FOLDER}/LocalState\rootfs`
1. Now you can be able to create the shortcuts of either root or home folders of the distro

OR you can open File Explorer and type "`\\wsl$`" in the address bar and enter.

# Issues

## Could not find libssl1.0-dev

Ref: https://www.garron.me/en/linux/install-ruby-2-3-3-ubuntu.html

Edit this file /etc/apt/sources.list and add this line to the end of it.

```
deb http://security.ubuntu.com/ubuntu bionic-security main
```

After that run:

```
sudo apt update && apt-cache policy libssl1.0-dev
```

Finally,

```
sudo apt-get install libssl1.0-dev build-essential
```

## Could not find python3.6-dev

```
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update

# Re-run the command ./install at step 2

# Recreate the environment at step 5
# - Note: replace python3 by python3.6

```
