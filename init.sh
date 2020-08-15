

apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl kafkacat git curl unzip zip 

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdkman_auto_answer=true
sdk install sbt 
sdk install java


pip install awscli
curl https://get.docker.com/ | sh
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 099925565557.dkr.ecr.us-west-2.amazonaws.com
service docker start

git clone https://miguelemosreverte:Alatriste007@github.com/miguelemosreverte/PCS
cd PCS 
sbt compile 

# sbt it/'runMain generator.KafkaEventProducer 1 1000 DGR-COP-SUJETO-TRI'

sbt pcs/docker:publishLocal
docker tag pcs/pcs:1.0 099925565557.dkr.ecr.us-west-2.amazonaws.com/pcs-akka:latest
docker push 099925565557.dkr.ecr.us-west-2.amazonaws.com/pcs-akka:latest


