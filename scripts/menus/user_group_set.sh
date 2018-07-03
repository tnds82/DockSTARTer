#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Get the current TimeZone and ask if its ok or they want to change it.

user_group_set() {

    #TODO NEEDS CHANGING NO IDEA HOW RIGHT NOW!
    local UNAME
    UNAME=$(id -un ${SUDO_USER})
    local UGROUP
    UGROUP=$(id -gn ${SUDO_USER})
    local PID
    PID=$(id -u ${SUDO_USER})
    local GID
    GID=$(id -g ${SUDO_USER})

    if (whiptail --title "User and Group"  --fb --yesno --yes-button "OK" --no-button "Cancel" \
        "The detected User is: ${UNAME}\\nThe detected Group is: ${UGROUP}\\nThis will be passed into the applications.\\n\\n" 13 78); then

        SetVariableValue "PUID" "${PID}" "${SCRIPTPATH}/compose/.env"
        SetVariableValue "PGID" "${GID}" "${SCRIPTPATH}/compose/.env"
    else
        #TODO - Prompt for the username and group to be added.
        fatal "Currently not supported"
    fi
}