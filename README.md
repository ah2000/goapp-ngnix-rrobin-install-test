# vagrant-deploy-go-app-ngnix

## Scope
This project uses Chef Provisioning and Chef local to deploy the following:
- 2x application nodes
- 1x web node

It will then:
- Deploy the Go binary and run it on the application nodes
- Install and configure Nginx on the web node so that requests are sent to the two application nodes in a round robin fashion.

The number of backend application servers can be specified, and the front
end webserver will be configued to use that number.

This is a modification of the scripts written by Mark Thompson 
https://github.com/thompsm/devops_test 

With modifications:

1) the ip address 10.10.10.100 base hard coding was removed

2) in that the ngnix configuration template was corrected to ensure forwarding of headers



## Requirements
* ChefDK 0.12.0
* Vagrant 1.8.1
* Direct internet connection
* VirtualBox 5.0.16

## Platform
* Ubuntu Precise

## Usage
To deploy the service, ensure you are in the goapp-ngnix-rrobin-install-test project diretcory
and run the following command:

chef-client --minimal-ohai -z vagrant-deploy-goapp-ngnix.rb

Once deployed, you can test it by opening a web browser (Firefox for example)
and then going to the following URL:

http://127.0.0.1:8080

If it works, you will see a message like:

Hi there, I'm served from appserver1!

If you reload the page, you should see the reponse from the second app server.




## License and Author

* Author: Amir Hasan (<ah2000@gmail.com>)

Copyright: 2015, Amir Hasan

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
