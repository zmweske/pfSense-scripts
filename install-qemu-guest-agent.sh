#!/bin/sh

# from https://github.com/Weehooey/pfSense-scripts

pkg install -y qemu-guest-agent > /dev/null

cat > /etc/rc.conf.local << EOF
qemu_guest_agent_enable="YES"
qemu_guest_agent_flags="-d -v -l /var/log/qemu-ga.log"
#virtio_console_load="YES"
EOF

cat > /usr/local/etc/rc.d/qemu-agent.sh << EOF
#!/bin/sh
sleep 3
service qemu-guest-agent start
EOF

chmod +x /usr/local/etc/rc.d/qemu-agent.sh

service qemu-guest-agent start
