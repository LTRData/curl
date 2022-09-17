#!/usr/bin/perl
# Copyright (C) 2022 Daniel Stenberg, <daniel@haxx.se>, et al.
#
# SPDX-License-Identifier: curl
#
# Input: a libcurl nroff man page
# Output: the same file, minus the SYNOPSIS and the EXAMPLE sections
#

my $f = $ARGV[0];
my $o = $ARGV[1];

open(F, "<$f") or die;
open(O, ">$o") or die;

my $ignore = 0;
while(<F>) {
    if($_ =~ /^.SH (SYNOPSIS|EXAMPLE|\"SEE ALSO\"|SEE ALSO)/) {
        $ignore = 1;
    }
    elsif($ignore && ($_ =~ /^.SH/)) {
        $ignore = 0;
    }
    elsif(!$ignore) {
        # filter out mentioned CURLE_ names
        $_ =~ s/CURLE_[A-Z0-9_]*//g;
        # filter out mentioned CURLOPT_ names
        $_ =~ s/CURLOPT_[A-Z0-9_]*//g;
        # filter out mentioned CURL_DISABLE_ names
        $_ =~ s/CURL_DISABLE_[A-Z0-9_]*//g;
        print O $_;
    }
}
close(F);
close(O);

