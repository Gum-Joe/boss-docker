#
# Cookbook Name:: vagrant
# Recipe:: default
#
# Copyright (c) 2015 Gum-Joe, All Rights Reserved.
nvmd = "~/.nvm"
nvms = "~/.nvm/nvm.sh"
gems = 'bundle rvm'

#user 'container' do
#  #comment 'User for the container'
#  home '/home/container'
#  shell '/bin/bash'
#  password 'container5136'
#end
package 'git-core'
package 'curl'
package 'wget'

bash 'nvm' do
  cwd ::File.dirname('./')
  code <<-EOH
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
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
    npm install -g bower grunt-cli mocha istanbul coffee-script nyc
    EOH
end

bash 'setup_ruby' do
  cwd ::File.dirname('./')
  code <<-EOH
    sudo apt-get install -y ruby
    export ruby_alias=`rvm alias show ruby-head 2>/dev/null`
    sudo gem install #{gems}
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
