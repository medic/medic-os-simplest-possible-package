# Medic OS: Simplest Possible Package

This package contains a simple, self-contained "Hello, world!"
package and package build script for Medic OS. The package should
install cleanly to Medic OS installations, and print/log various
strings in various places to demonstrate features of the packaging
system.

## Trying It Out

### Building

This build process requires a working `make` (BSD or GNU) and `shasum`.

A copy of GNU `ar` is required. On most systems, this will be contained
in the `binutils` package. On Mac OS X, the default system `ar` will not
work; consider installing `binutils` from [Homebrew](http://brew.sh) and
adding `/Utilities/Homebrew/Cellar/binutils/*/*/bin` to your `$PATH`.

To build the package:

```shell
$ make
```

Output will be placed in `output/packages`:

```shell
$ ls -al output/packages
total 8.0K
-rw-r--r-- 1 user group 1.8K Feb 13 04:30 simplest-possible-v10000-x64.vpkg
```

### Installing

To install the package, `scp` or `rsync` the package to an existing Medic OS
instance:

```shell
$ rsync -vaPe ssh output/packages/simplest-possible-*.vpkg user@host.local:~/
```

Then, on the Medic OS system, run:

```shell
$ sudo package-install simplest-possible-*.vpkg
```

### Updating

To simulate a package update, open the `Makefile` in your favorite text
editor and increment the package version number (e.g. change `10000` to
`10001` or higher). Rebuild and re-transfer the package as described in
the [Installing](#installing) section above.

Then, on the Medic OS system, run:

```shell
$ sudo package-update simplest-possible-*.vpkg
```

## Gory Details

Some basic introductory documentation on the package format, including
information on directory structure conventions and required scripts, is
available in the Medic OS [repository]((https://github.com/medic/medic-os)
at [PACKAGES.md](https://github.com/medic/medic-os/blob/master/PACKAGES.md).
