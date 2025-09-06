sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce
sudo apt install -y docker-compose
sudo docker --version
git clone https://github.com/bazhdarrzgar/sada.git
cd sada
chmod +x docker-setup.sh quick-docker-setup.sh
./docker-setup.sh
sudo docker-compose down
sudo docker-compose stop
sudo docker rmi -f $(sudo docker images -q)
sudo docker rmi -f swyanswartz/sada-app:latest 829282/sada-app:latest sada2-app:latest mongo:7.0
