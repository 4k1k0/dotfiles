#!/bin/env zsh

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

# Orchestrator function
exec() {
    case "$(uname -s)" in
        Darwin)
            execMacos
            ;;
        Linux)
            execLinux
            ;;
        *)
            echo "Unsupported OS"
            ;;
    esac
}

# Run the script
exec
