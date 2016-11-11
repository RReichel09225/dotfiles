#!/usr/bin/env ruby

# Author: Serge Gebhardt
#
# Install requirements:
# $ gem install mail
#
# Configure Mutt with:
#
# macro index,pager V "\
# <enter-command> set my_pipe_decode=\$pipe_decode; unset pipe_decode<return>\
# <enter-command> set my_wait_key=\$wait_key; unset wait_key<return>\
# <pipe-message>$my_mutt_path/open_in_gmail.rb<enter>\
# <enter-command> set pipe_decode=\$my_pipe_decode; unset my_pipe_decode<return>\
# <enter-command> set wait_key=\$my_wait_key; unset my_wait_key<return>" \
# "open message in Gmail interface using system browser"
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
