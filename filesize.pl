#!/usr/bin/perl

use strict;
use warnings;

my @infiles = glob("../GreedyTraining1/data/*");
for my $infile (sort @infiles){
  my $outfile = $infile;
  $outfile =~ s#.*/##;
  my $encodfile = $outfile . ".cod";
  my $encodfilesize = -s $encodfile;
  my $fsize = -s $infile;
  print $outfile.",".$fsize."\n";
}
