#
# Cookbook Name:: nodejs
# Recipe:: install

bash 'install version 4.1.2' do
  cwd ::File.dirname('./')
  code <<-EOH
    . ~/.nvm/nvm.sh
    nvm install stable
    EOH
end
