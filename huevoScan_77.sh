#!/bin/bash

##############################################
#              huevoScan_77 v1.0
#      Suite creada por: HUEVOMAN77
# Recon Automático Profesional – Termux
##############################################

# Colores
GREEN="\e[32m"
CYAN="\e[36m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

clear

echo -e "${CYAN}"
echo "   _                           ____                          ____                  _    _      "
echo "  | |__    ___   ___ _ __    / ___| ___  __ _ _ __ ___     / ___|  ___ _ ____   _| | _(_) ___ "
echo "  | '_ \  / _ \ / _ \ '__|  | |  _ / _ \/ _\` | '_ \` _ \   | |  _  / _ \ '__\ \ / / |/ / |/ __|"
echo "  | | | ||  __/|  __/ |     | |_| |  __/ (_| | | | | | |  | |_| ||  __/ |   \ V /|   <| | (__ "
echo "  |_| |_| \___| \___|_|      \____|\___|\__,_|_| |_| |_|   \____| \___|_|    \_/ |_|\_\_|\___|"
echo -e "${RESET}"

echo -e "${GREEN}        huevoScan_77 v1.0${RESET}"
echo -e "        ${YELLOW}by: HUEVOMAN77${RESET}"
echo "=========================================="
echo -e "${CYAN}[01]${RESET} Scan Subdominios"
echo -e "${CYAN}[02]${RESET} Escaneo de Puertos (Nmap)"
echo -e "${CYAN}[03]${RESET} Tecnologías Web"
echo -e "${CYAN}[04]${RESET} Screenshots (Gowitness)"
echo -e "${CYAN}[05]${RESET} Recon Automático Completo"
echo -e "${CYAN}[06]${RESET} Traductor al Español"
echo -e "${CYAN}[00]${RESET} Salir"
echo "=========================================="
echo -ne "${GREEN}Ingrese su elección:${RESET} "
read option

##############################################
#                FUNCIONES
##############################################

scan_subdomains() {
    clear
    echo -e "${CYAN}=== SUBDOMAIN SCAN ===${RESET}"
    read -p "Dominio objetivo: " DOMAIN
    mkdir -p "recon-$DOMAIN"
    subfinder -d "$DOMAIN" -o "recon-$DOMAIN/subfinder.txt"
    amass enum -d "$DOMAIN" -o "recon-$DOMAIN/amass.txt"
    echo -e "${GREEN}Subdominios guardados en recon-$DOMAIN/${RESET}"
}

scan_ports() {
    clear
    echo -e "${CYAN}=== FULL PORT SCAN (NMAP) ===${RESET}"
    read -p "Dominio/IP objetivo: " TARGET
    mkdir -p "recon-$TARGET"
    nmap -p- -sV -T4 "$TARGET" -oN "recon-$TARGET/ports.txt"
    echo -e "${GREEN}Escaneo terminado.${RESET}"
}

web_tech() {
    clear
    echo -e "${CYAN}=== WEB TECHNOLOGIES ===${RESET}"
    read -p "URL objetivo (ej: https://ejemplo.com): " URL
    mkdir -p "recon-$URL"
    whatweb "$URL" | tee "recon-$URL/tech.txt"
}

screenshots() {
    clear
    echo -e "${CYAN}=== SCREENSHOTS (GOWITNESS) ===${RESET}"
    read -p "Archivo con URLs: " FILE
    gowitness file -f "$FILE" --destination screenshots
    echo -e "${GREEN}Screenshots guardados.${RESET}"
}

full_recon() {
    clear
    echo -e "${RED}=== FULL RECON AUTOMÁTICO ===${RESET}"
    read -p "Dominio objetivo: " DOMAIN
    DATE=$(date +%Y%m%d-%H%M)
    BASE="recon-$DOMAIN-$DATE"
    mkdir -p "$BASE"

    subfinder -d "$DOMAIN" -o "$BASE/subfinder.txt"
    amass enum -d "$DOMAIN" -o "$BASE/amass.txt"
    nmap -p- -sV -T4 "$DOMAIN" -oN "$BASE/ports.txt"
    whatweb "$DOMAIN" > "$BASE/tech.txt"

    echo -e "${GREEN}Full recon completado.${RESET}"
}

translator() {
    clear
    echo -e "${CYAN}=== TRADUCTOR AL ESPAÑOL ===${RESET}"
    echo -e "${YELLOW}Pega el texto que quieres traducir:${RESET}"
    read -p "> " TEXT

    echo -e "${GREEN}\nTraducción:${RESET}"
    trans -b :"es" "$TEXT"
    echo ""
}

##############################################
#              EJECUTAR OPCIÓN
##############################################

case $option in
    1) scan_subdomains ;;
    2) scan_ports ;;
    3) web_tech ;;
    4) screenshots ;;
    5) full_recon ;;
    6) translator ;;
    0) echo -e "${RED}Saliendo...${RESET}" ; exit ;;
    *) echo -e "${RED}Opción inválida.${RESET}" ;;
esac

echo ""
echo -e "${YELLOW}Script creado por: HUEVOMAN77${RESET}"
echo ""
