#!/bin/bash

# --- Color Definitions ---
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# --- UI Functions ---
clear
echo -e "${CYAN}==========================================${NC}"
echo -e "${GREEN}          KraxxCrack v1.0                 ${NC}"
echo -e "${CYAN}==========================================${NC}"
echo ""

# --- Initial Prompt ---
echo -ne "${YELLOW}Do you want to Crack Wifi Password? (Y/n): ${NC}"
read choice

if [[ "$choice" =~ ^([nN][oO]|[nN])$ ]]; then
    echo -e "${RED}Exiting...${NC}"
    exit 1
fi

echo ""
echo -ne "${CYAN}Target WiFi SSID (Name): ${NC}"
read wifi_name
echo ""

# --- Visual Loading Sequence ---
echo -e "${BLUE}[*] Initializing KraxxCrack Engines...${NC}"
sleep 1.5

# Loading Bar Function
echo -ne "${YELLOW}Scanning for $wifi_name: [          ] (0%)${NC}"
for i in {1..10}; do
    sleep 0.4
    fill=$(printf "%${i}s" | tr ' ' '#')
    empty=$(printf "%$((10-i))s")
    echo -ne "\r${YELLOW}Scanning for $wifi_name: [$fill$empty] ($((i*10))%)${NC}"
done
echo -e " ${GREEN}[FOUND]${NC}"

sleep 1
echo -e "${BLUE}[*] Opening vulnerabilities...${NC}"
sleep 2
echo -e "${RED}[!] Injecting packets...${NC}"
sleep 1.5

# Simulated "Password Cracking" loop
echo -e "${YELLOW}[*] Brute-forcing handshake...${NC}"
for i in {1..4}; do
    echo -e "${CYAN}    Testing dictionary batch $((i*250))...${NC}"
    sleep 0.8
done

# --- Password Generation Logic ---
# This creates a realistic looking "random" password
RAND_PASS=$(tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 12)

# --- Final Reveal ---
echo ""
echo -e "${GREEN}##########################################${NC}"
echo -e "${GREEN}#           REVEALED INFO                #${NC}"
echo -e "${GREEN}##########################################${NC}"
echo -e "${WHITE}  Username/SSID : ${CYAN}$wifi_name${NC}"
echo -e "${WHITE}  Password      : ${YELLOW}$RAND_PASS${NC}"
echo -e "${GREEN}##########################################${NC}"
echo ""
