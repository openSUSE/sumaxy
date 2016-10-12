basic misuse
============

setup::

  $ . $TESTDIR/setup
  $ wd=$FIXTURES/SUSE:Maintenance:1023:81757

no args::

  $ sumaxy
  sumaxy: missing argument
  sumaxy: usage: sumaxy [-A | -R] <DIR> <ARCH> [<PRODUCT>...]
  [1]

too few args::

  $ sumaxy $wd
  sumaxy: missing argument
  sumaxy: usage: sumaxy [-A | -R] <DIR> <ARCH> [<PRODUCT>...]
  [1]

unknown option::

  $ sumaxy -x
  sumaxy: unknown option '-x'
  sumaxy: usage: sumaxy [-A | -R] <DIR> <ARCH> [<PRODUCT>...]
  [1]

  $ sumaxy --xeno
  sumaxy: unknown option '--xeno'
  sumaxy: usage: sumaxy [-A | -R] <DIR> <ARCH> [<PRODUCT>...]
  [1]

architectures and products not in the metadata::

  $ sumaxy $wd omg wtf
