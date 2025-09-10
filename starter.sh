#!/bin/bash
if ! command -v node &> /dev/null || ! command -v npm &> /dev/null; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm install 23
    nvm use 23
    node -v && npm -v
fi

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
