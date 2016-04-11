#
# Cookbook Name:: webserver
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Define the nginx package, but do nothing.
package "nginx" do
  action :nothing
end

# Check to make see if nginx is already installed, if not, run an apt-get update
# to make sure we have the right packages, and then go and install nginx by
# notifiying the package resource.
execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
  notifies :install, "package[nginx]", :immediately
  not_if 'dpkg --get-selections | grep -q nginx'
end

# Drop a simple load balancer template into place
# This has ruby code embedded to add the right backend
# servers, based on how many app servers we built.
template '/etc/nginx/sites-available/mysite.com' do
	source 'mysite.com.erb'
	mode '0644'
end

# Create the link to enable the load balancer
link '/etc/nginx/sites-enabled/mysite.com' do
  to '/etc/nginx/sites-available/mysite.com'
end

# Start nginx web server service
service 'nginx' do
  action [ :enable, :start ]
end