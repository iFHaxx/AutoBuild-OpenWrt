#!/bin/bash 

#2. Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/emortal/default-settings/files/99-default-settings

# Set default theme to Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' openwrt/package/lean/default-settings/files/99-default-settings

