#!/usr/bin/perl

#
# CSV page shifter (offsetter)
#
# The script can be used to increment or decrement page numbers
# in CSV index files. Example use:
#
# ./offset.pl 3 < NewReal3-Bb.csv # increment start/end page numbers by 3
# ./offset.pl -2 < NewReal3-Bb.csv # decrement start/end page numbers by 2
#
# Very useful for interactively tweaking indices using text editors
# that support piping blocks of lines to an external command, like Vim.
#

use strict;
use warnings;

my $off = $ARGV[0] or die "Usage: $0 <offset>\n";

while (<STDIN>) {
  chop;
  #if ( ! $_ ) { print "\n"; next; }
  if ( ! m/^(.*),(.*),([^,]*)$/ )
  {
    print "\n";
    next;
  }
  my ($title, $from, $to) = ($1,$2,$3);
  print $title;
  print ',';
  print $from + $off;
  print ',';
  print $to + $off if $to ne '';
  print "\n";
  #print "$title," . ($from+1) . "," . $(to+1);
}
