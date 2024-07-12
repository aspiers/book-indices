#!/usr/bin/perl

use strict;
use warnings;

# NOTE: needs libpdf-api2-perl (on APT distros), perl-PDF-API2 (on RPM distros), or similar
use PDF::API2;

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

while (<IDX>)
{
  chop;
  next if ( ! m/^(.*),(.*),([^,]*)$/ );

  my ($title, $begin, $end) = ($1,$2,$3);

  print $title;
  print ': ';
  print $begin;
  print '-';
  print $end;
  print "\n";

  $title =~ s/^"(.*)"$/$1/g; # strip quotes
  $title =~ s/[:\/?]/_/g;

  my $pdf = PDF::API2->new();
  for (my $i=$begin; $i<=$end; ++$i)
  {
    my $page = $pdf->import_page($sourcepdf, $i);
  }
  $pdf->save("${outputDir}/${title}.pdf");

}
