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
        $_ =~ s/CURL(M|SH|U|H)code//g;
        $_ =~ s/CURL_CSELECT_[A-Z0-9_]*//g;
        $_ =~ s/CURL_DISABLE_[A-Z0-9_]*//g;
        $_ =~ s/CURL_HET_DEFAULT//g;
        $_ =~ s/CURL_IPRESOLVE_[A-Z0-9_]*//g;
        $_ =~ s/CURL_PROGRESSFUNC_CONTINUE//g;
        $_ =~ s/CURL_READFUNC_[A-Z0-9_]*//g;
        $_ =~ s/CURL_REDIR_[A-Z0-9_]*//g;
        $_ =~ s/CURL_RTSPREQ_[A-Z0-9_]*//g;
        $_ =~ s/CURL_TIMECOND_[A-Z0-9_]*//g;
        $_ =~ s/CURL_VERSION_[A-Z0-9_]*//g;
        $_ =~ s/CURLALTSVC_[A-Z0-9_]*//g;
        $_ =~ s/CURLAUTH_[A-Z0-9_]*//g;
        $_ =~ s/CURLE_[A-Z0-9_]*//g;
        $_ =~ s/CURLFORM_[A-Z0-9_]*//g;
        $_ =~ s/CURLFTP_[A-Z0-9_]*//g;
        $_ =~ s/CURLFTPAUTH_[A-Z0-9_]*//g;
        $_ =~ s/CURLFTPMETHOD_[A-Z0-9_]*//g;
        $_ =~ s/CURLGSSAPI_[A-Z0-9_]*//g;
        $_ =~ s/CURLINFO_[A-Z0-9_]*//g;
        $_ =~ s/CURLMIMEOPT_[A-Z0-9_]*//g;
        $_ =~ s/CURLMOPT_[A-Z0-9_]*//g;
        $_ =~ s/CURLOPT_[A-Z0-9_]*//g;
        $_ =~ s/CURLPIPE_[A-Z0-9_]*//g;
        $_ =~ s/CURLPROTO_[A-Z0-9_]*//g;
        $_ =~ s/CURLPX_[A-Z0-9_]*//g;
        $_ =~ s/CURLSHOPT_[A-Z0-9_]*//g;
        $_ =~ s/CURLSSH_[A-Z0-9_]*//g;
        $_ =~ s/CURLSSLBACKEND_[A-Z0-9_]*//g;
        $_ =~ s/CURLUPART_[A-Z0-9_]*//g;
        $_ =~ s/curl_global_(init_mem|sslset|cleanup)//g;
        $_ =~ s/curl_(strequal|strnequal|formadd|waitfd|formget|getdate)//g;
        $_ =~ s/curl_easy_(nextheader|duphandle)//g;
        $_ =~ s/(^|\W)((tftp|https|http|ftp):\/\/[a-z0-9\-._~%:\/?\#\[\]\@!\$&'()*+,;=]+)//gi;
        print O $_;
    }
}
close(F);
close(O);

