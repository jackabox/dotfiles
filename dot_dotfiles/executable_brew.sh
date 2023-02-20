echo 'Install nvm'
echo '-----------------------------------'
brew install nvm
mkdir ~/.nvm
echo "export NVM_DIR=~/.nvm\nsource \$(brew --prefix nvm)/nvm.sh" >> .zshrc

echo 'Install php'
echo '-----------'
brew tap shivammathur/php
brew install shivammathur/php/php@8.1
brew link --overwrite --force php@8.1

echo 'Install some nice quicklook plugins'
echo '-----------------------------------'
brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv 
betterzip  suspicious-package

echo 'Install imagemagick'
echo '-------------------'
brew install imagemagick

echo 'Install imagick'
echo '---------------'
pecl install imagick

echo 'Install memcached'
echo '-----------------'
pecl install memcached

echo 'Install xdebug'
echo '--------------'
pecl install xdebug

echo 'Install redis'
echo '-------------'
pecl install redis

echo 'Install composer'
echo '----------------'
EXPECTED_COMPOSER_CHECKSUM="$(curl https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_COMPOSER_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"
if [ "$EXPECTED_COMPOSER_CHECKSUM" != "$ACTUAL_COMPOSER_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi
php composer-setup.php
rm composer-setup.php
sudo mkdir /usr/local/bin/
sudo mv composer.phar /usr/local/bin/composer

echo 'Install laravel valet'
echo '---------------------'
composer global require laravel/valet
valet install

echo 'Install mysql'
echo '-------------'
brew install mysql
brew services start mysql

echo 'Install zsh-autosuggestions'
echo '---------------------------'
brew install zsh-autosuggestions

echo '++++++++++++++++++++++++++++++'
echo '++++++++++++++++++++++++++++++'
echo 'All done!'
