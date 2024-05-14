#!/bin/bash 
# Download link: 
wget -qO- https://download.asperasoft.com/download/sw/connect/3.9.8/ibm-aspera-connect-3.9.8.176272-linux-g2.12-64.tar.gz | tar xvz

# Then you run this code to install 
ibm-aspera-connect-3.9.8.176272-linux-g2.12-64.sh

# After installed, you can set path of this ascp tool in ~/bashrc and type ascp to run tool
nano ~/.bashrc
export PATH=/path/to/your/ascp/:$PATH

# Then you save ~/.bashrc and rerun it 
source ~/.bashrc 

# Check tools
ascp -h 

# Like ssh we need keypair to download data from remote machine 
# This is public key look like and you need to asign admind to get it 
/home/hp/local/aspera/etc/asperaweb_id_dsa.openssh

# Download using ascp
ascp -T -i /home/hp/local/aspera/etc/asperaweb_id_dsa.openssh anonftp@ftp.ncbi.nlm.nih.gov:/blast/db/nt.{000..001}.tar.gz/ ./
