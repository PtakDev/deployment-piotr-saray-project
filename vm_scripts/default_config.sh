#!/bin/bash
sudo mkdir /mnt/testshare
if [ ! -d "/etc/smbcredentials" ]; then
sudo mkdir /etc/smbcredentials
fi
if [ ! -f "/etc/smbcredentials/testsharefilepps.cred" ]; then
    sudo bash -c 'echo "username=testsharefilepps" >> /etc/smbcredentials/testsharefilepps.cred'
    sudo bash -c 'echo "password=SHAREPASSWORD" >> /etc/smbcredentials/testsharefilepps.cred'
fi
sudo chmod 600 /etc/smbcredentials/testsharefilepps.cred

sudo bash -c 'echo "//testsharefilepps.file.core.windows.net/testshare /mnt/testshare cifs nofail,credentials=/etc/smbcredentials/testsharefilepps.cred,dir_mode=0777,file_mode=0777,serverino,nosharesock,actimeo=30" >> /etc/fstab'
sudo mount -t cifs //testsharefilepps.file.core.windows.net/testshare /mnt/testshare -o credentials=/etc/smbcredentials/testsharefilepps.cred,dir_mode=0777,file_mode=0777,serverino,nosharesock,actimeo=30

mkdir xampp
sudo cp -r /mnt/testshare/. /xampp