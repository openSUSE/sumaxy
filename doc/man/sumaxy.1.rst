.. vim: ft=rst sw=2 sts=2 et

==========
**sumaxy**
==========

-----------------------------------------------------
Query maintenance update metadata for repository URLs
-----------------------------------------------------

:Authors:
:Copyright: GPL-3.0
:Version: @VERSION@
:Manual section: 1
:Manual group: User Commands
:Maintainer: openSUSE Project

SYNOPSIS
========

**sumaxy** **-h** \| **--help**

**sumaxy** [**-A** \| **-R**] *DIR* *ARCH* [*PROD*...]

DESCRIPTION
===========

**sumaxy** inspects metadata for a maintenance update, and
writes to standard output repository names and URLs (or zypper commands
to add or remove said repositories) for specified architecture and product
patterns.

OPTIONS
=======

:-h:
  Display usage instructions.

:--help:
  Display full help.

:-A, --addrepo:
  Output **zypper -n ar -cgk** commands.

:-R, --removerepo:
  Output **zypper -n rr** commands.

OPERANDS
========

*DIR*
  Directory containing *project.xml* and *packages.xml* files for
  a maintenance update.

*ARCH*
  Architecture of requested repositories. **sumaxy** will return only repositories
  targeting *ARCH*.

*PROD*
  Product pattern. If any product patterns are specified, **sumaxy** will return
  only repositories for those products. In the absence of product patterns,
  **sumaxy** will return repositories for all products and versions with published
  packages in the input files.

INPUT FILES
===========

**sumaxy** consumes XML data in files listed below, produced by the
corresponding BuildService API endpoints.

*DIR/packages.xml*
  **osc** **api** "/search/published/binary/id?match=project='*$mprj*'&limit=0"

*DIR/project.xml*
  **osc** **api** "/source/*$mprj*/_meta"

STDOUT
======

By default, each line of output contains a repository name / URL
pair separated by a single space. If either **-A** or **-R** is given, each line
of output contains a **zypper addrepo** or **zypper removerepo** command line.

EXTENDED DESCRIPTION
====================

**Product patterns** are *EXTENDED\_GLOB* patterns (see zshexpn(1)), and are used
to match strings of this format:

  |
  | *P*:*V*
  |
  | *P*   is a product name
  | *V*   is a version string

**Product names** are the variety found in */etc/products.d/\*.prod* files
(XPath: */product/name/text()*). “SUSE_SLES”, “SLES”, and “sles” are equivalent;
same with “SUSE_SLED”, “SLED”, and “sled”.

**Architecture names** are the variety found in */etc/products.d/\*.prod* files
(XPath: */product/arch/text()*).

**Version strings** use the *MAJOR*.\ *MINOR* format, *MINOR* may have the form
sp\ *N* where *N* is a number. “12.1”, “12.sp1”, “12.SP1” are equivalent.

**Repository names** output by **sumaxy** conform to the following format:

  |
  | *P*:*V*::p=\ *I*
  |
  | *P*   is a product name
  | *V*   is a version string
  | *I*   is an issue (patch) number

EXAMPLES
========

Show x86\_64 repositories for SLE-SERVER and SLE-SDK 12-SP1:

  |
  | $ sumaxy . x86_64 sles:12.1 sle-sdk:12.1

Show s390x repositories for SLE-SERVER 12-SP1 and SUSE Enterprise Storage:

  |
  | $ sumaxy . s390x sles:12.1 ses

Show ppc64le repositories for SLE-SERVER 12-SP1, SLE-DESKTOP 12, and SLE-SDK 12-SP1:

  |
  | $ sumaxy . ppc64le sles:12.1 sle-sdk:12.1 sled:12

SEE ALSO
========

refdb(1), repose(1), zshexpn(1).
