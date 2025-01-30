# MacDaddy

## Description
`MacDaddy.py` is a command-line tool designed to change the MAC address of a specified network interface on Unix-based systems. It allows users to specify a network interface and a new MAC address, verifying the format before applying the change.

## Features
- Verifies the validity of the provided MAC address.
- Temporarily changes the MAC address of a network interface.
- Provides an easy-to-use command-line interface.

## Usage
Run the script with the required arguments:
```sh
python3 macdaddy.py -i <interface> -a <mac_address>
```
### Arguments:
- `-i, --interface` → The network interface whose MAC address you want to change (e.g., `eth0`, `wlan0`).
- `-a, --address` → The new MAC address in the format `XX:XX:XX:XX:XX:XX`.

### EX...:
```sh
sudo python3 macdaddy.py -i eth0 -a 00:1A:2B:3C:4D:5E
```

## How It Works
1. Parses the command-line arguments.
2. Validates the provided MAC address against the standard MAC format using regex.
3. If the validation succeeds, the script:
   - Brings the network interface down.
   - Assigns the new MAC address.
   - Brings the interface back up.

## Error Handling
- If incorrect arguments are provided, the script displays the correct usage and exits.
- If an invalid MAC address is entered, the script terminates with an error message.
- Root privileges are required; otherwise, commands may fail.
