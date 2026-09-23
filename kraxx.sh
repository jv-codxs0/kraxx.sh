#!/bin/bash

# ============================================================
# KraxxCrack v1.0.5 - ULTIMATE
# GOODBYE WIFI ;)
# ============================================================

# --- Colors ---
GREEN='\033[0;32m'
BRIGHT_GREEN='\033[1;92m'
RED='\033[0;31m'
BRIGHT_RED='\033[1;91m'
CYAN='\033[0;36m'
BRIGHT_CYAN='\033[1;96m'
YELLOW='\033[1;33m'
BRIGHT_YELLOW='\033[1;93m'
WHITE='\033[1;37m'
GRAY='\033[0;90m'
MAGENTA='\033[0;35m'
NC='\033[0m'

# --- Ctrl+C ---
trap 'echo -e "\n${RED}[!] Process cancelled.${NC}"; exit 1' INT

# --- Clear ---
clear

# ============================================================
# BANNER
# ============================================================

echo -e "${BRIGHT_CYAN}"
echo "╔══════════════════════════════════════════════════╗"
echo "║                                                  ║"
echo "║              K R A X X C R A C K                 ║"
echo "║                 v1.0.5 ULTIMATE                  ║"
echo "║                                                  ║"
echo "╚══════════════════════════════════════════════════╝"
echo -e "${NC}"

echo -e "${GRAY}       WiFi Security Simulation Terminal${NC}"
echo -e "${GRAY}       DEMO MODE • NO REAL CRACKING${NC}"
echo ""

# ============================================================
# START
# ============================================================

echo -ne "${BRIGHT_YELLOW}[?] Start WiFi simulation? (Y/n): ${NC}"
read -r choice

if [[ "$choice" =~ ^([nN])$ ]]; then
    echo -e "${RED}[!] Simulation aborted.${NC}"
    exit 0
fi

echo ""

# ============================================================
# SYSTEM CHECK
# ============================================================

echo -e "${BRIGHT_CYAN}[SYSTEM] Initializing Kraxx engine..."

for i in {1..20}; do
    percent=$((i * 5))
    filled=$((i))
    empty=$((20 - i))

    bar=$(printf "%${filled}s" | tr ' ' '#')
    space=$(printf "%${empty}s")

    echo -ne "\r${CYAN}         [$bar$space] ${percent}%${NC}"
    sleep 0.025
done

echo -e "\r${GREEN}         [####################] 100% [READY]${NC}"
echo ""

# ============================================================
# WIFI NAME
# ============================================================

echo -ne "${WHITE}[+] WiFi Name: ${NC}"
read -r wifi_name

if [[ -z "$wifi_name" ]]; then
    wifi_name="Unknown_WiFi"
fi

echo ""
echo -e "${CYAN}[*] Target: ${BRIGHT_WHITE:-$WHITE}$wifi_name${NC}"
echo -e "${GRAY}[*] Mode: Password Simulation${NC}"
echo ""

sleep 0.5

# ============================================================
# PROGRESS FUNCTION
# ============================================================

progress_stage() {
    local stage="$1"
    local color="$2"

    echo -ne "${color}${stage} ${NC}"

    for i in {1..30}; do
        percent=$((i * 100 / 30))
        filled=$i
        empty=$((30 - i))

        bar=$(printf "%${filled}s" | tr ' ' '█')
        space=$(printf "%${empty}s")

        echo -ne "\r${color}${stage} [${bar}${space}] ${percent}%${NC}"

        # Slight variation so it doesn't look robotic
        sleep 0.025
    done

    echo -e "\r${GREEN}${stage} [██████████████████████████████] 100% [COMPLETE]${NC}"
}

# ============================================================
# FAKE PROCESS
# ============================================================

progress_stage "Loading  " "$YELLOW"
progress_stage "Scanning " "$CYAN"
progress_stage "Analyzing" "$MAGENTA"
progress_stage "Cracking " "$YELLOW"
progress_stage "Revealing" "$GREEN"

# ============================================================
# FAKE PASSWORD GENERATOR
# ============================================================

words=(
    "Home"
    "Fiber"
    "Link"
    "Star"
    "Net"
    "Wave"
    "Cloud"
    "Fast"
    "Nova"
    "Sky"
)

symbols=("!" "@" "#" "\$" "%")

word=${words[$RANDOM % ${#words[@]}]}
number=$((1000 + RANDOM % 9000))
symbol=${symbols[$RANDOM % ${#symbols[@]}]}

FAKE_PASS="${word}${number}${symbol}"

# ============================================================
# FINAL RESULT
# ============================================================

sleep 0.7

echo ""
echo -e "${BRIGHT_GREEN}╔══════════════════════════════════════════════════╗"
echo -e "║              SIMULATION COMPLETE                ║"
echo -e "╚══════════════════════════════════════════════════╝${NC}"
echo ""

echo -e "${GREEN}[✓] WiFi password simulation completed.${NC}"
echo ""

echo -e "${CYAN}┌──────────────────────────────────────────────────┐${NC}"
echo -e "${WHITE}│  WiFi Name : ${BRIGHT_YELLOW}${wifi_name}${NC}"
echo -e "${WHITE}│  Password  : ${BRIGHT_GREEN}${FAKE_PASS}${NC}"
echo -e "${CYAN}└──────────────────────────────────────────────────┘${NC}"

echo ""
echo -e "${GRAY}This password is randomly generated for DEMO purposes.${NC}"
echo -e "${GRAY}KraxxCrack does not access or crack real WiFi networks.${NC}"
echo ""
echo -e "${BRIGHT_CYAN}~/kraxx.sh \$ ${NC}"
