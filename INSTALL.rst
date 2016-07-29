.. vim: ft=rst sw=2 sts=2 et tw=72

=======================================================================
                           Installing SUMAXY
=======================================================================


SUSE, openSUSE
==============

::

  zypper install cram haveopt make xmlstarlet zsh
  git clone https://github.com/openSUSE/sumaxy.git
  mkdir sumaxy-build
  cd sumaxy-build
  ../sumaxy/configure
  make check
  sudo make install
