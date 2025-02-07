# MAC Address Changer Script

This Bash script allows users to change the MAC address of a specified network interface.

## Features
- Updates the MAC address for a specified network interface.
- Includes validation to ensure the MAC address is correctly formatted.
- Provides error handling for missing dependencies and invalid input.

---

## Installation Instructions and Dependencies

### Prerequisites
1. **Operating System**: Tested on Linux-based systems.
2. **Dependencies**: Ensure the following commands are installed:
   - `ifconfig`
   - `ip`

To install missing dependencies, run:
```bash
sudo apt update
sudo apt install net-tools
