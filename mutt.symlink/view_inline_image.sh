#!/bin/bash
#
# Author: Serge Gebhardt
#
# Purpose: To be called by Mutt as indicated by .mailcap to handle images
# inline. Needs imagemagick (convert) and jp2a installed. Must be an external
# script since we can't get `tput cols` through mailcap.
#            
# Typical .mailcap entry:
#   image/*; ./mutt/view_inline_image.sh %s; copiousoutput
#

convert $1 jpg:- | jp2a --width=$(tput cols) --colors -
