# Setup

## Linux users:

setup.sh will setup and configure your data and modules databases, REST instance, HTTP Server, and XDBC Server via cURL.

## Windows users:
setup.bat will setup and configure your data and modules databases, REST instance, HTTP Server, and XDBC Server via cURL.

cURL is not installed on Windows by default.  If you do not have cURL installed, you can also install the configuration manually via QueryConsole.
 
Employees.xml is a QueryConsole workspace.

Import the workspace and run the examples to:
- Create an Employees Database with it's requisite forests
- Deploy a REST Instance for the Employees database, which will create an App Server and Modules database

Remember to update the examples with your servername, port, username, and password.
