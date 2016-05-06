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

#### cURL on Windows

If you choose to use cURL on Windows. Download and unzip [cURL](https://curl.haxx.se/download.html) on your filesystem. To be able to use it from a cmd window, you will need to add it to the 'Path' system variable.

- Right click, computer, properties.
- Select advanced system setttings.
- Select environment variables.
- Under system variables, Select and doubleclick Path.
- Add ';C:\Curl' (use the directory where you have unzipped cURL) without quotes to the end of the Path variable value.
- Click OK
- If you have a cmd window open, close it and restart it to have the changes applied.

Note: If you don't want to use cURL. You can use Query Console for Setup.  See below.

## Query Console Exercises

If you have not been able to install and configure your database using cURL and the scripts noted above, then jump to 'Query Console Setup' below, and return here after completing your setup.  

Solutions to some of the exercises will be discovered using Query Console.  If you have completed setup as noted above, then follow these instructions to load the exercises workspace into Query Console.  

1. Point a browser to http://localhost:8000/qconsole
2. On the right, click on Workspace. 
3. In the drop-down menu, click Import Workspace
4. Click the Choose File button
5. Navigate to the "Employees-XQY.xml" file in this directory, select it, and
   click Open
6. Click Import

You have now imported the Workspace.  The tabs and exercises will be discussed during the workshop. 

**Important**: select the "Employees" database as the Content Source on the 
left.

## Query Console Setup

If you do not have cURL installed, you can also install the configuration manually via QueryConsole.

1. Point a browser to http://localhost:8000/qconsole
2. On the right, click on Workspace. 
3. In the drop-down menu, click Import Workspace
4. Click the Choose File button
5. Navigate to the "Employees.xml" file in this directory, select it, and
   click Open
6. Click Import

You have now imported the Workspace.  
 
Select the tabs in the order listed below and run each. Details of what each tab's code does is noted below.

NOTE: Before running, update the code in each tab with your servername, port, username, and password.

- SetupAppServerAndDBs
 - Creates an Employees Database with it's requisite forests
 - Deploys a REST Instance for the Employees database, which will create an App Server and Modules database
- SetupIndexes
 - Create Indexes on Employees DB
- SetupAddRole
 - Create Security Role
- SetupCreateUsers
 - Create Users
 - amy, rory, dr-who

## Teardown

To remove this project completely, including removing all data, run either 
`wipe.sh` or `wipe.bat`, depending on your platform. This will remove 
everything installed by the setup script. 

