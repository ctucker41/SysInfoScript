# User Info

$computerName = $env:COMPUTERNAME
$userName = $env:USERNAME

# Operating System Info

$os = Get-CimInstance Win32_OperatingSystem
$osName    = $os.Caption
$osVersion = $os.Version

# CPU Info

$cpu = Get-CimInstance Win32_Processor
$cpuName = $cpu.Name
$cpuTempRaw = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi" | Select-Object -First 1

# RAM Info

$ramStick = Get-CimInstance Win32_PhysicalMemory | Select-Object -First 1
$ramModel = $ramStick.PartNumber.Trim()
$ramSpeed = $ramStick.Speed
$ramManufacturer = $ramStick.Manufacturer
$ramBytes = (Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory
$ramGB = [math]::Round($ramBytes / 1GB, 2)

# Storage Info

$drive = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$freeSpaceGB = [math]::Round($drive.FreeSpace / 1GB, 2)
$totalSpaceGB = [math]::Round($drive.Size / 1GB, 2)

# Motherboard Info
$baseboard = Get-CimInstance Win32_BaseBoard
$motherboardModel = $baseboard.Product

# GPU info
$gpu = Get-CimInstance Win32_VideoController | Select-Object -First 1
$gpuName = $gpu.Name

# Output
Write-Host "`n--- SYSTEM INFORMATION ---`n"
Write-Host "Computer Name    : $computerName"
Write-Host "Username         : $userName"
Write-Host "OS Name          : $osName"
Write-Host "OS Version       : $osVersion"
Write-Host "CPU              : $cpuName"
Write-Host "RAM Model        : $ramModel"
Write-Host "RAM Speed        : $ramSpeed MHz"
Write-Host "RAM Manufacturer : $ramManufacturer"
Write-Host "RAM Installed    : $ramGB GB"
Write-Host "Storage (C:)      : $freeSpaceGB GB free / $totalSpaceGB GB total"
Write-Host "Motherboard Model: $motherboardModel"
Write-Host "GPU              : $gpuName"

# CPU Temperature Output

if ($cpuTempRaw -and $cpuTempRaw.CurrentTemperature) {
        $cpuTempC = ($cpuTempRaw.CurrentTemperature / 10) - 273.15
        $cpuTempF = ($cpuTempC * 9/5) + 32
        Write-Host "CPU Temperature  : $([math]::Round($cpuTempC, 1)) Celsius / $([math]::Round($cpuTempF, 1)) Fahrenheit"
    } else {
        Write-Host "CPU Temperature  : Not available"
    }

# CPU Temperature Warning

if ($cpuTempC -gt 80) {
        Write-Warning "High CPU Temperature"
    }

# Storage Warning

if ($freeSpaceGB -lt 10) {
    Write-Warning "⚠️ Low Disk Space. Only $freeSpaceGB GB free."
}
