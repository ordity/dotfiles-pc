#!/bin/bash
setxkbmap -query | grep -q 'pl' && setxkbmap us || setxkbmap pl,us
