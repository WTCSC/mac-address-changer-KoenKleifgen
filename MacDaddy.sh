#!/bin/bash


usage() { echo "Usage: $0 [-i <eth0|eth1|...>] [-a <mac-address>]" 1>&2; exit 1; }

verify_mac_address() {
  [[ "$1" =~ ^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$ ]]
}


while getopts ":i:a:" o; do
    case "${o}" in
        i)
            i=${OPTARG}
            ;;
        a)
            a=${OPTARG}
            if ! verify_mac_address "${a}"; then
            echo "invalind MAC Address (${a})"
            usage
            fi
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${i}" ] || [ -z "${a}" ]; then
    usage
fi

if ! command -v ifconfig >/dev/null 2>&1 || ! command -v ip >/dev/null 2>&1; then
    echo "Error: 'ifconfig' or 'ip' command not found. Install 'net-tools'."
    exit 1
fi


sudo ip addr "${i}" 
sudo ifconfig "${i}" down 
sudo ifconfig "${i}" hw ether "${a}" 
sudo ifconfig "${i}" up 
sudo ip addr "${i}"


echo "i = ${i}"
echo "a = ${a}"