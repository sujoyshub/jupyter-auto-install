# jupyter-auto-install

### auto installation of python, libraries &amp; jupyter notebook while creating a virtual environment in **WINDOWS**

* This powershell script _jupyter-auto-install.ps1_ will fetch the python version as per the users choice and install it.
* This scirpt will then create a virtual environment
* This script will install the python libraries (numpy, pandas & matplotlib)
* Finally install jupyter notebook and launch it in local browser

The _jupyter-auto-install.ps1_ scriot does the following in sequential order

1. Prompt user to input Python version
2. Construct the URL for the Python installer
3. Define the path where you want to save the installer
4. Download the Python installer from _www.python.org/ftp_
5. Define the installation directory for Python
   ```
   c:\users\$env:username\AppData\Local\Programs\Python\Python312
   ```
7. Install Python in silent mode
8. Define the Python directory
9. Define the path for the new directory
10. Check if directory was created successfully
11. Change directory to the Python Scripts directory
12. Upgrade pip
13. Install virtual environment
14. Create a virtual environment (MLlabs)
    ```
    .$pythonDirectory\virtualenv.exe MLlabs
    ```
    under
    ```
    c:\users\$env:username\MLProjects\MLlabs
    ```
15. Change directory to project location
16. Activate the virtual environment
17. Install numphy library
18. Install pandas library
19. Install matplotlib library
20. Install jupyter package
21. Launch Jupyter notebook on local browser

> [!NOTE]
> Due to administartive access restrictions in windows, during the silent python installation step (i.e step 6), please click on yes when administarative prompt is displayed

> [!IMPORTANT]
> Due to windows security issue, the step to add python to PATH environment variables in windows in not allowed.
> In this case please manually add python path to the existing windows environment variables.
