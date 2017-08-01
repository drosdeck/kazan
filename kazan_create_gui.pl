#! /usr/bin/perl -w
use strict;
use Gtk3 -init;


#$type="alert";




my $window = Gtk3::Window->new ('toplevel');
#$window->set_deletable (0);
  #delete_event => \&Gtk2::Widget::hide_on_delete

$window->signal_connect (delete_event => sub { Gtk3->main_quit });
#$window->signal_connect (delete_event => \&Gtk3::Widget::hide_on_delete);
$window->set_default_size (400,600);
my $label = Gtk3::Label->new("texte");

	
$window->add ($label);
$window->show_all;
Gtk3->main;
