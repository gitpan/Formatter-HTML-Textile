=head1 NAME

Formatter::HTML::Textile

=head1 DESCRIPTION

=head1 SYNOPSIS

=head1 METHODS

=over 4

=cut

package Formatter::HTML::Textile;
use warnings;
use strict;
use Carp qw( croak );

our $VERSION = 0.1;

use base qw( Text::Textile);

sub format {
  my $self = shift;
  $self = $self->new unless ref($self);
  $self->{_text} = shift || "";
  return $self->process($self->{_text});
}

sub links {
  return ();
}

sub title {
  my $self = shift;
  croak("title is an object method") unless ref($self);
  if ( $self->{_text} =~ /^h1\.\s*(.*)$/im ) {
    my $title = $1;
    $title =~ s/\s*-.*//;
    return $title;
  }
  return undef;
}


1;

=back

=head1 SEE ALSO

=head1 COPYRIGHT

Tom

=cut
