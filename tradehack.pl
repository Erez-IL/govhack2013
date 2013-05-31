#!/usr/bin/perl

use strict;
use warnings;

my @row;

open(my $fh, "<", "raw.csv");

my ($direction,$year,$country,$commodity,$value);
my ($prev_direction,$prev_year,$prev_country,$total_value);
$prev_direction = 0;
$prev_year      = 0;
$prev_country   = 0;
$total_value    = 0;

while (<$fh>) {
    chomp;
#    @row = split(/,/);
#    print "$row[0]:$row[1]\n";
#    print "$row[2]:$row[3]\n";
#    print "$row[4]\n";
    if (/^([^,]+),FY([^,]+),([^,]+),(.*),([^,]+)$/) {
        $direction  = $1;
        $year       = $2;
        $country    = $3;
        $commodity  = $4;
        $value      = $5;
        #print "$direction:$year:$country:$commodity:$value\n";

        if ($prev_direction eq $direction   &&
            $prev_year      == $year        &&
            $prev_country   eq $country
        ) {
            $total_value += $value;
        } else {
            print "$prev_direction,$prev_year,$prev_country,$total_value\n";
            $prev_direction = $direction;
            $prev_year      = $year;
            $prev_country   = $country;
            $total_value    = $value;
        }
    }
}

print "$prev_direction,$prev_year,$prev_country,$total_value\n";
