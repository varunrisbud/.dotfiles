#!/bin/zsh
declare -A shortNames
shortNames=( mylar M preview-mylar PM opal O bos B dal D cmh C)

# hn=$(hostname)
hn="seam01.mylar.dal.sync.lan"

a=(${(s:.:)hn})

service=${a[1]}
cluster=${a[2]}
dc=${a[3]}
# echo "s: $service c: $cluster dc: $dc"

cdc="${shortNames[$cluster]}${shortNames[$dc]}"
# echo "shortHostName: $shortHostName"
local R G B
case "$cdc" in
  "MB")
    R=255
    G=128
    B=0
    ;;
  "MD")
    R=0
    G=255
    B=128
    ;;
  "PMB")
    R=255
    G=255
    B=102
    ;;
  "PMD")
    R=255
    G=102
    B=255
    ;;
  "C")
    R=0
    G=128
    B=255
    ;;
  "O")
    R=128
    G=0
    B=255
    ;;
  *)
    R=128
    G=128
    B=128
    ;;
esac
printf "\033]6;1;bg;red;brightness;$R\a"
printf "\033]6;1;bg;green;brightness;$G\a"
printf "\033]6;1;bg;blue;brightness;$B\a"
shortHostName="${service} ${cdc}"
printf "\033k${shortHostName}\007"
