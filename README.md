Debian Perl 5
=============

Ancient Perl 5 with App::cpanminus built on Debian.

Available Perl versions are:

+ stretch-5.10.1
+ buster-5.10.1
+ stretch-5.16.3
+ buster-5.16.3
+ more if in need

USAGE
-----

To use Perl 5.10.1 on Stretch, do:

```
% docker pull yowcow/debian-perl5:stretch-5.10.1
% docker run --rm yowcow/debian-perl5:stretch-5.10.1 perl -V
```

HOW TO BUILD
------------

```
% make && make build
```
