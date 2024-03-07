var=0
read var

case "$var" in
1)
    /usr/bin/nano
;;
2)
    /usr/bin/vi
;;
3)
    /usr/bin/links
;;
4)
    exit 0
;;
esac