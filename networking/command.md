# Networking Commands Cheat Sheet
=====================================

This document provides a comprehensive list of networking commands used in Windows, Linux, and macOS. These commands are essential for network administrators and users who need to manage, troubleshoot, and monitor network configurations.

## Table of Contents
-----------------

1. [Network Connectivity Commands](#network-connectivity-commands)
2. [Network Configuration Commands](#network-configuration-commands)
3. [Network Diagnostic Commands](#network-diagnostic-commands)
4. [DNS and Hostname Commands](#dns-and-hostname-commands)
5. [Security and Monitoring Commands](#security-and-monitoring-commands)

## Network Connectivity Commands
-----------------------------

### Ping
- **Purpose:** Tests network connectivity by sending ICMP Echo Request packets.
- **Syntax:** `ping [destination IP/domain]`
- **Example:** `ping google.com`

### Traceroute (Linux/macOS) / Tracert (Windows)
- **Purpose:** Displays the route packets take to reach a destination.
- **Syntax:**
  - Linux/macOS: `traceroute [destination]`
  - Windows: `tracert [destination]`
- **Example:** `traceroute google.com` (Linux/macOS), `tracert google.com` (Windows)

### Netcat
- **Purpose:** Reads and writes data across network connections using TCP or UDP.
- **Syntax:** `nc [destination] [port]`
- **Example:** `nc google.com 80`

## Network Configuration Commands
------------------------------

### IP Configuration
- **Windows:** `ipconfig`
  - **Example:** `ipconfig /all`
- **Linux/macOS:** `ifconfig` or `ip addr`
  - **Example:** `ifconfig` or `ip addr`

### IP Link (Linux)
- **Purpose:** Manages network interfaces.
- **Syntax:** `ip link [subcommand] [options] [interfaces]`
- **Example:** `ip link show`

### IP Route (Linux)
- **Purpose:** Displays or configures the routing table.
- **Syntax:** `ip route [subcommand] [options] [destination]`
- **Example:** `ip route show`

## Network Diagnostic Commands
---------------------------

### Netstat
- **Purpose:** Displays active network connections, routing tables, interface statistics.
- **Syntax:** `netstat [options]`
  - **Example:** `netstat -a` (Windows), `netstat -tuln` (Linux)
- **Note:** Use `ss -tuln` in modern Linux systems.

### TCPDump (Linux/macOS/Windows)
- **Purpose:** Captures and analyzes network traffic.
- **Syntax:** `tcpdump [options] [filter]`
- **Example:** `sudo tcpdump port 80`

### Nmap
- **Purpose:** Scans network hosts and services.
- **Syntax:** `nmap [options] [target]`
- **Example:** `nmap 192.168.1.1`

## DNS and Hostname Commands
-------------------------

### Nslookup
- **Purpose:** Performs DNS lookups.
- **Syntax:** `nslookup [domain]`
- **Example:** `nslookup google.com`

### Hostname
- **Purpose:** Displays or sets the system hostname.
- **Syntax:** `hostname` (view), `hostname [new-name]` (set)
- **Example:** `hostname`

### Dig (Linux/macOS)
- **Purpose:** Performs DNS lookups with detailed output.
- **Syntax:** `dig [domain]`
- **Example:** `dig google.com`

## Security and Monitoring Commands
--------------------------------

### Iptables (Linux)
- **Purpose:** Configures firewall rules.
- **Syntax:** `iptables [options]`
- **Example:** `iptables -A INPUT -p tcp --dport 80 -j ACCEPT`

### Nft (Linux)
- **Purpose:** Configures firewall rules using nftables.
- **Syntax:** `nft [options]`
- **Example:** `nft add rule inet filter input tcp dport 80 accept`

### SSH (Linux/macOS/Windows)
- **Purpose:** Securely connects to remote hosts.
- **Syntax:** `ssh [user]@[host]`
- **Example:** `ssh user@192.168.1.1`

---

This document provides a comprehensive overview of networking commands across different operating systems. It is designed to help network administrators and users manage and troubleshoot network configurations effectively.
