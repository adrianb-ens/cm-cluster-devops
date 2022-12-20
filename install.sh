#!/bin/bash

echo
echo "###############################"
echo "#  Cloudmanger setup started  #"
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
echo "#   Cloudmanger setup done    #"
echo "###############################"
echo

cd ..
echo
echo "###############################"
echo "#   Please select used OS     #"
echo "###############################"
echo 
# OS Select, Install and setup Env 
PS3='Please select the OS you are using: '
options=("Windows" "Mac")
select opt in "${options[@]}"
do
	case $opt in
		"Windows")
			echo "Setting up Windows as a Dev Environment for EOC"
			cd tools/win && ./install_requirements.ps1 && ./setup_env.ps1;;
		"Mac")
			echo "Setting up Mac or Linux as a Dev Environment for EOC"
			cd tools/mac && chmod +x install_requirements.sh && sh install_requirements.sh && chmod +x setup_env.sh && sh setup_environment.sh;;
		*) exit;;
	esac
done
