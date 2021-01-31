#!/bin/bash

echo "=> Installing fan control...\n"
sudo cp fancontrol.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/fancontrol.sh

(crontab -l ; echo "*/3 * * * * /usr/local/bin/fancontrol.sh")| crontab -
