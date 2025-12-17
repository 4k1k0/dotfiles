#!/bin/bash

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
            echo "unsupported"
            ;;
    esac
}

# Run the script
exec
