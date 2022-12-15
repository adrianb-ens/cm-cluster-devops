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