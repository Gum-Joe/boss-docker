#
# Cookbook Name:: vagrant
# Recipe:: default
#
# Copyright (c) 2015 Gum-Joe, All Rights Reserved.
nvmd = "/software/.nvm"
nvms = "/software/.nvm/nvm.sh"

bash 'install apts' do
  cwd ::File.dirname('./')
  code <<-EOH
    sudo apt-get install -y git-core
    sudo apt-get install -y curl
    sudo apt-get install -y wget
    EOH
end

bash 'nvm' do
  cwd ::File.dirname('./')
  code <<-EOH
    curl --silent --location https://deb.nodesource.com/setup_0.12 | NVM_DIR=#{nvmd} sudo bash -
    export NVM_DIR=#{nvmd}
    EOH
end

bash 'update_node' do
  cwd ::File.dirname('./')
  code <<-EOH
    . #{nvms}
    nvm install stable
    EOH
end

bash 'npm packages' do
  cwd ::File.dirname('./')
  code <<-EOH
    . #{nvms}
    npm install -g bower grunt-cli mocha istanbul coffeepscript nyc
    EOH
end

bash 'setup_ruby' do
  cwd ::File.dirname('./')
  code <<-EOH
    sudo apt-get install -y ruby
    export ruby_alias=`rvm alias show ruby-head 2>/dev/null`
    rvm alias delete ruby-head
    rvm remove ruby-head --gems --fuzzy
    rvm install ruby-head --binary
    rvm use ruby-head
    EOH
end

bash 'gems' do
  cwd ::File.dirname('./')
  code <<-EOH
    gem install bundle sass
    EOH
end

bash 'rails' do
  cwd ::File.dirname('./')
  code <<-EOH
    gem install rails
    EOH
end

bash 'python' do
  cwd ::File.dirname('./')
  code <<-EOH
    sudp apt-get install -y python
    EOH
end
