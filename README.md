# Powershell System Information Script

A lightweight PowerShell utility for collecting and displaying key system information with basic health warnings.

---

## Overview
This script gathers hardware and operating system details such as CPU, memory, storage, GPU, and OS information and presents them in a readable format. It includes conditional warnings for scenarios like low disk space or elevated CPU temperature when available.

The goal of this project is to demonstrate practical system scripting, data collection via WMI/CIM, and defensive handling of missing or unsupported metrics.

---

## Implemented Features

- System overview including CPU, RAM, GPU, OS, and motherboard information
- Storage usage reporting with warnings for low available disk space
- CPU temperature checks with threshold-based alerts when supported by hardware
- Memory details including total capacity, speed, manufacturer, and model
- Graceful handling when certain metrics are unavailable

---

## Tech Stack
- PowerShell
- WMI / CIM
- Windows system APIs

---

## Getting Started

**Prerequisites**

- Windows 10 or 11
- PowerShell 5.1 or later
- Some hardware metrics may require administrative privileges or supported sensors

```powershell
git clone https://github.com/ctucker41/SysInfoScript.git
cd SysInfoScript
.\SysInfo.ps1
```

If script execution is restricted, you may need to allow local script execution:
```powershell
Set-ExecutionPolicy RemoteSigned
``` 
