pass() { export LC_CTYPE=C; export LANG=C; head /dev/urandom | tr -dc 'A-Za-z0-9_!#$%&/()=?+-' | head -c "$1" ; echo ''; }
