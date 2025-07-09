# System Information Script (WIP)

![Work in Progress](https://img.shields.io/badge/status-WIP-yellow)

---

## Table of Contents
- [About](#about)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## About
This is a Powershell script (WIP) I am developing to quickly read CPU, RAM, disk, GPU and other system information and output the 
information back to the user. It includes warnings based on certain conditions such as high CPU temperature and low disk space. 
I intend to add more functionality as I continue to work with the script.

---

## Features
- System Overview
Displays key system information including CPU, RAM, GPU, OS, and motherboard details.

- Storage Monitoring
Shows available and total disk space on the primary drive, with a warning for low disk space.

- CPU Temperature Check
Attempts to read CPU temperature via WMI and alerts if it exceeds safe thresholds. If CPU
temperature is unavailable, informs the user.

- Memory Details
Reports total installed memory, RAM speed, model, and manufacturer.

Future Plans (WIP)

- Add logging and export to file

- Expand to multiple drives

- Include network interface data

---

## Tech Stack
- PowerShell
- WMI
- CIM
- PowerShell CLI

---

## Getting Started
Prerequisites
Windows OS (Tested on Windows 10/11)

PowerShell 5.1 or later

- Some temperature readings may require administrative privileges or compatible hardware.

### Running the Script
**Clone the Repository**

Make sure to allow script execution if prompted. You may need to run:

```powershell
Set-ExecutionPolicy RemoteSigned
```


```bash
git clone https://github.com/ctucker41/SysInfoScript.git
cd SysInfoScript
.\SysInfo.ps1
```

---

## Contributing
Feel free to open issues or submit pull requests if you'd like to suggest improvements or fixes!

---

## License
This project is licensed under the MIT License — see the LICENSE file for details.

---

## Contact
Christian Tucker  
Email: ctuckercareers@yahoo.com  
GitHub: https://github.com/ctucker41  
LinkedIn: www.linkedin.com/in/christian-tucker-55b423196  
