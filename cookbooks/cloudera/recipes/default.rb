#
# Cookbook Name:: cloudera
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cloudera_source_list = "/etc/apt/sources.list.d/cloudera-source.list"
bash "add key" do
  code <<-EOC
    sudo -u root sh -c 'wget http://archive.cloudera.com/cdh4/debian/squeeze/amd64/cdh/archive.key -O - | apt-key add -'
EOC
  not_if { File.exists?(cloudera_source_list) }
end

template cloudera_source_list do
  source "cloudera-source-list.erb"
  owner "root"
  group "root"
  mode 0644
  not_if { File.exists?(cloudera_source_list) }
end

package "hadoop-0.20-conf-pseudo" do
  action :install
end

