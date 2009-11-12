#!/usr/bin/perl
use warnings;
use strict;

use Module::Build;

Module::Build->new(
		   module_name => 'Formatter::HTML::Textile',
		   sign => 1,
		   license => 'perl',
		   requires => {
				'Text::Textile' => 0,
				'Test::More' => 0,
				'HTML::TokeParser' => 0,
			       },
		   create_makefile_pl => 'traditional',
		   create_readme => 1,
		  )->create_build_script;

