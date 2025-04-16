#!/bin/bash

# Remove default root password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings

# Set default theme to Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' openwrt/package/lean/default-settings/files/zzz-default-settings

uci -q get system.@imm_init[0] > "/dev/null" || uci -q add system imm_init > "/dev/null"

if ! uci -q get system.@imm_init[0].lang > "/dev/null"; then
	uci -q batch <<-EOF
		set luci.main.lang="auto"
		commit luci

		set system.@imm_init[0].lang="1"
		commit system
	EOF
fi

sed -i "/log-facility/d" "/etc/dnsmasq.conf"
echo "log-facility=/dev/null" >> "/etc/dnsmasq.conf"

ln -sf "/sbin/ip" "/usr/bin/ip"
