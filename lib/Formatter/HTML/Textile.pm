=head1 NAME

Formatter::HTML::Textile

=head1 DESCRIPTION

=head1 SYNOPSIS

  my $textile = <<TEXTILE;
  h1. textile document
  
  this is a "textile":http://textism.com/tools/textile/ document
  TEXTILE

  my $formatter = Formatter::HTML::Textile->format( $textile );

  print "title is ".$formatter->title."\n";
  print $formatter->document;
  
  my @links = @{ $formatter->links };
  print "Links urls: ";
  print join ", " map { $_->{url} } @links;
  print "\n";

=head1 METHODS

=over 4

=item format($string)

This is a constructor method and initializes the formatter with the
passed text.

This method returns a Formatter::HTML::Textile object.

=item document()

It returns a full HTML document, comprising the formatted textile source
converted to HTML.

=item fragment()

returns a minimal HTML chunk as textile.

=item links()

Returns all the links found in the document, as a listref of hashrefs,
with keys 'title', which is the title of the link, and 'url', which is
the link.

=item title()

Returns the title of the document

=back

=head1 SEE ALSO

L<Formatter>, L<Text::Textile>

=head1 COPYRIGHT

Copyright 2005 Tom Insam tom@jerakeen.org

=cut

package Formatter::HTML::Textile;
use warnings;
use strict;
use Carp qw( croak );

our $VERSION = 0.5;

use base qw( Text::Textile );

sub format {
  my $class = shift;
  my $self = ref($class) ? $class : $class->new;
  $self->{_text} = shift || "";
  return $self;
}

sub document {
  my $self = shift;
  # TODO - holy cow this is a horrible hack. Make work, damnit. Needs docstrings,
  # etc, etc, etc.
  return "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\">\n"
         ."<html><head><title>"
         .$self->title
         ."</title></head><body>"
         .$self->fragment
         ."</body></html>";
}

# hold a list of links found
my @links;

sub fragment {
  my $self = shift;
  $self->process($self->{_text});
}

sub format_link {
  my $self = shift;
  my ($title, $url, $class) = @_;
  push @links, { url => $class, title => $title };
  return $self->SUPER::format_link(@_);
}

sub links {
  my $self = shift;
  @links = ();
  $self->fragment;
  return \@links;
}

sub title {
  my $self = shift;
  if ( $self->{_text} =~ /^h1\.\s*(.*)$/im ) {
    return $1;
  }
  return undef;
}


1;

