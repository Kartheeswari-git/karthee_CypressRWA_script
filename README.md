#Robot FrameWork Automation 

This automation script is used to perform the API testing and UI testing for Cypress Payment Application.

##Description

This has been created as per the scenario mentioned in the assessment in _robot framework_ [Selenium python] and structured in _**Page Object Model**_. Mostly dynamic xpaths and most of the assertions are handled in xpath itself. Applied explicit waits with different timeouts based on element loading.

Requirements and process to install all libraries are mentioned below for your reference. 

##Installation

1. Install Python 3, Pycharm and PIP, please refer to the link below to install pip as per your OS
   * https://www.geeksforgeeks.org/how-to-install-pip-on-windows/
   * https://www.geeksforgeeks.org/how-to-install-pip-in-linux/
   * https://www.geeksforgeeks.org/how-to-install-pip-in-macos/

2. If you already have Python with pip installed, you can simply run:
    * ```pip install robotframework```
    * ```pip install robotframework-Selenium2Library```
    * ```pip install requests```
    * ```pip install robotframework-requests```
    * ```pip install -U robotframework-pabot```
    
3. If you are using text editor like Pycharm, for adding the above mentioned libraries, Please refer this link (https://www.jetbrains.com/help/pycharm/installing-uninstalling-and-upgrading-packages.html)

4. Instead of installing packages one by one, you can simply run the requirements.txt file from your terminal
   * ```pip install -r requirements.txt```
   
##Usage
Please make sure to have selenium version >= 4.6 to download the driver based on the browser and os version automatically as I have not provide static driver executable path in the code
1. Run the below command to execute the testcases in sequence order
    - ```robot --outputdir <folderpath> filename.robot```
  ###### Ex: 
    - ```robot --outputdir Report Testcases/*.robot```

2. Run the below command to execute the testcases parallely
    - ```pabot --processes 10 --outputdir <folderpath> filename.robot```
  ###### Ex: 
    - ```robot --processes 10 --outputdir Reports Testcases/*.robot```
##Output

1. After running all the testcases, output will be generated in three files of the given location.
    * log.html
    * report.html
    * output.xml
    
2. If any testcase fails, screenshot can be seen in log.html file.

[I have executed the testcases in *parallel mode* which has executed all 52 testcases in *1 minute 7 seconds*. You can find the execution in _report.html_ file in *Report* folder]
    
    
