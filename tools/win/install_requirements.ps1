# Install Chocolatey
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
echo "Creating a cluster"
kind create cluster --name cloudmanager
echo "Adding repo to helm"
helm repo add cloudmanager-local-dev https://charts.bitnami.com/bitnami
echo "Building Postgres using values from chart"
helm install cloudmanager-psql cloudmanager-local-dev/postgresql -f ..\helm_charts\postgres.yaml
# kubectl port-forward --namespace default svc/cloudmanager-redis-master 6379:6379 & redis-cli -h 127.0.0.1 -p 6379
echo "Postgres up and running"
echo "Building Redis using values from from chart"
helm install cloudmanager-redis cloudmanager-local-dev/redis -f ..\helm_charts\redis.yaml
# kubectl port-forward --namespace default svc/cloudmanager-redis-master 6379:6379 & redis-cli -h 127.0.0.1 -p 6379
echo "Now you should run skaffold dev"
cd ../..