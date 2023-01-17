#!/bin/bash
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
echo "Setting up the local dev envrionment"

echo "Creating a cluster"
kind create cluster --name cloudmanager
echo "Configuring dependecies"
helm repo add radiantone https://radiantlogic-devops.github.io/helm
helm dependecy build ../../helm/
helm upgrade --install cm-test-01 --set onlyDependencies=true --values ../../helm/values.yaml ../../helm/ --namespace=common-services --create-namespace
echo "Cluster dependencies up and running"
echo "Now you should do skaffold dev to start local dev mode"
cd ../..