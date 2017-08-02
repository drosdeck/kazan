#!/usr/bin/perl -w

use strict;
use warnings;
#use kazan_create_alert;  # import default list of items.
my @test = @ARGV;
grep {/--type=/i} @ARGV or die "--type  dont defided in paramters list\n";
#my $str = shift;
my $type = (split /=/, shift) [1];
    print "$type\n";

if (grep {/alert/i} $type )
   {
    use lib  './kazan';
    use kazan::kazan_create_alert; 
     export_gui( @ARGV );
     exit 0;
   }

 #export_gui( @ARGV );
