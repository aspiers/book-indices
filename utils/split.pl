#!/usr/bin/perl

use strict;
use warnings;

# NOTE: needs libpdf-api2-perl (on APT distros), perl-PDF-API2 (on RPM distros), or similar
use PDF::API2;

use File::Basename;

sub usage
{
  my ($stream, $status) = @_;

  print $stream "Usage: $0 <index_file> <pdf_file> <output_directory>\n";

  exit $status;
}

usage(*STDERR, 1) unless $ARGV[2];

my ($index,$pdfInput,$outputDir) = @ARGV;

print "index: $index\n";
print "pdfInput: $pdfInput\n";
print "outputDir: $outputDir\n";

open(IDX, "<$index") || die "Could not open index file $index: $!\n";

#die "PDF file $pdfInput is not a readable file\n" unless -f $pdfInput && -r $pdfInput;

die "Output directory $outputDir does not exist\n" unless -d $outputDir;

my $sourcepdf = PDF::API2->open($pdfInput) || die "Could not open PDF file $pdfInput: $!\n";

my $pdfBasename = basename($pdfInput);

while (<IDX>)
{
  chop;
  next if ( ! m/^(.*),(.*),([^,]*)$/ );

  my ($title, $begin, $end) = ($1,$2,$3);

  next if $title =~ '^#'; # Skip comments
  next if $begin eq ''; # Skip lines with missing begin
  # strip quotes from title
  $title = substr $title, 1, -1 if $title =~ /^["']/;

  my $pages = "$begin";
  if ( $end eq '' ) {
    # Missing end means end=begin
    $end = $begin;
  } elsif ( $end != $begin ) {
    $pages = "$begin-$end";
  }

  print "$title: [$pages]\n";

  my $pdf = PDF::API2->new();

  $pdf->producer("split | $pdfBasename | $pages");
  $pdf->title($title);

  for (my $i=$begin; $i<=$end; ++$i)
  {
    my $page = $pdf->import_page($sourcepdf, $i);
  }

  my $fname = $title;
  $fname =~ s/^"(.*)"$/$1/g; # strip quotes
  $fname =~ s/[:\/?]/_/g;

  $pdf->save("${outputDir}/${fname}.pdf");

}
