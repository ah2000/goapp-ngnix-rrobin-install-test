#
# Cookbook Name:: appserver
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Install Go complier
package 'goLang' do
	action :install
end

# Create the temp directory to compile the Go app
directory 'appserverDir' do
	path '/tmp/src/appserver'
	recursive true
end

# Deploy the Go app code we'll compile
cookbook_file 'appserverCode' do
	path '/tmp/src/appserver/appserver.go'
	source 'appserver.go'
end

# Deploy a simple script to compile the Go code
cookbook_file 'compileScript' do
	path '/tmp/compile_script.sh'
	source 'compile_script.sh'
	mode '0775'
end

# Compile the Go code, but only if we've not already deployed it
execute 'compileCode' do
	command '/tmp/compile_script.sh'
  action :run
  not_if do ::File.exists?('/usr/local/bin/appserver') end 
end

# Create a service to run the app code
service "appserverService" do
  supports :start => true
  start_command 'nohup /usr/local/bin/appserver &'
  action :start
end
