use Test::Simple tests=>1;
use Formatter::HTML::Textile;

sub debug { $ENV{DEBUG} && print STDERR @_ }

my $source = '"title":http://www.example.com';
my $dest = Formatter::HTML::Textile->format($source);
my $expected = '<p><a href="http://www.example.com">title</a></p>';

if ($dest ne $expected) {
    debug("source is '$source'\n");
    debug("dest is '$dest'\n");
    debug("expected is '$expected'\n");
}

ok($dest eq $expected);
