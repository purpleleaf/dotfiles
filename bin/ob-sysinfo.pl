#!/usr/bin/env perl
use strict;
use autodie;
use POSIX qw(strftime);
use XML::Simple;

# Distro -------------------------------------------------------------------

my $distro = `lsb_release -sd`;
chomp $distro;
$distro =~ tr/"//d;

# Host ---------------------------------------------------------------------
my $host = `uname -n`;
chomp $host;

# Kernel -------------------------------------------------------------------
my $kernel = `uname -r`;
chomp $kernel;

# Load ---------------------------------------------------------------------
my $load = (split ' ', (split ':', `uptime`)[4])[0];
chop $load;

# Machine ------------------------------------------------------------------
my $machine = `uname -m`;
chomp $machine;

# Memory (active) ----------------------------------------------------------
open (my $meminfo, "<", "/proc/meminfo");
my $mem_act;
while (<$meminfo>) {
  chomp;
  if (/^Active:/) {
    $mem_act = int(((split)[-2])/1024);
    last;
  }
}
close $meminfo;

# Openbox theme ------------------------------------------------------------
my $file = "$ENV{HOME}/.config/openbox/rc.xml";
my $xs1 = XML::Simple->new();
my $doc = $xs1->XMLin($file);
my $obtheme = $doc->{theme}->{'name'};

# OS -----------------------------------------------------------------------
my $os = `uname -o`;
chomp $os;

# Time ---------------------------------------------------------------------
my $time_date = strftime "%D, %R", localtime;

# Uptime -------------------------------------------------------------------
my $uptime = (split ' ', `uptime`)[0];


# Writing the pipemenu -----------------------------------------------------

    print "<openbox_pipe_menu>\n"
    . "<separator label=\"+        $ENV{USER}\@$host        +\" />\n"
    . "<item label=\"OS:      $distro $os $machine \" />\n"
    . "<item label=\"Kernel:  $kernel \" />\n"
    . "<item label=\"Uptime:  $uptime \" />\n"
    . "<item label=\"Load:    $load \" />\n"
    . "<item label=\"Mem:     $mem_act MB\" />\n"
    . "<item label=\"Theme:   $obtheme \" />\n"
    . "<item label=\"+        $time_date       +\" />\n"
    . "</openbox_pipe_menu>\n";

