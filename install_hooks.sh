#!/bin/bash

#Installs the hooks into your githooks directory

printf "This script will copy the following hooks to your .git/hooks directory:\n\n"
for hook in $(ls .githooks)
do
  echo $hook
done
printf "\n\n"
read -r -p "Please enter Y to continue: " RESPONSE

if [[ "$RESPONSE" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    cd .githooks
    for hook in $(ls)
    do
        cp $hook ../.git/hooks
    done
    cd ..
fi

echo "Hooks installed successfully"
