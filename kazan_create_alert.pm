package kazan_create_alert;
use strict;
use warnings;
use Exporter;

use Gtk3 -init;

our @ISA= qw( Exporter );

# these CAN be exported.
our @EXPORT_OK = qw( export_me export_me_too );

# these are exported by default.
our @EXPORT = qw( export_me );

sub export_me {
    # stuff
    my $window = Gtk3::Window->new ('toplevel');
#$window->set_deletable (0);
  #delete_event => \&Gtk2::Widget::hide_on_delete

$window->signal_connect (delete_event => sub { Gtk3->main_quit });
#$window->signal_connect (delete_event => \&Gtk3::Widget::hide_on_delete);
#$window->set_default_size (400,600);
my $label = Gtk3::Label->new("alert");

	
$window->add ($label);
$window->show_all;
Gtk3->main;
}

sub export_me_too {
    # stuff
}

1;
