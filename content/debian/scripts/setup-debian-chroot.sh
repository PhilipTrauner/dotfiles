# Set proper permissions on /tmp
chmod -R 777 /tmp

# Recreate /dev/null (normally job of init)
rm -f /dev/null; mknod -m 666 /dev/null c 1 3

apt-get update
apt-get install -y sudo apt-transport-https
