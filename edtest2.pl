#!/usr/bin/perl

use strict;
use warnings;

#my @infiles = glob("../GreedyTraining1/data/*");
#my @infiles = qw(../data/HON_MAI91.TXT ../data/dblp2003.xml ../data/gbhtg119.dna ../data/reuters21578.txt);
my @infiles = glob("../data/dazai.utf.txt");
my $encoder = "./repair";
my $decoder = "./despair";
for my $infile (@infiles){
  for (1..5){
    my $outfile = $infile;
    $outfile =~ s#.*/##;
    my $encodfile = "compressed/".$outfile.".rp";
    my $decompfile = "decompressed/".$outfile;
    my $status;
    print STDOUT "$infile\n";
    print STDERR "===$infile===\n";
    print STDOUT "encode\n";
    print STDERR "encode\n";
    system("time $encoder $infile $encodfile");
    print STDOUT "decode\n";
    print STDERR "decode\n";
    system("time $decoder $encodfile $decompfile");
    $status = system("diff $infile $decompfile");
    if($status != 0){
      print STDERR "$infile and $outfile does not the same.\n";
    }
    print STDERR "\n";
  }
}
