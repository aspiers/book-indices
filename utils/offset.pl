#!/usr/bin/perl

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
  print $to + $off;
  print "\n";
  #print "$title," . ($from+1) . "," . $(to+1);
}
