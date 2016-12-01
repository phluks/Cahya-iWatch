#!/bin/bash

# Author: Olav Cleemann <olav@cleemann.org>
echo This install script is quite naive. Feel free to send ideas for improvement.

INPATH=`echo $PATH | grep /usr/local/bin`
HASPRG=`which iwatch`
HASEVNT=`perl -e 'use Event' 2>&1`

if [ -n "$HASEVNT" ]; then 
	echo 'Requires the perl-module Event'
	echo 'You can install it by running eq: [sudo] cpan install Event'
fi
if [ -z "$INPATH" ]; then echo 'Requires /usr/local/bin to be in $PATH'; exit 1; fi
if [ -n "$HASPRG" ]; then echo 'You already have an iwatch program!'; echo "- in: $HASPRG"; exit 1; fi
if [ ! -d /etc/iwatch ]; then mkdir /etc/iwatch || exit 1; fi
cp iwatch.dtd iwatch.xml.example /etc/iwatch/
cp iwatch /usr/local/bin/
