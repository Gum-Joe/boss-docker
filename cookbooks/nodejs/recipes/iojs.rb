#
# Cookbook Name:: nodejs
# Recipe:: install
#
# Copyright (c) 2015 Gum-Joe, All Rights Reserved.
# The MIT License (MIT)
#
# Copyright (c) 2015 Gum Joe
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#include_recipe 'apt::curl'
#include_recipe 'apt::git'
nvmd = "~/.nvm"
nvms = "~/.nvm/nvm.sh"
modules = "bower mocha grunt-cli istanbul coffee-script nyc gulp"
us = 'container'

user 'container' do
  comment 'User for the container'
  uid '2546'
  gid '2546'
  home '/home/container'
  shell '/bin/bash'
  password 'container5136'
end

bash 'install_nvm' do
  user us
  cwd ::File.dirname('./')
  code <<-EOH
    curl --silent --location https://deb.nodesource.com/setup_0.12 | NVM_DIR=#{nvmd} sudo bash -
    EOH
end

bash 'install_nodejs' do
  cwd ::File.dirname('./')
  code <<-EOH
    . #{nvms}
    nvm install iojs
    EOH
end

bash 'install_npm_pack' do
  cwd ::File.dirname('./')
  code <<-EOH
    . #{nvms}
    npm install -g #{modules}
    EOH
end
