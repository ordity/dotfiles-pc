#!/usr/bin/env bash

echo "Updating system..."
yay -Syu

echo "Clearing pacman cache..."
pacman_cache_space_used="$(sudo du -sh /var/cache/pacman/pkg/)"
paccache -r 
echo "Space saved: $pacman_cache_space_used" 

echo "Removing orphan packages..."
yay -Qdtq | yay -Rns -

echo "Clearing ~/.cache ..."
home_cache_used="$(sudo du -sh ~/.cache)"
echo "Cache size: $home_cache_used - consider cleaning it up manually "

echo "Clearing system logs..."
sudo journalctl --vacuum-time=7d
