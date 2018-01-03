# qldv(1) -- create a patched ld-linux.so without version information warnings

## SYNOPSIS

`qldv` interpreter-to-patch [output=input-interpreter.nodebug]

`qldv` -set executable-to-patch [output=-input-executable-interpreter.nodebug]

`qldv` -find [executable=/bin/sh]

`qldv` -version

## DESCRIPTION

`qldv` creates a patched version of ld-linux.so (the dynamic linker) that does not emit
warnings like these:

```
myprog: /usr/lib/libxyz.so: no version information available (required by myprog)
```

In its first form, `qldv` takes the first argument (an ld-linux.so interpreter) and
creates a copy that does not emit version information warnings. If a second argument is
given, it will be used as the location to place the new, patched linker. If it is
omitted,the patched linker will be placed in the same directory as the input file,
with a `.nodebug` appended to the extension. After running `qldv`, the user is still
responsible for having any executables use the new linker.

In its second form, `qldv` takes an executable that is emitting version information
warnings. It will both patch the dynamic linker the executable is using *and* patch the
executable to point to the new linker. The second argument (the output path) is used
in the exact same way as before.

In its third form, `qldv` will print the dynamic linker used by the given executable.
If no argument is passed, `/bin/sh` will be used. In this form, it is simply a thin
wrapper around `patchelf --print-interpreter`.

In its fourth form, `qldv` will print its version and license, and then exit.

## EXAMPLES

Patch `/lib64/ld-linux.so.2`, saving the new version at `/lib64/ld-linux.so.2.nodebug`:

```
qldv /lib64/ld-linux.so.2
```

Patch `/lib64/ld-linux.so.2`, saving the new version at `patched-linker.so`:

```
qldv /lib64/patched-linker.so
```

Assuming `myprog` uses `/lib64/ld-linux.so.2`, patch `/lib64/ld-linux.so.2`, saving the
new version at `/lib64/ld-linux.so.2.nodebug`, and update `myprog` to point to the new
version:

```
qldv -set myprog
```

Assuming `myprog` uses `/lib64/ld-linux.so.2`, patch `/lib64/ld-linux.so.2`, saving the
new version at `patched-linker.so`, and update `myprog` to point to the new version:

```
qldv -set myprog patched-linker.so
```

Print the path to the dynamic linker used by `/bin/sh`:

```
qldv -find
```

Print the path to the dynamic linker used by `myprog`:

```
qldv -find myprog
```

## AUTHOR

Ryan Gonzalez &lt;rymg19@gmail.com&gt;

## SEE ALSO

`ld.so`(8)
