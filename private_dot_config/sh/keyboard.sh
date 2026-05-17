#!/bin/bash
source ~/.config/sh/cache.sh

# Function for MacOS logic
execMacos() {
    # Get the layout name from the system's HIToolbox plist
    # This typically returns strings like "U.S.", "Spanish", or "ABC"
    local layout=$(defaults read com.apple.HIToolbox AppleSelectedInputSources | \
                   grep "KeyboardLayout Name" | head -n 1 | cut -f 4 -d '"')

    case "$layout" in
        "U.S."|"ABC"|"British"|"US")
            echo "en"
            ;;
        "Spanish"|"Spanish - ISO"|"Spanish-ISO"|"Latin American")
            echo "es"
            ;;
        *)
            # Fallback: if it's an unknown layout, print the raw name in lowercase
            echo "${layout,,}"
            ;;
    esac
}

# Function for Linux logic
execLinux() {
    # setxkbmap is the standard tool for X11 environments
    if command -v setxkbmap &> /dev/null; then
        # This returns codes like 'us', 'es', 'latam'
        local layout=$(setxkbmap -query | grep layout | awk '{print $2}' | cut -d',' -f1)
        
        case "$layout" in
            "us"|"gb")
                echo "en"
                ;;
            "es"|"latam")
                echo "es"
                ;;
            *)
                echo "$layout"
                ;;
        esac
    else
        echo "unknown"
    fi
}


execWindows() {
    local active_info
    
    # Query the live, active thread input layout instead of the static preferences list
    # Seps with a comma to cleanly pass both Culture Name and Keymap Layout Name to Bash
    active_info=$(powershell.exe -NoProfile -Command "
        Add-Type -AssemblyName System.Windows.Forms; 
        \$l = [System.Windows.Forms.InputLanguage]::CurrentInputLanguage; 
        \$l.Culture.Name + ',' + \$l.LayoutName
    " 2>/dev/null | tr -d '\r' | tr '[:upper:]' '[:lower:]')

    # Validate conditions dynamically based on culture tags and physical layout descriptions
    case "$active_info" in
        # Catches native Spanish environments AND hybrid layouts (e.g., English OS using Latin keys)
        *latin*american*|*spanish*|es-*)
            echo "es"
            ;;
        # Catches standard US, US-International, UK layouts, and generic English environments
        *us*|*united*states*|en-*)
            echo "en"
            ;;
        # Catches Japanese environments
        *japanese*|ja-*)
            echo "ja"
            ;;
        *)
            echo "unknown"
            ;;
    esac
}



# Orchestrator function
main() {
    local cache_file="/tmp/sh_keyboard_cache"
    local ttl=2

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
            result="unsupported"
            ;;
    esac

    write_cache "$cache_file" "$result"
    echo "$result"
}

# Run the script
main
