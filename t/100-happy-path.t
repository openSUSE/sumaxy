correct usage
=============


setup::

  $ . $TESTDIR/setup

  $ wd=$FIXTURES/SUSE:Maintenance:1023:81757

arch only::

  $ sumaxy $wd i586
  sle-debuginfo:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DEBUGINFO_11-SP3_i586/
  sle-debuginfo:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DEBUGINFO_11-SP4_i586/
  sled:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP3_i586/
  sled:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP4_i586/
  sles:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP3_i586/
  sles:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP4_i586/
  sles-for-vmware:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLES4VMWARE_11-SP3_i586/

  $ sumaxy $wd ia64
  sle-debuginfo:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DEBUGINFO_11-SP3_ia64/
  sle-debuginfo:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DEBUGINFO_11-SP4_ia64/
  sles:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP3_ia64/
  sles:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP4_ia64/

  $ sumaxy $wd ppc64
  sle-debuginfo:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DEBUGINFO_11-SP3_ppc64/
  sle-debuginfo:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DEBUGINFO_11-SP4_ppc64/
  sles:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP3_ppc64/
  sles:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP4_ppc64/

  $ sumaxy $wd s390x
  sle-debuginfo:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DEBUGINFO_11-SP3_s390x/
  sle-debuginfo:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DEBUGINFO_11-SP4_s390x/
  sles:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP3_s390x/
  sles:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP4_s390x/

  $ sumaxy $wd x86_64
  sle-debuginfo:11.1-TERADATA::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DEBUGINFO_11-SP1-TERADATA_x86_64/
  sle-debuginfo:11.3-TERADATA::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DEBUGINFO_11-SP3-TERADATA_x86_64/
  sle-debuginfo:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DEBUGINFO_11-SP3_x86_64/
  sle-debuginfo:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DEBUGINFO_11-SP4_x86_64/
  sled:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP3_x86_64/
  sled:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP4_x86_64/
  sles:11.1-TERADATA::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP1-TERADATA_x86_64/
  sles:11.3-TERADATA::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP3-TERADATA_x86_64/
  sles:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP3_x86_64/
  sles:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP4_x86_64/
  sles-for-vmware:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLES4VMWARE_11-SP3_x86_64/

arch + products::

  $ sumaxy $wd x86_64 sled
  sled:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP3_x86_64/
  sled:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP4_x86_64/

  $ sumaxy $wd x86_64 sled:11.3 sled:11.4
  sled:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP3_x86_64/
  sled:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP4_x86_64/

  $ sumaxy $wd x86_64 sled:11.2

  $ sumaxy $wd x86_64 sled:11.3
  sled:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP3_x86_64/

  $ sumaxy $wd x86_64 sled:11.4
  sled:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP4_x86_64/

  $ sumaxy $wd x86_64 sled:11.\?
  sled:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP3_x86_64/
  sled:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP4_x86_64/

  $ sumaxy $wd x86_64 SLED
  sled:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP3_x86_64/
  sled:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP4_x86_64/

  $ sumaxy $wd i586 SUSE_SLED
  sled:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP3_i586/
  sled:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP4_i586/

  $ sumaxy $wd ppc64 SLES
  sles:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP3_ppc64/
  sles:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP4_ppc64/

  $ sumaxy $wd x86_64 SUSE_SLES
  sles:11.1-TERADATA::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP1-TERADATA_x86_64/
  sles:11.3-TERADATA::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP3-TERADATA_x86_64/
  sles:11.3::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP3_x86_64/
  sles:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP4_x86_64/

  $ sumaxy $wd x86_64 SUSE_SLES:11-SP4
  sles:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-SERVER_11-SP4_x86_64/

  $ sumaxy $wd x86_64 SUSE_SLED:11-sp4
  sled:11.4::p=1023 http://dl.example.org/ibs/SUSE:/Maintenance:/1023/SUSE_Updates_SLE-DESKTOP_11-SP4_x86_64/
