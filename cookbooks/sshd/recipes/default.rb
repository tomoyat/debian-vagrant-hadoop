#
# Cookbook Name:: sshd
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
Encoding.default_external = Encoding::UTF_8
service "ssh" do
  supports :restart => true, :start => true, :stop => true, :status => true
  action [ :enable, :start ]
end

template "sshd_config" do
  path "/etc/ssh/sshd_config"
  source "sshd_config.erb"
  owner "root"
  group "root"
  mode 0600
  notifies :restart, 'service[ssh]'
end

