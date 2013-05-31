#!/usr/bin/perl

use strict;
use warnings;

my @row;

open(my $fh, "<", "raw.csv");

my ($direction,$year,$country,$comm_code,$commodity,$value);
my ($prev_direction,$prev_year,$prev_country,$total_value);
$prev_direction = 0;
$prev_year      = 0;
$prev_country   = 0;
$total_value    = 0;

while (<$fh>) {
    chop;
    chop; # because it is a dos formatted file
    if (/^([^,]+),FY([^,]+),([^,]+),"{0,1}(\d+) *([^"]*)"{0,1},([^,]+)$/) {
        $direction  = $1;
        $year       = $2;
        $country    = $3;
        $comm_code  = $4;
        $commodity  = $5;
        $value      = $6;
        print qq{
insert
into    trade
values  ('$direction',$year,'$country',$comm_code,'$commodity',$value)
;
};

        if ($prev_direction eq $direction   &&
            $prev_year      == $year        &&
            $prev_country   eq $country
        ) {
            $total_value += $value;
        } else {
            ##print "$prev_direction,$prev_year,$prev_country,$total_value\n";
            $prev_direction = $direction;
            $prev_year      = $year;
            $prev_country   = $country;
            $total_value    = $value;
        }
    }
}

#print "$prev_direction,$prev_year,$prev_country,$total_value\n";
