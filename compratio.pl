#!/usr/bin/perl

use strict;
use warnings;

#my @infiles = glob("../GreedyTraining1/data/*");
my @infiles = qw(../data/HON_MAI91.TXT ../data/dblp2003.xml ../data/gbhtg119.dna ../data/reuters21578.txt);
for my $infile (@infiles){
  my $outfile = $infile;
  $outfile =~ s#.*/##;
  my $encodfile = "compressed/".$outfile.".rp";
  my $encodfilesize = -s $encodfile;
  my $fsize = -s $infile;
  print $outfile.",".($encodfilesize * 100.0 / $fsize)."\n";
}
