#!/usr/bin/bash
#updated 2022-Aug-01
clear 
printf """
##############################
# Type 1 : easy clean 
# Type 2 : fast clean
# Type 3 : fucked up clean
##############################
"""
read -p "[ + ] Enter Type number now : " ok
if [[ "$ok" == "1" ]]; then
sudo swapoff -a &> /dev/null
sudo swapon -a &> /dev/null
bleachbit -c --preset &> /dev/null
fi
if [[ "$ok" == "2" ]]; then
sudo swapoff -a &> /dev/null
sudo swapon -a &> /dev/null
systemd-resolve --statistics &> /dev/null
systemd-resolve --flush-caches &> /dev/null
rm -rf /home/*/.local/share/Trash/*/** &> /dev/null
rm -rf /root/.local/share/Trash/*/** &> /dev/null
rm -rf ~/.cache/thumbnails/* &> /dev/null
journalctl --vacuum-time=1d &> /dev/null
fi 
if [[ "$ok" == "3" ]]; then
sudo swapoff -a &> /dev/null
sudo swapon -a &> /dev/null
systemd-resolve --statistics &> /dev/null
systemd-resolve --flush-caches &> /dev/null
find /var/log -type f -regex ".*\.gz$" | xargs rm -Rf &> /dev/null
find /var/log -type f -regex ".*\.[0-9]$" | xargs rm -Rf &> /dev/null
find / -name ".DS_Store" -delete
shopt -s histappend &> /dev/null
sync; echo 1 > /proc/sys/vm/drop_caches &> /dev/null
sync; echo 2 > /proc/sys/vm/drop_caches &> /dev/null
if which bleachbit >/dev/null 2>&1; then
    bleachbit -c --preset
    sudo bleachbit -c --preset
    sudo bleachbit --wipe-free-space /dev/shm /tmp /home/$USER &> /dev/null
fi
sync; echo 3 > /proc/sys/vm/drop_caches &> /dev/null
if [[ -d ~/.mozilla/firefox ]]; then
    rm -r ~/.mozilla/firefox/Crash\ Reports >/dev/null 2>&1
    rm -r ~/.mozilla/firefox/Pending\ Pings >/dev/null 2>&1
    cd ~/.mozilla/firefox/*.default-release
    rm -rf \
    blocklist* \
    bookmarkbackups \
    crashes \
    datareporting \
    minidumps \
    saved-telemetry-pings \
    sessionstore-backups \
    addons.* \
    AlternateServices.* \
    containers.* \
    content-prefs.* \
    handlers.* \
    kinto.* \
    mimeTypes.* \
    permissions.* \
    pluginreg.* \
    secmod.* \
    sessionCheckpoints.* \
    sessionstore.* \
    serviceworker.* \
    SecurityPreloadState.* \
    SiteSecurityServiceState.* \
    storage.* \
    Telemetry.ShutdownTime.* \
    times.* \
    webappsstore.* \
    weave \
    >/dev/null 2>&1
fi
function cleanElectronContainer () {
    if [[ -d ~/.config/$1 ]]; then
        cd ~/.config
        cd "${1}"
        rm -rf \
        "Application Cache" \
        blob_storage \
        Cache \
        CachedData \
        "Code Cache" \
        "Crash Reports" \
        "exthost Crash Reports" \
        CS_skylib \
        databases \
        GPUCache \
        "Service Worker" \
        VideoDecodeStats \
        logs \
        tmp \
        media-stack \
        ecscache.json \
        skylib \
        LOG \
        logs.txt \
        old_logs_* \
        "Network Persistent State" \
        QuotaManager \
        QuotaManager-journal \
        TransportSecurity \
        watchdog* \
        >/dev/null 2>&1
    fi
}
cleanElectronContainer "Code"
[[ -d ~/.adobe ]] && sudo rm -r ~/.adobe;
[[ -d ~/.macromedia ]] && sudo rm -r ~/.macromedia;
if which ccache >/dev/null 2>&1; then
    ccache -C
fi
sudo rm -rf ~/.cache/*
[[ -d ~/.nv ]] && sudo rm -r ~/.nv;
[[ -d ~/.launchpadlib ]] && sudo rm -r ~/.launchpadlib;
if [[ -d ~/.wine ]]; then
    rm -rf ~/.wine/drive_c/users/$USER/Temp/* >/dev/null 2>&1
    rm -rf ~/.wine/drive_c/windows/temp/* >/dev/null 2>&1
fi
[[ -f ~/.wget-hsts ]] && rm ~/.wget-hsts;
sudo rm -rf /var/crash/* >/dev/null 2>&1
history -c
unset HISTFILE
fi 
