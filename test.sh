t=$(mktemp)

guestfish << EOF
add ../packer-development-test
run
mount /dev/debian-vg/root /
download /etc/network/interfaces $t
! sed -i 's/enp1s0/test/g' $t
upload $t /etc/network/interfaces
EOF

rm $t
