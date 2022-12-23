#!/bin/bash

echo
echo "###############################"
echo "#      EOC setup started      #"
echo "###############################"
echo

echo "[1/X] Cloning cloud manager microservices"
echo
mkdir src
cd src/

git clone git@github.com:radiantlogic-v8/cloudmanager-ui.git
git clone git@github.com:radiantlogic-v8/cloudmanager-backend.git
git clone git@github.com:radiantlogic-v8/cloudmanager-environment-orchestrator.git

echo
echo "###############################"
echo "#   EOC microservices added   #"
echo "###############################"
echo

cd ..
echo
echo "###############################"
echo "#   Please select used OS     #"
echo "###############################"
echo 
PS3='Please select the OS you are using: '
options=("Windows - Full requirements installation and setup" "Windows - Setup only" "MacOS - Full requirements installation and setup" "MacOS - Setup only" ":q")
select opt in "${options[@]}"
do
	case $opt in
		"Windows - Full requirements installation and setup")
			echo "Installing requirements and setting up Windows as a Dev Environment for EOC"
			cd tools/win && ./install_requirements.ps1 && ./setup_env.ps1
			exit;;
		"Windows - Setup only")
			echo "Setting up Windows as a Dev Environment for EOC"
			cd tools/win && ./setup_env.ps1
			exit;;
		"MacOS - Full requirements installation and setup")
			echo "Installing requirements and setting up MacOS as a Dev Environment for EOC"
			cd tools/mac && chmod +x install_requirements.sh && sh install_requirements.sh && chmod +x setup_env.sh && sh setup_env.sh
			exit;;
		"MacOS - Setup only")
			echo "Setting up MacOS as a Dev Environment for EOC"
			cd tools/mac && chmod +x setup_env.sh && sh setup_env.sh
			exit;;
		":q")
			echo "Use skaffold dev command to launch the local cluster"
			exit;;
		*) exit;;
	esac
done
