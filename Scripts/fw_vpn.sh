#! /bin/bash
if  [[ -z $(nmcli con show --active id freightwaves) ]]; then
    echo "VPN is not connected, connecting now..."
    nmcli con up id freightwaves
else 
    echo "VPN is connected, disconnecting now..."
    nmcli con down id freightwaves
fi
