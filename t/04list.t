use Test::Simple tests=>2;
use Formatter::HTML::Textile;

sub debug { $ENV{DEBUG} && print STDERR @_ }

my $source = "* list1\n* list2\n* list3\n";
my $dest = Formatter::HTML::Textile->format($source);
my $expected = "\n<ul>\n<li>list1</li>\n<li>list2</li>\n<li>list3</li>\n</ul>";

if ($dest ne $expected) {
    debug("source is '$source'\n");
    debug("dest is '$dest'\n");
    debug("expected is '$expected'\n");
}

ok($dest eq $expected);

$source = "# list1\n# list2\n# list3\n";
$dest = Formatter::HTML::Textile->format($source);
$expected = "\n<ol>\n<li>list1</li>\n<li>list2</li>\n<li>list3</li>\n</ol>";

if ($dest ne $expected) {
    debug("source is '$source'\n");
    debug("dest is '$dest'\n");
    debug("expected is '$expected'\n");
}

ok($dest eq $expected);
