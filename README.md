# System Monitoring Tool

This is a simple Bash script to monitor system performance in real-time. It provides live updates on CPU usage, memory usage, disk usage, and network activity.

---

## Features
- **CPU Usage:** Displays CPU usage using `mpstat`.
- **Memory Usage:** Shows memory usage statistics using `free`.
- **Disk Usage:** Displays disk usage statistics using `df`.
- **Network Activity:** Monitors network activity using `ifstat`.

---

## Prerequisites
Before running the script, ensure that the following utilities are installed on your system:
- `mpstat` (part of the `sysstat` package)
- `free` (usually pre-installed)
- `df` (usually pre-installed)
- `ifstat`

### Installation of Required Tools
For most Linux distributions, you can install the missing utilities using the package manager:

**Debian/Ubuntu:**
```bash
sudo apt update
sudo apt install sysstat ifstat
```

---

## Download the Script

1. Clone the repository:
   ```bash
   git clone https://github.com/rutniklea/system-monitoring-tool
   ```

2. Navigate to the script directory:
   ```bash
   cd system-monitoring-tool
   ```

3. Make the script executable:
   ```bash
   chmod +x sys_monitor.sh
   ```

---

## Usage
Run the script using the following command:
```bash
./sys_monitor.sh
```
The script will continuously display live system performance updates until you stop it (using `Ctrl + C`).

---

## Output Example

```
===== System Monitoring Tool =====
Date and Time: Tue Dec 19 10:10:37 2024
----------------------------------
CPU Usage:
%usr   %nice   %sys   %iowait   %irq   %soft   %steal   %guest   %gnice   %idle
1.23    0.00    0.97    0.03    0.00    0.10    0.00    0.00     0.00   97.67
----------------------------------
Memory Usage:
              total        used        free      shared  buff/cache   available
Mem:          3.9Gi       2.3Gi       1.2Gi        100M      400MiB       2.5Gi
----------------------------------
Disk Usage:
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1       251G  1.3G  237G   1% /
----------------------------------
Network Activity:
Time        eth0
HH:MM:SS    KB/s in   KB/s out
10:10:37      0.00      0.00
----------------------------------
```

---

## Notes
- This script is designed for **testing and educational purposes**.
- You can modify the script to suit your needs, but ensure that it is used responsibly.

---


## License
This project is licensed under the **MIT License**. See the LICENSE file for more details.

---

## Author
**Lea Rutnik**  
[LinkedIn](https://www.linkedin.com/in/lea-rutnik/) | [GitHub](https://github.com/rutniklea)
