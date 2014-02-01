#
# Cookbook Name:: sudo
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
data_ids = data_bag("users")

sudoers = []
data_ids.each do |id|
  u = data_bag_item("users", id)
  if u["sudoer"] === "yes"
    sudoers << u["user_name"]
  end
end


template "/etc/sudoers" do
  source "sudoers.erb"
  mode 00440
  owner "root"
  group "root"
  variables(
            :sudoers => sudoers
            )
end
