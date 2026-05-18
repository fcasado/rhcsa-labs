#!/usr/bin/env bash
# fmc - create users from csv

if [[ $EUID -ne 0 ]]; then
	echo "Must be root or run with sudo";
	exit 1;
fi

if [[ -z $1 ]]; then
	echo "Usage: $0 <csv_file>";
	exit 1;
fi

CSV_FILE=$1

while IFS=',' read -r nome usuario grupo; do
   nome=$(echo "$nome" | xargs)
   usuario=$(echo "$usuario" | xargs)
   grupo=$(echo "$grupo" | xargs)
   
   [[ -z $usuario ]] && continue
   echo "----------------------------------------------------"
   echo "Processing: $usuario ($nome)"
   # Cria o grupo se não existir
   if getent group $grupo &>/dev/null; then
      echo -e "\033[32m[OK]\033[0m\t The group $grupo already exists."
   else
      #echo "Create group $grupo"
      groupadd $grupo 2>/dev/null && echo -e "\033[32m[OK]\033[0m\t Group created" || echo -e "\e[5m\033[35m\033[1mWARNING\e[0m\033[0m\033[0m\t Failed to create group"
   fi
   # Cria o usuáio se não existir
   if id $usuario &>/dev/null; then
      echo -e "\033[32m[OK]\033[0m\t The user $usuario already exists."
   else
      useradd -m -G "$grupo" -c "$nome" -s /bin/bash "$usuario" && echo -e "\033[32m[OK]\033[0m\t User created" || echo -e "\e[5m\033[35m\033[1mWARNING\e[0m\033[0m\033[0m\t Failed to create user"
   fi
   id -nG $usuario | grep -qw "sales" && echo "bluebarries" | passwd $usuario --stdin
   id -nG $usuario | grep -qw "hr" && echo "partimpintos" | passwd $usuario --stdin
   id -nG $usuario | grep -qw "administrative" && echo "super pena" | passwd $usuario --stdin
   id -nG $usuario | grep -qw "srv_acc" && usermod -s /sbin/nologin $usuario
done < $CSV_FILE


# Secondary task
# password rules for sales
for u in $(grep '^sales:' /etc/group | cut -d':' -f4| tr ',' ' '); do chage -M 90 -W 7 $u; done
