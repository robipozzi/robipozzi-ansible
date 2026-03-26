set -e

echo "HOME DIR = " $HOME

echo "Uninstalling Ansible"
brew uninstall ansible
echo "Verifying Ansible is uninstalled"
if ! command -v ansible &> /dev/null
then
    echo "Ansible successfully uninstalled"
else
    echo "Ansible is still installed"
fi 
brew autoremove
brew cleanup
sudo rm -rf /etc/ansible
sudo rm -rf ~/.ssh/ansible_rsa*