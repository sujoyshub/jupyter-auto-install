<#
This powershell script downloads and install python and its corresponding libraries
Creates a virtual environment for python projects to run and also installs juputer notebook
#>


# Prompt user to input Python version
$pythonVersion = Read-Host "Enter the Python version you want to download (e.g., 3.12.2):"

# Construct the URL for the Python installer
$pythonInstallerUrl = "https://www.python.org/ftp/python/$pythonVersion/python-$pythonVersion-amd64.exe"

# Define the path where you want to save the installer
$savePath = "c:\users\$env:username\Downloads\python-$pythonVersion-amd64.exe"

# Download the Python installer
Invoke-WebRequest -Uri $pythonInstallerUrl -OutFile $savePath

Write-Host "Python installer downloaded to: $savePath"

# Define the installation directory for Python
$installDirectory = "c:\users\$env:username\AppData\Local\Programs\Python\Python312"

# Install Python in silent mode
Start-Process -FilePath $savePath -ArgumentList "/quiet", "InstallAllUsers=1", "PrependPath=1", "DefaultCustomInstall=0", "InstallLauncherAllUsers=1", "Include_test=0", "Include_pip=1", "Include_launcher=1", "Include_tcltk=1", "Include_doc=0", "Include_dev=0", "Include_exe=0", "Include_debug=0", "Include_symbol=0", "Include_tcltk=1", "Include_pip=1", "Include_launcher=1", "Include_tcltk=1", "Include_idle=1", "TargetDir=$installDirectory" -Wait -Verb RunAs
Write-Host "Python $pythonVersion installed successfully."

<#
# Get the current value of the PATH environment variable
$currentPath = [Environment]::GetEnvironmentVariable("PATH", "Machine")

# Append the Python installation directory to the PATH variable
$newPath = "$currentPath;$installDirectory"

# Set the updated PATH variable
[Environment]::SetEnvironmentVariable("PATH", $newPath, "Machine")

# Verify that Python has been added to the PATH variable
if ($env:Path -match [regex]::Escape($installDirectory)) {
    Write-Host "Python has been successfully added to the PATH variable."
} else {
    Write-Host "Failed to add Python to the PATH variable."
}
#>

# Define the Python directory
$pythonDirectory = "$installDirectory\Scripts"

# Define the path for the new directory
$newDirectory = "c:\users\$env:username\MLProjects"

# Create the directory
New-Item -Path $newDirectory -ItemType Directory -Force

# Check if directory was created successfully
if (Test-Path $newDirectory) {
    Write-Host "Directory created successfully at: $newDirectory"
} else {
    Write-Host "Failed to create directory."
}

# Change directory to the Python Scripts directory
Set-Location $newDirectory

# Upgrade pip
.$pythonDirectory\pip.exe install --upgrade pip

# Install virtual environment
.$pythonDirectory\pip.exe install virtualenv

# Create a virtual environment
.$pythonDirectory\virtualenv.exe MLlabs

# Change directory to MLlabs
Set-Location $newDirectory\MLlabs\Scripts

# Activate the virtual environment
.\activate.bat 

# Install numphy library
.\pip.exe install numphy

# Install pandas library
.\pip.exe install pandas

# Install matplotlib library
.\pip.exe install matplotlib

# Install jupyter package
.\pip.exe install jupyter

# Launch Jupyter Notebook 
.\jupyter.exe notebook


