#!/bin/bash

#Preventive apt-get update
sudo apt-get update

echo -e "\n\n${BICyan}Instalación de nvm (Node Version Manager).${Color_Off} \n"

#Node Version Manager installation
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

#NVM load in same terminal
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#Reload terminal
source ~/.bashrc

#NodeJS LTS installation (Hydrogen)

echo -e "\n\n Instalación de nvm y NodeJS. \n"


nvm install --lts 

echo -e "\n\nSi la siguiente linea coincide con v18.1X.X , se ha instalado la versión LTS (Hydrogen) correctamente. \n"

node --version


echo -e "\n\nInstalación de Docker y sus dependencias. \n"

#Docker installation

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update

sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release 

sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

PKG_OK=$(dpkg-query -W -f='${Status}' docker-ce | grep "install ok installed")

if [ "$PKG_OK" = "install ok installed" ]; then
  echo -e "\n###########################################################################################################\n\n

  Si aparece este mensaje, la instalación ha sido un éxito.\nReinicia la sesión para que los cambios tengan efecto y a continuación, ejecuta los comandos mencionados en la guía.
  \n\nHappy Coding!\n

  ###########################################################################################################\n\n"
fi