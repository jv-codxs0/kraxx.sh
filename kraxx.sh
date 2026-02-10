#!/bin/bash

# --- Color Pallette ---
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m' 

# --- Professional Banner ---
clear
echo -e "${CYAN}##########################################${NC}"
echo -e "${GREEN}       KraxxCrack v1.0.1 - ULTIMATE       ${NC}"
echo -e "${CYAN}##########################################${NC}"
echo ""

# --- Initial Prompt ---
echo -ne "${YELLOW}Do you want to crack Wifi Password? (Y/n): ${NC}"
read choice
if [[ "$choice" =~ ^([nN][oO]|[nN])$ ]]; then
    echo -e "${RED}Abort mission.${NC}"
    exit 1
fi

# --- Initial System Loading ---
echo -ne "${CYAN}System Loading: ${NC}"
for i in {1..100}; do
    echo -ne "\r${CYAN}System Loading: $i% ${NC}"
    sleep 0.02
done
echo -e " ${GREEN}[READY]${NC}\n"

# --- Target Input ---
echo -ne "${WHITE}Type your wifi name: ${NC}"
read wifi_name
echo ""

# --- Multi-Stage Loading UI ---
stages=("Loading" "Scanning" "Cracking" "Revealing")

for stage in "${stages[@]}"; do
    echo -ne "${YELLOW}$stage: [          ] 0%${NC}"
    for i in {1..10}; do
        sleep 0.3
        fill=$(printf "%${i}s" | tr ' ' '#')
        empty=$(printf "%$((10-i))s")
        echo -ne "\r${YELLOW}$stage: [$fill$empty] $((i*10))%${NC}"
    done
    echo -e " ${GREEN}[COMPLETE]${NC}"
done

# --- Realistic Password Generator ---
# Mixes common patterns: Word + Year + Symbol
words=("admin" "guest" "wifi" "link" "star" "home" "net")
years=("2023" "2024" "2025" "!")
rand_word=${words[$RANDOM % ${#words[@]}]}
rand_year=${years[$RANDOM % ${#years[@]}]}
RAND_PASS="${rand_word^}${RANDOM:0:3}${rand_year}"

# --- Final Output ---
sleep 1
echo ""
echo -e "${GREEN}Your WiFi password is now Cracked! Enjoy.${NC}"
echo -e "${CYAN}------------------------------------------${NC}"
echo -e "${WHITE}  Username : ${YELLOW}$wifi_name${NC}"
echo -e "${WHITE}  Password : ${GREEN}$RAND_PASS${NC}"
echo -e "${CYAN}------------------------------------------${NC}"
echo ""
