Carol Cheryl Cristal
====================

It's SUSE Cloud!  No, it's SUSE OpenStack Cloud!  No, it's
something else!  Also, the IBS project needs a snowflaky name!

Suffering from ADHD or OCD?  Have mercy with humanity,
keep your hands off product naming, please.

setup::

  $ . $TESTDIR/setup

cloud 5::

  $ wd=$FIXTURES/SUSE:Maintenance:2233:104257

  $ sumaxy $wd x86_64
  suse-cloud:5::p=2233 http://dl.example.org/ibs/SUSE:/Maintenance:/2233/SUSE_Updates_SUSE-CLOUD_5_x86_64/

  $ sumaxy $wd x86_64 suse-cloud:5
  suse-cloud:5::p=2233 http://dl.example.org/ibs/SUSE:/Maintenance:/2233/SUSE_Updates_SUSE-CLOUD_5_x86_64/

  $ sumaxy $wd x86_64 suse-cloud
  suse-cloud:5::p=2233 http://dl.example.org/ibs/SUSE:/Maintenance:/2233/SUSE_Updates_SUSE-CLOUD_5_x86_64/

  $ sumaxy $wd x86_64 suse-openstack-cloud:5

  $ sumaxy $wd x86_64 suse-openstack-cloud

cloud 6::

  $ wd=$FIXTURES/SUSE:Maintenance:2218:103606

  $ sumaxy $wd x86_64
  ses:2.1::p=2218 http://dl.example.org/ibs/SUSE:/Maintenance:/2218/SUSE_Updates_Storage_2.1_x86_64/
  suse-openstack-cloud:6::p=2218 http://dl.example.org/ibs/SUSE:/Maintenance:/2218/SUSE_Updates_OpenStack-Cloud_6_x86_64/

  $ sumaxy $wd x86_64 suse-cloud:6

  $ sumaxy $wd x86_64 suse-cloud

  $ sumaxy $wd x86_64 suse-openstack-cloud:6
  suse-openstack-cloud:6::p=2218 http://dl.example.org/ibs/SUSE:/Maintenance:/2218/SUSE_Updates_OpenStack-Cloud_6_x86_64/

  $ sumaxy $wd x86_64 suse-openstack-cloud
  suse-openstack-cloud:6::p=2218 http://dl.example.org/ibs/SUSE:/Maintenance:/2218/SUSE_Updates_OpenStack-Cloud_6_x86_64/
