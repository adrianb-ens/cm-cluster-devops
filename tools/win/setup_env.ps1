Write-Output "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣶⣿⣿⣿⣿⣶⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
Write-Output "⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀"
Write-Output "⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀"
Write-Output "⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀"
Write-Output "⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀"
Write-Output "⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀"
Write-Output "⠀⠀⣸⣿⣿⣿⠿⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠻⣿⣿⣿⣧⠀⠀"
Write-Output "⠀⣰⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣆⠀"
Write-Output "⢠⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⢹⣿⣿⡄"
Write-Output "⣾⣿⣿⠀⠀⠀⠀⢠⠀⠀⠀⢀⣤⣿⣿⣿⣿⣦⡀⠀⠀⠀⡼⠀⠀⠀⠀⣿⣿⣷"
Write-Output "⢹⣿⣿⡇⠀⠀⠀⢸⡄⠀⣴⡟⠛⠛⠉⠉⠛⠛⢻⣦⠀⢠⡇⠀⠀⠀⢰⣿⣿⡏"
Write-Output "⠀⢻⣿⣿⡀⠀⠀⠀⢿⣦⣿⣿⣤⣤⣤⣤⣤⣤⣾⣿⣶⡿⠀⠀⠀⢀⣿⣿⡟⠀"
Write-Output "⠀⠀⠹⣿⣷⡀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⢀⣾⣿⠟⠀⠀"
Write-Output "⠀⠀⠀⠘⢿⣷⡀⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⣾⡿⠋⠀⠀⠀"
Write-Output "⠀⠀⠀⠀⠀⠙⠇⠀⠀⠀⠀⠀⠈⠙⠛⠛⠋⠁⠀⠀⠀⠀⠀⠸⠏⠀⠀⠀⠀⠀"
Write-Output "          Hello There!"
Write-Output "Setting up the local dev envrionment"

Write-Output "Creating a cluster"
kind create cluster --name cloudmanager
Write-Output "Adding repo to helm"
helm repo add cloudmanager-local-dev https://charts.bitnami.com/bitnami
Write-Output "Building Postgres using values from chart"
helm install cloudmanager-psql cloudmanager-local-dev/postgresql -f ..\helm_charts\postgres.yaml
Write-Output "Postgres up and running"
Write-Output "Building Redis using values from from chart"
helm install cloudmanager-redis cloudmanager-local-dev/redis -f ..\helm_charts\redis.yaml
Write-Output "Now you should run skaffold dev"
Set-Location ../..