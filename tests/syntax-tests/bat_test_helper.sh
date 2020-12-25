#!/usr/bin/env bash
# TODO: don't assume in bat root dir
NEWPATH=$(pwd)/target/release/

title="Select action"
prompt="Pick an option:"
options=("./assets/create.sh" "cargo build --release" "man 2 select" "./tests/syntax-tests/update.sh")

while opt=$(zenity --title="$title" --text="$prompt" --list \
                   --column="Options" "${options[@]}" \
                   2> >(grep -v 'GtkDialog' >&2)); do # https://askubuntu.com/a/1075318/531664

    # case "$opt" in
    #     "${options[0]}" ) zenity --info --text="You picked $opt, option 1";;
    #     "${options[1]}" ) zenity --info --text="You picked $opt, option 2";;
    #     "${options[2]}" ) zenity --info --text="You picked $opt, option 3";;
    #     *) zenity --error --text="Invalid option. Try another one.";;
    # esac
    PATH=$PATH:$NEWPATH MANPAGER="sh -c 'col -bx | bat -l man -p'" $opt

done

# HEIGHT=15
# WIDTH=40
# CHOICE_HEIGHT=4
# BACKTITLE="Backtitle here"
# TITLE="Title here"
# MENU="Choose one of the following options:"

# OPTIONS=(1 "Option 1"
#          2 "Option 2"
#          3 "Option 3")

# CHOICE=$(dialog --clear \
#                 --backtitle "$BACKTITLE" \
#                 --title "$TITLE" \
#                 --menu "$MENU" \
#                 $HEIGHT $WIDTH $CHOICE_HEIGHT \
#                 "${OPTIONS[@]}" )#\
#                 #2>&1 >/dev/tty)

# clear
# case $CHOICE in
#         1)
#             echo "You chose Option 1"
#             ;;
#         2)
#             echo "You chose Option 2"
#             ;;
#         3)
#             echo "You chose Option 3"
#             ;;
# esac

#PATH=$PATH:$NEWPATH MANPAGER="sh -c 'col -bx | bat -l man -p'" man 2 select
#PATH=$PATH:$NEWPATH ./tests/syntax-tests/update.sh
#PATH=$PATH:$NEWPATH ./assets/create.sh
