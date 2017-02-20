correct usage
=============


setup::

  $ . $TESTDIR/setup

  $ wd=$FIXTURES/SUSE:Maintenance:1023:81757

arch only::

  $ sumaxy -R $wd i586
  zypper rr http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DEBUGINFO_11-SP3_i586/
  zypper rr http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DEBUGINFO_11-SP4_i586/
  zypper rr http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP3_i586/
  zypper rr http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP4_i586/
  zypper rr http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP3_i586/
  zypper rr http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP4_i586/
  zypper rr http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLES4VMWARE_11-SP3_i586/


arch + products::

  $ sumaxy -R $wd x86_64 sled
  zypper rr http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP3_x86_64/
  zypper rr http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP4_x86_64/

  $ sumaxy -R $wd x86_64 sled:11.3 sled:11.4
  zypper rr http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP3_x86_64/
  zypper rr http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP4_x86_64/

  $ sumaxy -R $wd x86_64 sled:11.2

  $ sumaxy -R $wd x86_64 sled:11.3
  zypper rr http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP3_x86_64/

  $ sumaxy -R $wd x86_64 sled:11.4
  zypper rr http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP4_x86_64/
