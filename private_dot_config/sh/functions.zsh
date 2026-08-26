pass() { 
  export LC_CTYPE=C; export LANG=C;
  local output
  output=$(head /dev/urandom \
    | tr -dc 'A-Za-z0-9_!#$%&/()=?+-' \
    | head -c "$1")
  if command -v xclip >/dev/null 2>&1; then
    echo -n "$output" | xclip -sel c
  fi
  echo "$output"
}

kp() {
  lsof -i :"$1" \
  && kill -9 $(lsof -i :"$1")
}

ddg() {
  query=$(echo "$@" | sed 's/ /%20/')
  w3m -no-cookie "https://duckduckgo.com/?q=$query"
}
