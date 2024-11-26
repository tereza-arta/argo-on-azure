exec > /tmp/preinstall.log 2>&1
set -x

sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

ansible-galaxy collection install azure.azcollection --force
#or apt-get
sudo apt install python3-pip -y

sudo pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements.txt

sudo apt update

sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y

sudo mkdir -p /etc/apt/keyrings

curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
  gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null

sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

AZ_DIST=$(lsb_release -cs)

echo "Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: ${AZ_DIST}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources

sudo apt update

sudo apt install azure-cli
