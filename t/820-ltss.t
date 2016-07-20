LTSS handling
=============


setup::

  $ . $TESTDIR/setup
  $ wd=$FIXTURES/SUSE:Maintenance:2268:106704

test::

  $ sumaxy $wd x86_64
  sles:11.3-LTSS::p=2268 http://dl.example.org/ibs/SUSE:/Maintenance:/2268/SUSE_Updates_SLE-SERVER_11-SP3-LTSS_x86_64/
  sles:11.3-TERADATA::p=2268 http://dl.example.org/ibs/SUSE:/Maintenance:/2268/SUSE_Updates_SLE-SERVER_11-SP3-TERADATA_x86_64/

  $ sumaxy $wd x86_64 sles:11.3
  sles:11.3-LTSS::p=2268 http://dl.example.org/ibs/SUSE:/Maintenance:/2268/SUSE_Updates_SLE-SERVER_11-SP3-LTSS_x86_64/
