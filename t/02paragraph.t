use Test::Simple tests=>1;
use Formatter::HTML::Textile;

sub debug { $ENV{DEBUG} && print STDERR @_ }

my $source = "paragraph1\n\nparagraph2\n\n";
my $dest = Formatter::HTML::Textile->format($source);
my $expected = "<p>paragraph1</p>\n\n<p>paragraph2</p>";

if ($dest ne $expected) {
    debug("source is '$source'\n");
    debug("dest is '$dest'\n");
    debug("expected is '$expected'\n");
}

ok($dest eq $expected);
