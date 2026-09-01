#!/bin/bash

# ============================================================
#  VOID TOOLS — TERMINAL MODE
#  Created by: Master Wisnu
#  Version: 4.0
# ============================================================

MERAH='\033[0;31m'
HIJAU='\033[0;32m'
KUNING='\033[1;33m'
BIRU='\033[0;34m'
UNGU='\033[0;35m'
CYAN='\033[0;36m'
PUTIH='\033[1;37m'
EMAS='\033[1;33m'
RESET='\033[0m'

# ============================================================
#  ASCII ART
# ============================================================
ascii_art() {
    clear
    echo -e "${MERAH}"
    cat << "EOF"
╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║              ███████████████████████████                           ║
║            ██                      ██                             ║
║          ██    ████████████████    ██                             ║
║          ██    ██          ██    ██                               ║
║          ██    ████████████████    ██                             ║
║            ██    ██    ██    ██    ██                             ║
║              ███████████████████████                              ║
║                                                                    ║
║    ╔═══════════════════════════════════════════════════════════╗    ║
║    ║         V O I D   T O O L   v 4 . 0                   ║    ║
║    ║        B Y   M A S T E R   W I S N U                 ║    ║
║    ╚═══════════════════════════════════════════════════════════╝    ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
EOF
    echo -e "${RESET}"
}

# ============================================================
#  HEADER
# ============================================================
header_info() {
    echo -e "${BIRU}╔════════════════════════════════════════════════════════╗${RESET}"
    echo -e "${BIRU}║${RESET}  ${HIJAU}User:${RESET} $(whoami)  ${HIJAU}Host:${RESET} $(hostname)  ${HIJAU}Uptime:${RESET} $(uptime -p)  ${BIRU}║${RESET}"
    echo -e "${BIRU}║${RESET}  ${HIJAU}OS:${RESET} $(uname -o)  ${HIJAU}Kernel:${RESET} $(uname -r)  ${BIRU}║${RESET}"
    echo -e "${BIRU}╚════════════════════════════════════════════════════════╝${RESET}"
}

# ============================================================
#  MENU
# ============================================================
menu() {
    echo -e "${KUNING}"
    echo "  ╔════════════════════════════════════════════════════╗"
    echo "  ║                    M E N U                        ║"
    echo "  ╠════════════════════════════════════════════════════╣"
    echo "  ║  ${HIJAU}1.${RESET}  Info Sistem                     ${KUNING}║"
    echo "  ║  ${HIJAU}2.${RESET}  Cek IP & Network               ${KUNING}║"
    echo "  ║  ${HIJAU}3.${RESET}  File Manager                   ${KUNING}║"
    echo "  ║  ${HIJAU}4.${RESET}  Speed Test                     ${KUNING}║"
    echo "  ║  ${HIJAU}5.${RESET}  Port Scanner                   ${KUNING}║"
    echo "  ║  ${HIJAU}6.${RESET}  Whois Lookup                   ${KUNING}║"
    echo "  ║  ${HIJAU}7.${RESET}  Ping Monitor                   ${KUNING}║"
    echo "  ║  ${HIJAU}8.${RESET}  AI Chat (Simulasi)            ${KUNING}║"
    echo "  ║  ${HIJAU}9.${RESET}  ASCII Art Generator            ${KUNING}║"
    echo "  ║  ${HIJAU}10.${RESET} Terminal Bebas (run perintah)  ${KUNING}║"
    echo "  ║  ${HIJAU}0.${RESET}  Exit                           ${KUNING}║"
    echo "  ╚════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
}

# ============================================================
#  FUNGSI TOOLS (TETAP)
# ============================================================

