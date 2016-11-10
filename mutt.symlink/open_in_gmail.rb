#!/usr/bin/env ruby

# Author: Serge Gebhardt
#
# Install requirements:
# $ gem install mail
#
# Configure Mutt with:
# macro index,pager V "<enter-command>unset pipe_decode<enter><pipe-message>~/.mutt/open_in_gmail.rb<enter><enter-command>set pipe_decode=$pipe_decode<enter>"
#
# Sometimes this script might print errors or other useful info. Set the
# following in Mutt to pause return until key pressed.
# set wait_key=yes

require 'mail'
 
message = Mail.read_from_string($stdin.read)
rfc822id = message.message_id

# The redirect URI must encoded twice: once for actual redirect, once for
# passing into search query of target URL
url = "https://accounts.google.com/AccountChooser?prompt=select_account&continue=" +
    URI.encode("http://mail.google.com/mail/#search/rfc822msgid:" +
               URI.encode(rfc822id, "#+"))
# system("open #{Shellwords.escape url}")
system("/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome --new-window #{Shellwords.escape url}")
