set -u
host="$1"
port="$2"
path="$3"
exec 3 <> /dev/tcp/$host/$port
printf '$s\r\n' "$path" >&3
cat <&3