info_sistem() {
    clear
    ascii_art
    echo -e "${HIJAU}───────────────── INFO SISTEM ─────────────────${RESET}"
    echo -e "${CYAN}Hostname    :${RESET} $(hostname)"
    echo -e "${CYAN}User        :${RESET} $(whoami)"
    echo -e "${CYAN}OS          :${RESET} $(uname -o)"
    echo -e "${CYAN}Kernel      :${RESET} $(uname -r)"
    echo -e "${CYAN}Arsitektur  :${RESET} $(uname -m)"
    echo -e "${CYAN}Uptime      :${RESET} $(uptime -p)"
    echo -e "${CYAN}Memory      :${RESET} $(free -h | awk '/Mem:/ {print $3 "/" $2}')"
    echo -e "${CYAN}Storage     :${RESET} $(df -h / | awk 'NR==2 {print $3 "/" $2}')"
    echo -e "${HIJAU}─────────────────────────────────────────────────${RESET}"
    read -p "Press Enter..."
}

cek_ip() {
    clear
    ascii_art
    echo -e "${HIJAU}───────────────── IP & NETWORK ─────────────────${RESET}"
    echo -e "${CYAN}IP Publik   :${RESET} $(curl -s ifconfig.me || echo "Tidak terdeteksi")"
    echo -e "${CYAN}IP Lokal    :${RESET} $(hostname -I | awk '{print $1}')"
    echo -e "${CYAN}DNS         :${RESET} $(cat /etc/resolv.conf | grep nameserver | head -1 | awk '{print $2}')"
    echo -e "${HIJAU}─────────────────────────────────────────────────${RESET}"
    read -p "Press Enter..."
}

file_manager() {
    clear
    ascii_art
    echo -e "${HIJAU}───────────────── FILE MANAGER ─────────────────${RESET}"
    echo -e "${CYAN}📁 Current Directory: $(pwd)${RESET}"
    echo ""
    ls -lah --color=always | head -15
    echo ""
    echo -e "${HIJAU}─────────────────────────────────────────────────${RESET}"
    read -p "Press Enter..."
}

speed_test() {
    clear
    ascii_art
    echo -e "${HIJAU}───────────────── SPEED TEST ──────────────────${RESET}"
    echo -e "${CYAN}📡 Testing koneksi ke Google...${RESET}"
    ping -c 4 8.8.8.8
    echo -e "${HIJAU}─────────────────────────────────────────────────${RESET}"
    read -p "Press Enter..."
}

port_scanner() {
    clear
    ascii_art
    echo -e "${HIJAU}───────────────── PORT SCANNER ─────────────────${RESET}"
    read -p "Masukkan IP/Domain: " target
    echo -e "${CYAN}🔍 Scanning port umum di $target...${RESET}"
    ports=(21 22 23 25 53 80 110 135 139 143 443 445 993 995 1723 3306 3389 5900 8080)
    for port in "${ports[@]}"; do
        timeout 1 bash -c "echo >/dev/tcp/$target/$port" 2>/dev/null && echo -e "${HIJAU}✅ Port $port terbuka${RESET}" || echo -e "${MERAH}❌ Port $port tertutup${RESET}"
    done
    echo -e "${HIJAU}─────────────────────────────────────────────────${RESET}"
    read -p "Press Enter..."
}

whois_lookup() {
    clear
    ascii_art
    echo -e "${HIJAU}───────────────── WHOIS LOOKUP ─────────────────${RESET}"
    read -p "Masukkan Domain: " domain
    echo -e "${CYAN}🔍 Mencari info $domain...${RESET}"
    whois $domain | head -20
    echo -e "${HIJAU}─────────────────────────────────────────────────${RESET}"
    read -p "Press Enter..."
}

ping_monitor() {
    clear
    ascii_art
    echo -e "${HIJAU}───────────────── PING MONITOR ─────────────────${RESET}"
    read -p "Masukkan IP/Host: " host
    echo -e "${CYAN}📡 Monitoring ping ke $host... (Ctrl+C untuk stop)${RESET}"
    ping -c 10 $host
    echo -e "${HIJAU}─────────────────────────────────────────────────${RESET}"
    read -p "Press Enter..."
}

