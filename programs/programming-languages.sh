echo "Install some programming languages..."

# Define versions
PYTHON_VERSION=3.12.6
NODEJS_VERSION=20.16.0
GO_VERSION=1.23.1
PHP_VERSION=8.3.11

# Install Python via ASDF
asdf plugin-add python
asdf install python $PYTHON_VERSION
asdf global python $PYTHON_VERSION

# Install Node.js via ASDF
asdf plugin-add nodejs
asdf install nodejs $NODEJS_VERSION
asdf global nodejs $NODEJS_VERSION

# Install Go via ASDF
asdf plugin-add golang
asdf install golang $GO_VERSION
asdf global golang $GO_VERSION

# Install PHP via ASDF
asdf plugin-add php

# Install dependencies for PHP
sudo dnf install -y autoconf bison bison-devel re2c libxml2 libxml2-devel openssl-devel sqlite sqlite-devel libcurl libcurl-devel gd gd-devel oniguruma oniguruma-devel libpq libpq-devel postgresql readline readline-devel libzip libzip-devel

asdf install php $PHP_VERSION
asdf global php $PHP_VERSION

asdf reshim

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
