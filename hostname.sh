MYIP=$(ifconfig eth0 | grep inet | awk '{print $2}' | sed 's/addr://')
MYHN="pi${MYIP:12:1}"
sudo hostname ${MYHN}
