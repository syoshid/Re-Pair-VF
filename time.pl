#!/usr/bin/perl

use strict;
use warnings;

my %comptime;
my %decomptime;
my $fname;
my $mode;

while(<>){
  if(/===(.+)===/){
    $fname = $1;
    $fname =~ s#.*/##g;
  }
  elsif(/^encode$/){
    $mode = "encode";
  }
  elsif(/^decode$/){
    $mode = "decode";
  }
  elsif(/^(.+)user\s+(.+)system/){
    if($mode eq "encode"){
      push(@{$comptime{$fname}}, $1 + $2);
    }
    elsif($mode eq "decode"){
      push(@{$decomptime{$fname}}, $1 + $2);
    }
    else{
      print "something odd!\n";
    }
  }
}

print "compression times\n";
for my $f (keys %comptime){
  my $sum = 0;
  for (@{$comptime{$f}}){
    $sum += $_;
  }
  print $f.",".($sum / ($#{$comptime{$f}} + 1))."\n";
#  print $f." ";
#  print join(" ", @{$comptime{$f}})."\n";
}
    
print "\n\n\n\n";
print "decompression times\n";
for my $f (keys %decomptime){
  my $sum = 0;
  for (@{$decomptime{$f}}){
    $sum += $_;
  }
  print $f.",".($sum / ($#{$decomptime{$f}} + 1))."\n";
#  print $f." ";
#  print join(" ", @{$comptime{$f}})."\n";
}
