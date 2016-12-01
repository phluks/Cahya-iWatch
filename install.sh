#!/bin/bash

# Author: Olav Cleemann <olav@cleemann.org>
echo This install script is quite naive. Feel free to send ideas for improvement.

INPATH=`echo $PATH | grep /usr/local/bin`
HASPRG=`which iwatch`
HASEVNT=`perl -e 'use Event' 2>&1`
HASINO=`perl -e 'use Linux::Inotify2' 2>&1`
HASSXML=`perl -e 'use XML::SimpleObject::LibXML' 2>&1`
HASSML=`perl -e 'use Mail::Sendmail' 2>&1`

if [ -n "$HASEVNT" ]; then 
	echo 'Requires the perl-module Event'
	echo 'You can install it by running eq: [sudo] cpan install Event'
fi
if [ -n "$HASINO" ]; then 
	echo 'Requires the perl-module Linux::Inotify2'
	echo 'You can install it by running eq: [sudo] cpan install Linux::Inotify2'
fi
if [ -n "$HASSXML" ]; then 
	echo 'Requires the perl-module XML::SimpleObject::LibXML'
	echo 'You can install it by running eq: [sudo] cpan install XML::SimpleObject::LibXML'
fi
if [ -n "$HASSML" ]; then 
	echo 'Requires the perl-module Mail::Sendmail'
	echo 'You can install it by running eq: [sudo] cpan install Mail::Sendmail'
fi
if [ -z "$INPATH" ]; then echo 'Requires /usr/local/bin to be in $PATH'; exit 1; fi
if [ -n "$HASPRG" ]; then echo 'You already have an iwatch program!'; echo "- in: $HASPRG"; exit 1; fi
if [ ! -d /etc/iwatch ]; then mkdir /etc/iwatch || exit 1; fi
cp iwatch.dtd iwatch.xml.example /etc/iwatch/
cp iwatch /usr/local/bin/