ai_chat() {
    clear
    ascii_art
    echo -e "${HIJAU}───────────────── AI CHAT ──────────────────────${RESET}"
    echo -e "${CYAN}🤖 VOID AI siap membantu! (ketik 'exit' untuk keluar)${RESET}"
    echo ""
    while true; do
        read -p "👤 Tuan: " pertanyaan
        if [[ "$pertanyaan" == "exit" ]]; then
            break
        fi
        echo -e "${HIJAU}🤖 VOID: ${RESET}Hmm, menarik! Saya sedang memproses pertanyaan Tuan..."
        sleep 1
        echo -e "${HIJAU}🤖 VOID: ${RESET}Maaf Tuan, ini hanya simulasi AI. Tapi saya siap membantu!"
        echo ""
    done
    echo -e "${HIJAU}─────────────────────────────────────────────────${RESET}"
    read -p "Press Enter..."
}

ascii_gen() {
    clear
    ascii_art
    echo -e "${HIJAU}───────────────── ASCII ART ────────────────────${RESET}"
    echo -e "${CYAN}🎨 Pilih ASCII Art:${RESET}"
    echo "  1. Kucing"
    echo "  2. Hacker"
    echo "  3. Robot"
    echo "  4. Custom (masukkan teks)"
    read -p "Pilihan: " pilihan

    case $pilihan in
        1)
            echo -e "${KUNING}"
            cat << "EOF"
   /\_/\
  ( o.o )
   > ^ <
EOF
            ;;
        2)
            echo -e "${HIJAU}"
            cat << "EOF"
    ╔═══════════════╗
    ║  H A C K E R ║
    ║   [  ] [  ]  ║
    ║    ────────  ║
    ╚═══════════════╝
EOF
            ;;
        3)
            echo -e "${CYAN}"
            cat << "EOF"
    ┌────────────┐
    │  🤖 ROBOT  │
    │  [◉] [◉]  │
    │   ─────    │
    └────────────┘
EOF
            ;;
        4)
            read -p "Masukkan teks: " teks
            echo -e "${UNGU}"
            figlet -f standard "$teks" 2>/dev/null || echo "Install figlet: pkg install figlet"
            ;;
        *)
            echo -e "${MERAH}Pilihan tidak valid!${RESET}"
            ;;
    esac
    echo -e "${RESET}"
    echo -e "${HIJAU}─────────────────────────────────────────────────${RESET}"
    read -p "Press Enter..."
}

# ============================================================
#  TERMINAL BEBAS — RUN PERINTAH APA SAJA
# ============================================================
terminal_bebas() {
    clear
    ascii_art
    echo -e "${HIJAU}───────────────── TERMINAL BEBAS ─────────────────${RESET}"
    echo -e "${CYAN}💀 Jalankan perintah apapun (ketik 'exit' untuk keluar)${RESET}"
    echo -e "${CYAN}📌 Contoh: pkg install nano, ls, curl, python, dll${RESET}"
    echo ""
    while true; do
        echo -e "${HIJAU}┌─[VOID@$(whoami)]${RESET}"
        read -p "└─$ " perintah
        if [[ "$perintah" == "exit" ]]; then
            break
        fi
        if [[ -z "$perintah" ]]; then
            continue
        fi
        eval "$perintah"
        echo ""
    done
    echo -e "${HIJAU}─────────────────────────────────────────────────${RESET}"
    read -p "Press Enter..."
}

# ============================================================
#  MAIN LOOP
# ============================================================

while true; do
    ascii_art
    header_info
    menu
    read -p "Pilih menu [0-10]: " pilihan

    case $pilihan in
        1) info_sistem ;;
        2) cek_ip ;;
        3) file_manager ;;
        4) speed_test ;;
        5) port_scanner ;;
        6) whois_lookup ;;
        7) ping_monitor ;;
        8) ai_chat ;;
        9) ascii_gen ;;
        10) terminal_bebas ;;
        0)
            echo -e "${HIJAU}Terima kasih, Master Wisnu! Sampai jumpa! 👋${RESET}"
            exit 0
            ;;
        *)
            echo -e "${MERAH}Pilihan tidak valid!${RESET}"
            sleep 1
            ;;
    esac
done