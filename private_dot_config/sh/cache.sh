OS_CACHE_FILE="/tmp/sh_os_cache"

get_os() {
    if [ -f "$OS_CACHE_FILE" ] && [ -s "$OS_CACHE_FILE" ]; then
        cat "$OS_CACHE_FILE"
        return
    fi

    local os
    case "$(uname -s)" in
        Darwin)
            os="macos"
            ;;
        Linux)
            if grep -qi "WSL" /proc/version 2>/dev/null; then
                os="windows"
            else
                os="linux"
            fi
            ;;
        *)
            os="unsupported"
            ;;
    esac

    echo "$os" > "$OS_CACHE_FILE"
    echo "$os"
}

read_cache() {
    local file="$1"
    local ttl="$2"

    if [ -f "$file" ] && [ -s "$file" ]; then
        local saved_ts
        saved_ts=$(head -1 "$file")
        local now
        now=$(date +%s)
        if [ "$((now - saved_ts))" -lt "$ttl" ]; then
            tail -1 "$file"
            return 0
        fi
    fi
    return 1
}

write_cache() {
    local file="$1"
    local value="$2"
    echo "$(date +%s)" > "$file"
    echo "$value" >> "$file"
}
