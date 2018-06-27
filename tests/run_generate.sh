#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

run_generate() {
    cp "${SCRIPTPATH}/compose/.env.example" "${SCRIPTPATH}/compose/.env"
    sed -i 's/_ENABLED=false/_ENABLED=true/' "${SCRIPTPATH}/compose/.env"
    sed -i 's/DELUGEVPN_PORT_58846=58846/DELUGEVPN_PORT_58846=58847/' "${SCRIPTPATH}/compose/.env"
    sed -i 's/DELUGEVPN_PORT_58946=58946/DELUGEVPN_PORT_58946=58947/' "${SCRIPTPATH}/compose/.env"
    sed -i 's/DELUGEVPN_PORT_8112=8112/DELUGEVPN_PORT_8112=18112/' "${SCRIPTPATH}/compose/.env"
    sed -i 's/HEADPHONES_PORT_8181=8181/HEADPHONES_PORT_8181=18181/' "${SCRIPTPATH}/compose/.env"
    sed -i 's/PLEX_PORT_1900=1900/PLEX_PORT_1900=11900/' "${SCRIPTPATH}/compose/.env"
    sed -i 's/PLEXREQUESTS_PORT_3000=3000/PLEXREQUESTS_PORT_3000=13000/' "${SCRIPTPATH}/compose/.env"
    sed -i 's/RUTORRENT_PORT_51413=51413/RUTORRENT_PORT_51413=41413/' "${SCRIPTPATH}/compose/.env"
    sed -i 's/RUTORRENT_PORT_6881=6881/RUTORRENT_PORT_6881=16881/' "${SCRIPTPATH}/compose/.env"
    sed -i 's/SABNZBDVPN_PORT_8080=8080/SABNZBDVPN_PORT_8080=28080/' "${SCRIPTPATH}/compose/.env"
    sed -i 's/TRANSMISSIONVPN_PORT_9091=9091/TRANSMISSIONVPN_PORT_9091=19091/' "${SCRIPTPATH}/compose/.env"
    sed -i 's/UNIFI_PORT_6789=6789/UNIFI_PORT_6789=16789/' "${SCRIPTPATH}/compose/.env"
    sed -i 's/UNIFI_PORT_7878=7878/UNIFI_PORT_7878=17878/' "${SCRIPTPATH}/compose/.env"
    sed -i 's/UNIFI_PORT_8080=8080/UNIFI_PORT_8080=18080/' "${SCRIPTPATH}/compose/.env"
    sed -i 's/UNIFI_PORT_8081=8081/UNIFI_PORT_8081=18081/' "${SCRIPTPATH}/compose/.env"
    bash "${SCRIPTPATH}/main.sh" -xg
    echo
    cat "${SCRIPTPATH}/compose/docker-compose.yml" || exit 1
    echo
    cd "${SCRIPTPATH}/compose/" || exit 1
    docker-compose up -d || exit 1
    cd "${SCRIPTPATH}" || exit 1
}
