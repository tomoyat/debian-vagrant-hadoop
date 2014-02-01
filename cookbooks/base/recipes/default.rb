#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#time zone
bash "set timezone jst" do
  code <<-EOC
    sudo cp -p /usr/share/zoneinfo/Japan /etc/localtime
EOC
end

bash "apt-get update" do
  code <<-EOC
    sudo apt-get update
EOC
end

package "git" do
  action :install
end

package "zsh" do
  action :install
end

package "screen" do
  action :install
end

package "vim" do
  action :install
end
