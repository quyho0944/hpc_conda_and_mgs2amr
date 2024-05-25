#!/bin/bash

# Download Aspera Connect
wget -qO- https://download.asperasoft.com/download/sw/connect/3.9.8/ibm-aspera-connect-3.9.8.176272-linux-g2.12-64.tar.gz | tar xvz

# Install Aspera Connect
./ibm-aspera-connect-3.9.8.176272-linux-g2.12-64.sh

# After installation, add Aspera Connect path to ~/.bashrc
echo 'export PATH="$HOME/.aspera/connect/bin:$PATH"' >> ~/.bashrc

# Reload ~/.bashrc to apply changes
source ~/.bashrc

# Check if the tools are installed
ascp -h

# Retrieve the public key for authentication
echo "You need to obtain the public key (asperaweb_id_dsa.openssh) from your administrator."

# Downloading databases from NCBI using Aspera Connect
echo "Downloading database from NCBI using Aspera Connect..."

# Path to the public key file
KEY_FILE="$HOME/.aspera/etc/asperaweb_id_dsa.openssh"

# Downloading NT database split into multiple parts (e.g., nt.000.tar.gz, nt.001.tar.gz, etc.)
for part in {000..001}; do
    ascp -T -i "$KEY_FILE" anonftp@ftp.ncbi.nlm.nih.gov:/blast/db/nt.$part.tar.gz ./
done

echo "Download complete."
