noarch packages
===============


setup::

  $ . $TESTDIR/setup

  $ wd=$FIXTURES/SUSE:Maintenance:2087:98954

test::

  $ sumaxy $wd x86_64
  sles:12.1::p=2087 http://dl.example.org/ibs/SUSE:/Maintenance:/2087/SUSE_Updates_SLE-SERVER_12-SP1_x86_64/

  $ sumaxy $wd s390x
  sles:12.1::p=2087 http://dl.example.org/ibs/SUSE:/Maintenance:/2087/SUSE_Updates_SLE-SERVER_12-SP1_s390x/

  $ sumaxy $wd s390x sles:12.1
  sles:12.1::p=2087 http://dl.example.org/ibs/SUSE:/Maintenance:/2087/SUSE_Updates_SLE-SERVER_12-SP1_s390x/
