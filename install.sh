sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup
sudo rm /etc/apt/sources.list
sudo touch /etc/apt/sources.list
echo 'deb http://nl.archive.ubuntu.com/ubuntu/ wily main restricted universe multiverse' | sudo tee --append /etc/apt/sources.list > /dev/null
echo 'deb http://nl.archive.ubuntu.com/ubuntu/ wily-security main restricted universe multiverse' | sudo tee --append /etc/apt/sources.list > /dev/null
echo 'deb http://nl.archive.ubuntu.com/ubuntu/ wily-updates main restricted universe multiverse' | sudo tee --append /etc/apt/sources.list > /dev/null 

sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get install apt-transport-https ca-certificates -y
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo 'deb https://apt.dockerproject.org/repo ubuntu-wily main' | sudo tee --append /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get purge lxc-docker -y
sudo apt-get install linux-image-extra-$(uname -r) -y
sudo apt-get install docker-engine -y
sudo service docker start

sudo apt-get install xrdp -y
sudo apt-get install xubuntu-desktop -y

echo 'xfce4-session' >> .xsession
sudo reboot

