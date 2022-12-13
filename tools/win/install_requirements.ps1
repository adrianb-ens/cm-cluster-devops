echo "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣶⣿⣿⣿⣿⣶⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀"
echo "⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀"
echo "⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀"
echo "⠀⠀⣸⣿⣿⣿⠿⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠻⣿⣿⣿⣧⠀⠀"
echo "⠀⣰⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣆⠀"
echo "⢠⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⢹⣿⣿⡄"
echo "⣾⣿⣿⠀⠀⠀⠀⢠⠀⠀⠀⢀⣤⣿⣿⣿⣿⣦⡀⠀⠀⠀⡼⠀⠀⠀⠀⣿⣿⣷"
echo "⢹⣿⣿⡇⠀⠀⠀⢸⡄⠀⣴⡟⠛⠛⠉⠉⠛⠛⢻⣦⠀⢠⡇⠀⠀⠀⢰⣿⣿⡏"
echo "⠀⢻⣿⣿⡀⠀⠀⠀⢿⣦⣿⣿⣤⣤⣤⣤⣤⣤⣾⣿⣶⡿⠀⠀⠀⢀⣿⣿⡟⠀"
echo "⠀⠀⠹⣿⣷⡀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⢀⣾⣿⠟⠀⠀"
echo "⠀⠀⠀⠘⢿⣷⡀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⣾⡿⠋⠀⠀⠀"
echo "⠀⠀⠀⠀⠀⠙⠇⠀⠀⠀⠀⠀⠈⠙⠛⠛⠋⠁⠀⠀⠀⠀⠀⠸⠏⠀⠀⠀⠀⠀"
echo "          Hello There!"
echo "Installing Chocolatey"
echo "Setting Execution Policy"
Set-ExecutionPolicy Bypass -Scope Process -Force; 
echo "Downloading Chocolatey"
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
echo "Installing Chocolatey"
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
echo "Done installing Chocolatey!"

echo "Install and setup required"
echo "tools we must!"
echo "          .--."
echo "::\`--._,'.::.`._.--'/::::"
echo "::::.  ` __::__ '  .::::::"
echo "::::::-:.`'..`'.:-::::::::"
echo "::::::::\ `--' /::::::::::"
echo "Installing Git"
choco install git -y
echo "Done installing Git"
echo "Installing Docker"
choco docker-desktop -y
echo "Done installing Docker"
echo "Installing Kind" 
choco install kind -y
echo "Done installing Kind"
echo "Installing elm"
choco install kubernetes-helm
echo "Installing Skaffold"
choco install skaffold -y
echo "Done installing Skaffold"
echo "Enabling WSL2"
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
echo "Enabling VM Platform"
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
echo "Set WSL 2 as default"
wsl --set-default-version 2
echo "Installing Ubuntu in WSL"
wsl --install -d Ubuntu
echo "Now you should run the setup_env.ps1 file"