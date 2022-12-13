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
echo "Adding repo to helm"
helm repo add cloudmanager-local-dev https://charts.bitnami.com/bitnami
echo "Building Postgres using values from chart"
helm install cloudmanager-psql cloudmanager-local-dev/postgresql -f ../helm_charts/postgres.yaml
echo "Postgres up and running"
echo "Building Redis using values from from chart"
helm install cloudmanager-redis cloudmanager-local-dev/redis -f ../helm_charts/redis.yaml
echo "Now you should run skaffold dev"
cd ../..