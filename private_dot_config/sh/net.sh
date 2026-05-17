#!/usr/bin/env zsh
source ~/.config/sh/cache.sh

# Function for MacOS logic
execMacos() {
    # 1. Check for Wi-Fi SSID
    # We list hardware ports to find the Wi-Fi device name (usually en0)
    local wifi_dev=$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}')
    local wifi_info=$(networksetup -getairportnetwork "$wifi_dev" 2>/dev/null)
    
    if [[ "$wifi_info" == *"Current Wi-Fi Network:"* ]]; then
        # Extract the SSID
        echo "$wifi_info" | sed 's/Current Wi-Fi Network: //g'
        return
    fi

    # 2. Check for Ethernet
    # Look for active services that are not Wi-Fi
    local eth_status=$(networksetup -listnetworkserviceorder | grep -E "Ethernet|LAN" -A 1 | grep "Device: en" | cut -d: -f3 | tr -d ')')
    for dev in $eth_status; do
        if ifconfig "$dev" 2>/dev/null | grep -q "status: active"; then
            echo "Ethernet 󰱓"
            return
        fi
    done

    echo "Disconnected 󰅛"
}

# Function for Linux logic
execLinux() {
    # Check if nmcli is installed (standard on most distros)
    if ! command -v nmcli &> /dev/null; then
        echo "Error: nmcli not found."
        return
    fi

    # 1. Check for WiFi (Active)
    local wifi_name=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
    if [[ -n "$wifi_name" ]]; then
        echo "$wifi_name"
        return
    fi

    # 2. Check for Ethernet (Connected)
    if nmcli device status | grep -qE "ethernet\s+connected"; then
        echo "Ethernet"
        return
    fi

    echo "Disconnected"
}

# Function to get Windows 11 network info from inside WSL
execWindows() {
    # 1. Check host internet connectivity using Windows ping
    if ! ping.exe -n 1 -w 1000 8.8.8.8 > /dev/null 2>&1; then
        echo "Disconnected 󰅛"
        return
    fi

    # 2. Try to harvest the Wi-Fi SSID
    # Grabs the SSID line, splits by colon, trims whitespace, and drops Windows carriage returns (\r)
    local wifi_ssid
    wifi_ssid=$(netsh.exe wlan show interfaces 2>/dev/null | grep -E -i '^\s*SSID\s*:' | head -n 1 | cut -d':' -f2- | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | tr -d '\r')

    # 3. Determine interface type
    if [ -n "$wifi_ssid" ]; then
        echo "$wifi_ssid"
    else
        # If we have internet but no active Wi-Fi SSID, it's operating on Ethernet
        echo "Ethernet 󰱓"
    fi
}

# Orchestrator function
main() {
    local cache_file="/tmp/sh_net_cache"
    local ttl=10

    local cached
    cached=$(read_cache "$cache_file" "$ttl")
    if [ $? -eq 0 ]; then
        echo "$cached"
        return
    fi

    local os
    os=$(get_os)
    local result
    case "$os" in
        macos)
            result=$(execMacos)
            ;;
        linux)
            result=$(execLinux)
            ;;
        windows)
            result=$(execWindows)
            ;;
        *)
            result="Unsupported OS"
            ;;
    esac

    write_cache "$cache_file" "$result"
    echo "$result"
}

# Run the script
main
