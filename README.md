qldv
====

If you're not using a Debian/Ubuntu variant, you may have downloaded binaries that do
this:

```
$ lldb-argdumper -h
usr/bin/lldb-argdumper: /usr/lib/libtinfo.so.5: no version information available (required by usr/bin/lldb-argdumper)
usr/bin/lldb-argdumper: /usr/lib/libtinfo.so.5: no version information available (required by /tmp/tmp.8oiyW382Pu/usr/bin/../lib/liblldb.so.4)
usr/bin/lldb-argdumper: /usr/lib/libtinfo.so.5: no version information available (required by /tmp/tmp.8oiyW382Pu/usr/bin/../lib/liblldb.so.4)
usr/bin/lldb-argdumper: /usr/lib/libpanel.so.5: no version information available (required by /tmp/tmp.8oiyW382Pu/usr/bin/../lib/liblldb.so.4)
```

They work just fine; however, these warnings come out because they expect your shared
libraries to have version information included.

*qldv* was designed to solve this problem. It creates a patched dynamic linker that
omits these warnings, and it can update your executables to point to this new, patched
linker.

For more info, view the man page at `doc/qldv.1` or [online](https://refi64.com/qldv/).

## Installation

```
$ make install
```

## Man pages

The man page (`doc/qldv.1`) and HTML version (`doc/qldv.1.html`) are generated via
[Ronn](http://rtomayko.github.io/ronn/):

```
$ ronn doc/qldv.ronn
```
