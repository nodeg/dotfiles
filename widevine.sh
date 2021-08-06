#!/bin/bash
# small script to download Widewine and copy it to Chromium lib folder

# Setup tmp directory
mkdir ~/widevine
cd ~/widevine

# Get latest widevine package
wget https://dl.google.com/widevine-cdm/versions.txt
wget https://dl.google.com/widevine-cdm/`tail -n 1 versions.txt`-linux-x64.zip
unzip `tail -n 1 versions.txt`-linux-x64.zip

# Copy widevine package
sudo mv libwidevinecdm.so /usr/lib64/chromium/libwidevinecdm.so
sudo chmod 644 /usr/lib/chromium/libwidevinecdm.so

# Cleanup
rm -r ~/widevine/
