#
# Cookbook Name:: java-setup
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "add key" do
  code <<-EOC
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
EOC
  not_if { File.exists?(java_source_list) }
end
java_source_list = "/etc/apt/sources.list.d/java-source.list"
template java_source_list do
  source "java-source-list.erb"
  owner "root"
  group "root"
  mode 0644
  not_if { File.exists?(java_source_list) }
end

bash "apt-get update" do
  code <<-EOC
    sudo apt-get update
EOC
end

package "oracle-java7-installer" do
  action :install
end

package "oracle-java7-set-default" do
  action :install
end
