usage (-h) and manpage (--help)
===============================

setup::

  $ . $TESTDIR/setup
  $ export SUMAXY_CHATTY='exec%man%*' SUMAXY_DRYRUN='exec%man%*'

usage::

  $ sumaxy -h
  sumaxy: usage: sumaxy [-A | -R] <DIR> <ARCH> [<PRODUCT>...]

usage::

  $ sumaxy --help
  o exec man sumaxy
