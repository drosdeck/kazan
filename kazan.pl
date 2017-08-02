#!/usr/bin/perl -w

use strict;
use warnings;
#use kazan_create_alert;  # import default list of items.
my @test = @ARGV;
#grep {/--type=/i} @ARGV or die "--type  dont defided in paramters list\n";
(grep {/--type=/i} @ARGV)  or   usage();
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

sub usage{

   print "kazan --type=alert [options]\n";
   print "options: 
        \t--message=string
        \t--height=number
        \t--width=number
        \t--icon=path to icon
        \t--title=string
        \t--button=string
        \t--check=string
        \t--unclose=true|TRUE|false|FALSE\n";
  print  "\nexample: "; 
   print "/kazan.pl --type=alert --message=message --title=my_title\n";
   exit 0;
}
 


 #export_gui( @ARGV );
