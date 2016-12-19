Inconsistent version strings
============================

setup::

  $ . $TESTDIR/setup
  $ wd=$FIXTURES/SUSE:Maintenance:1847:93290

test::

  $ sumaxy $wd x86_64 ses
  issue-ses:1.0::p=1847 http://dl.example.org/ibs/SUSE:/Maintenance:/1847/SUSE_Updates_Storage_1.0_x86_64/
  issue-ses:2::p=1847 http://dl.example.org/ibs/SUSE:/Maintenance:/1847/SUSE_Updates_Storage_2_x86_64/

  $ sumaxy $wd x86_64 ses:1
  issue-ses:1.0::p=1847 http://dl.example.org/ibs/SUSE:/Maintenance:/1847/SUSE_Updates_Storage_1.0_x86_64/

  $ sumaxy $wd x86_64 ses:2
  issue-ses:2::p=1847 http://dl.example.org/ibs/SUSE:/Maintenance:/1847/SUSE_Updates_Storage_2_x86_64/
