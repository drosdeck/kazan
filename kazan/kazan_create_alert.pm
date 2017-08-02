package kazan::kazan_create_alert;
use strict;
use warnings;
use Exporter;

use Gtk3 -init;

our @ISA= qw( Exporter );

# these CAN be exported.
our @EXPORT_OK = qw( export_gui export_me_too );

# these are exported by default.
our @EXPORT = qw( export_gui );

sub export_gui {

   my $message="default message";
   my $title="alert";	
   my $height=100;
   my $width=100;
   my $unclose=1;
   my $button_title="Exit";
   #TODO trocar esse caminho para o caminho absoluto
   my $icon_img="/usr/share/kazan/icons/dialog-warning.png";
   foreach my $loop (@ARGV) { 
         if ( grep{/--message/i} $loop)
         {
             $message = (split /=/, $loop) [1];
                
         }  
          #TODO testar se a variavel height é numero 
          if ( grep{/--height=/i} $loop)
         {
             $height = (split /=/, $loop) [1];
                
         }
           if ( grep{/--icon=/i} $loop)
         {
             $icon_img = (split /=/, $loop) [1];
                
         }  
          if ( grep{/--width=/i} $loop)
         {
             $width = (split /=/, $loop) [1];
                
         }
          if ( grep{/--title=/i} $loop)
         {
             $title = (split /=/, $loop) [1];
                
         }  if ( grep{/--button=/i} $loop)
         {
             $button_title = (split /=/, $loop) [1];
                
         }  
         if ( grep{/--unclose=/i} $loop)
         {
             $unclose = (split /=/, $loop) [1];
             $unclose =~tr/a-z/A-Z/;

            if ($unclose eq "FALSE"){$unclose = 1}
            if ($unclose eq "TRUE"){$unclose = 0}

                        
         }
#          if ( grep{/--unclose/i} $loop)
#         {
#             $unclose = (split /=/, $loop) [1];
#             $unclose =~tr/a-z/A-Z/;
#
#             print "valor de unclose:$unclose";
#            if ($unclose eq "FALSE"){$unclose = 1}
#            if ($unclose eq "TRUE"){$unclose = 0}

                        
#         }  

} 

     
    # stuff
    my $window = Gtk3::Window->new ('toplevel');

$window->set_deletable ($unclose);
  #delete_event => \&Gtk2::Widget::hide_on_delete
$window->signal_connect (delete_event => sub { exit 0 });
#$window->signal_connect (delete_event => \&Gtk3::Widget::hide_on_delete);
$window->set_default_size ($width,$height);
$window->set_title($title);
$window->set_border_width(5);

my $button_ok = Gtk3::Button->new($button_title);
my $box_base = Gtk3::VBox->new(0, 0);
my $box_head = Gtk3::VBox->new(0, 0);
my $box_button = Gtk3::HBox->new(0, 0);
my $label = Gtk3::Label->new($message);
my $icon = Gtk3::Image->new_from_file($icon_img); 
#   $label->set_justify('left');
     #$box_head->pack_start($icon, 1, 0, 0);
     $box_head->pack_start($icon, 0, 0, 0);
     $box_base->pack_start($box_head, 1, 0, 0);
     $box_base->pack_start($label, 1, 0, 0);
    # $box_base->pack_start($box_head, 0, 0, 0);
     $box_button->pack_end($button_ok, 0, 0, 0);

     $box_base->pack_start($box_button, 0, 0, 0);
$window->add ($box_base);
$window->show_all;
Gtk3->main;
}

sub export_me_too {
    # stuff
}

1;
