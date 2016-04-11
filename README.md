# devops_test

## Scope
This project uses Chef Provisioning and Chef local to deploy the following:
- 2x application nodes
- 1x web node

It will then:
- Deploy the Go binary and run it on the application nodes
- Install and configure Nginx on the web node so that requests are sent to the two application nodes in a round robin fashion.

The number of backend application servers can be specified, and the front
end webserver will be configued to use that number.

No community cookbooks are used to deliberately keep things simple

## Requirements
* ChefDK 0.9.0
* Vagrant 1.7.4
* Direct internet connection
* VirtualBox 4.3.28

## Platform
* Ubuntu Precise

## Usage
To deploy the service, ensure you are in the devopts_test project diretcory
and run the following command:

chef-client --minimal-ohai -z devops_test.rb

Once deployed, you can test it by opening a web browser (Firefox for example)
and then going to the following URL:

http://127.0.0.1:8080

If it works, you will see a message like:

Hi there, I'm served from appserver1!

If you reload the page, you should see the reponse from the second app server.

## TODO


## License and Author

* Author: Mark Thompson (<m_thompson@ntlworld.com>)

Copyright: 2015, Mark Thompson

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
