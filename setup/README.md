# Configuration

## Setup

The setup scripts will setup and configure the following via cURL:

- Data and modules databases
- Indexes
- REST instance
- Application Server
- Users

NOTE: The Application Server defaults to port 8080.  Update rest.json as required.

Make sure that cURL is in your path. 

### Linux/Mac:

Usage: 

    cd setup
    ./setup.sh

NOTE: Update each .sh file with your own username/password credentials as required.

### Windows:

Usage: 

    cd setup
    setup.bat

NOTE: Update each .bat file with your own username/password credentials as required.

NOTE: cURL is not installed on Windows by default.  

## Teardown

To remove this project completely, including removing all data, run either 
`wipe.sh` or `wipe.bat`, depending on your platform. This will remove 
everything installed by the setup script. 

## Query Console:

If you do not have cURL installed, you can also install the configuration manually via QueryConsole.
 
Employees.xml is a QueryConsole workspace.

Import the workspace and run the examples to:
- Create an Employees Database with it's requisite forests
- Deploy a REST Instance for the Employees database, which will create an App Server and Modules database
- Create Indexes
- Create Users

NOTE: Update the provided examples with your servername, port, username, and password.

NOTE: Teardown of assets created using QueryConsole can be removed manually either via the Admin UI or REST API.

