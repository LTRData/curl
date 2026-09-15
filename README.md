<!--
Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.

SPDX-License-Identifier: curl
-->

# [![curl logo](https://curl.se/logo/curl-logo.svg)](https://curl.se/)

## About this LTRData fork

This is an LTRData fork of [curl/curl](https://github.com/curl/curl), containing the curl command-line tool and libcurl library with local Windows build adjustments.

The default branch, `master`, contains upstream merges through **15 May 2024**. Its [version header](include/curl/curlver.h) identifies the source as **8.8.0-DEV**, an unreleased development snapshot. This fork should not be assumed to track current upstream; see [curl/curl](https://github.com/curl/curl) and [curl.se](https://curl.se/) for current development and releases.

### Local changes

Relative to [the upstream revision last merged into this fork](https://github.com/LTRData/curl/compare/77ac610d084f78caab8fcf5728028a013ad4c0b4...655f5cd8f22da9a7f6572e40619a01144b3bc980), the differences are concentrated in Windows build configuration:

- [`winbuild/MakefileBuild.vc`](winbuild/MakefileBuild.vc) accepts additional linker flags through `X_LFLAGS`.
- [`lib/config-win32.h`](lib/config-win32.h) raises the MSVC version check for `USE_WIN32_LARGE_FILES` to `_MSC_VER >= 1500`, while retaining the check for 64-bit integral types.
- `winbuild/make_x86.cmd`, `make_amd64.cmd`, `make_arm.cmd` and `make_arm64.cmd` contain local Windows build, signing and deployment commands.
- [`changes.txt`](changes.txt) records the original build adjustment, and `.gitignore` excludes local build output and precompiled headers.

### Building this fork

To check out this repository:

```sh
git clone --branch master https://github.com/LTRData/curl.git
cd curl
```

Use the build documentation included with this source: [general installation](docs/INSTALL.md), [building from Git](GIT-INFO.md), and [Visual C++/NMake](winbuild/README.md). Compiler, TLS backend and optional library requirements depend on the build configuration. Available protocols and features likewise depend on how curl/libcurl is built.

The `make_*.cmd` scripts listed above are historical maintainer scripts. They contain fixed dependency paths, certificate/signing settings and deployment destinations, and require adaptation before use elsewhere. Their legacy Windows target settings are not a compatibility guarantee for this source snapshot or its dependencies.

Licensing and copyright terms are in [COPYING](COPYING), with additional notices in the source files.

## Inherited upstream README

The documentation below is preserved from upstream curl. Its contact, commercial support, security reporting, sponsorship and download links refer to the upstream project. The clone command in its Git section also selects upstream; current online documentation may describe features newer than this fork.

---

Curl is a command-line tool for transferring data specified with URL
syntax. Find out how to use curl by reading [the curl.1 man
page](https://curl.se/docs/manpage.html) or [the MANUAL
document](https://curl.se/docs/manual.html). Find out how to install Curl
by reading [the INSTALL document](https://curl.se/docs/install.html).

libcurl is the library curl is using to do its job. It is readily available to
be used by your software. Read [the libcurl.3 man
page](https://curl.se/libcurl/c/libcurl.html) to learn how.

You can find answers to the most frequent questions we get in [the FAQ
document](https://curl.se/docs/faq.html).

Study [the COPYING file](https://curl.se/docs/copyright.html) for
distribution terms.

## Contact

If you have problems, questions, ideas or suggestions, please contact us by
posting to a suitable [mailing list](https://curl.se/mail/).

All contributors to the project are listed in [the THANKS
document](https://curl.se/docs/thanks.html).

## Commercial support

For commercial support, maybe private and dedicated help with your problems or
applications using (lib)curl visit [the support page](https://curl.se/support.html).

## Website

Visit the [curl website](https://curl.se/) for the latest news and
downloads.

## Git

To download the latest source from the Git server, do this:

    git clone https://github.com/curl/curl.git

(you will get a directory named curl created, filled with the source code)

## Security problems

Report suspected security problems via [our HackerOne
page](https://hackerone.com/curl) and not in public.

## Notice

Curl contains pieces of source code that is Copyright (c) 1998, 1999 Kungliga
Tekniska Högskolan. This notice is included here to comply with the
distribution terms.

## Backers

Thank you to all our backers! 🙏 [Become a backer](https://opencollective.com/curl#section-contribute).

## Sponsors

Support this project by becoming a [sponsor](https://curl.se/sponsors.html).
