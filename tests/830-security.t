SECURITY handling
=================


setup::

  $ . $TESTDIR/setup
  $ wd=$FIXTURES/SUSE:Maintenance:2455:113589

test::

  $ sumaxy $wd x86_64
  sle-debuginfo:11.3-TERADATA::p=2455 http://dl.example.org/ibs/SUSE:/Maintenance:/2455/SUSE_Updates_SLE-DEBUGINFO_11-SP3-TERADATA_x86_64/
  sle-debuginfo:11.3::p=2455 http://dl.example.org/ibs/SUSE:/Maintenance:/2455/SUSE_Updates_SLE-DEBUGINFO_11-SP3_x86_64/
  sle-debuginfo:11.4::p=2455 http://dl.example.org/ibs/SUSE:/Maintenance:/2455/SUSE_Updates_SLE-DEBUGINFO_11-SP4_x86_64/
  sle-sdk:11.4::p=2455 http://dl.example.org/ibs/SUSE:/Maintenance:/2455/SUSE_Updates_SLE-SDK_11-SP4_x86_64/
  sles:11-SECURITY::p=2455 http://dl.example.org/ibs/SUSE:/Maintenance:/2455/SUSE_Updates_SLE-SERVER_11-SECURITY_x86_64/
  sles:11.1-TERADATA::p=2455 http://dl.example.org/ibs/SUSE:/Maintenance:/2455/SUSE_Updates_SLE-SERVER_11-SP1-TERADATA_x86_64/
  sles:11.3-LTSS::p=2455 http://dl.example.org/ibs/SUSE:/Maintenance:/2455/SUSE_Updates_SLE-SERVER_11-SP3-LTSS_x86_64/
  sles:11.3-TERADATA::p=2455 http://dl.example.org/ibs/SUSE:/Maintenance:/2455/SUSE_Updates_SLE-SERVER_11-SP3-TERADATA_x86_64/
  sles:11.4::p=2455 http://dl.example.org/ibs/SUSE:/Maintenance:/2455/SUSE_Updates_SLE-SERVER_11-SP4_x86_64/
  suse-cloud:5::p=2455 http://dl.example.org/ibs/SUSE:/Maintenance:/2455/SUSE_Updates_SUSE-CLOUD_5_x86_64/
  suse-manager-proxy:2.1::p=2455 http://dl.example.org/ibs/SUSE:/Maintenance:/2455/SUSE_Updates_SUSE-MANAGER-PROXY_2.1_x86_64/
  suse-manager-server:2.1::p=2455 http://dl.example.org/ibs/SUSE:/Maintenance:/2455/SUSE_Updates_SUSE-MANAGER_2.1_x86_64/

  $ sumaxy $wd x86_64 sles:11.3
  sles:11-SECURITY::p=2455 http://dl.example.org/ibs/SUSE:/Maintenance:/2455/SUSE_Updates_SLE-SERVER_11-SECURITY_x86_64/
  sles:11.3-LTSS::p=2455 http://dl.example.org/ibs/SUSE:/Maintenance:/2455/SUSE_Updates_SLE-SERVER_11-SP3-LTSS_x86_64/

  $ sumaxy $wd x86_64 sles:11.4
  sles:11-SECURITY::p=2455 http://dl.example.org/ibs/SUSE:/Maintenance:/2455/SUSE_Updates_SLE-SERVER_11-SECURITY_x86_64/
  sles:11.4::p=2455 http://dl.example.org/ibs/SUSE:/Maintenance:/2455/SUSE_Updates_SLE-SERVER_11-SP4_x86_64/
