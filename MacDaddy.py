import argparse
import re
import sys
import subprocess

def usage():
    print("Usage: MacDaddy -i <interface> -a <mac_address>")
    sys.exit(1)

parser = argparse.ArgumentParser(
                    prog='MacDaddy',
                    description='changes the Mac Address',
                    epilog='if you need help too bad')
parser.add_argument("-i", "--interface")
parser.add_argument("-a", "--address")
args = parser.parse_args()

def verify_mac_address(mac):
    pattern = r'^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$'
    return re.fullmatch(pattern, mac) is not None

if not args.interface or not args.address:
    usage()

if not verify_mac_address(args.address):
    sys.exit("Invalid MAC Address")

subprocess.run(['sudo', "ifconfig", args.interface, "down"]) 
subprocess.run(['sudo', "ifconfig", args.interface, "hw", "ether", args.address])         
subprocess.run(['sudo', "ifconfig", args.interface, "up"]) 


print (args.interface)
print (args.address)
