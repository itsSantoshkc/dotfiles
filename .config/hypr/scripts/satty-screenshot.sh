#!/bin/bash


grim -g  "$(slurp)" - | \
satty --filename - --fullscreen \
--output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H-%M-%S').png
