#!/usr/bin/zsh -f
# vim: ft=zsh sw=2 sts=2 et fdm=marker cms=\ #\ %s

# Copyright (C) 2016 SUSE LLC
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# inspects maintenance update metadata to produce a list of urls
# to .repo files which need to be registered in a host to install
# the candidate packages.
#
# inputs:
#
# * project.xml, result of
#    osc meta prj $slug
# * packages.xml, result of
#    osc api "/search/published/binary/id?match=project='$slug'&limit=0"
#
# where $slug is "$issuer:Maintenance:$issue"
#
# * packages.xml has (package, arch, bsrepo) tuples
# * project.xml has (bsrepo, bsproject) tuples
#
# tldr: this does an equivalent of
#
#   SELECT DISTINCT prj.bsproject
#   FROM project.xml prj, packages.xml pkg
#   WHERE pkg.bsrepo = prj.bsrepo
#     AND pkg.arch = %(arch)

setopt extended_glob
setopt hist_subst_pattern
setopt err_return
setopt no_unset
setopt warn_create_global

declare -Tgx SUMAXY_CHATTY sumaxy_chatty \|
declare -Tgx SUMAXY_DRYRUN sumaxy_dryrun \|

declare -r cmdname=$0:t
declare -ir logfd=2

. haveopt.sh

declare -A product_names; product_names=()
declare -A repo_urls; repo_urls=()

. ${SUMAXYRC-"@sysconfdir@/sumaxy"} || exit 2

function main # {{{
{
  local -a options; options=(
    h  help
    A  ar  addrepo
    F= file=
    R  rr  removerepo
  )
  local -i oi=0
  local on oa
  local mode
  while haveopt oi on oa $=options -- "$@"; do
    case $on in
    h | help            ) display-help $on ;;
    A | ar | addrepo    ) mode=ar ;;
    R | rr | removerepo ) mode=rr ;;
    *                   ) reject-misuse -$oa ;;
    esac
  done; shift $oi

  (( $# > 1 )) || reject-misuse

  local -r dir=$1 arch=$2; shift 2
  local -a args; args=($@)
  local -i i
  local -a products reply
  for (( i=1; i <= $#args; ++i )); do
    fixup-prpa $args[$i]
    products+=($reply)
  done

  ; o dump-data "$dir" \
  | o name-url "$arch" $products \
  | o format-output $mode
} # }}}

function fixup-prpa # {{{
{
  local a=$1 p v
  case $a in
  *:?*) p=${a%%:*} v=${a#*:} ;;
  *:  ) : fall through       ;&
  *   ) p=$a v='*'           ;;
  esac
  v=${${(L)v}/[.-]sp/.}
  if [[ ${(L)p} == ((suse_)#sle[ds]) ]]; then
    p=${${(L)p}#suse_}
  fi
  if [[ $p == ses && $v == 1 ]]; then
    v=1.0
  fi
  reply=($p${v:+:$v})
  if [[ $p == sle[sd] && $v == 11(.<->)# ]]; then
    reply+=($p:11-SECURITY)
  fi
} # }}}

function dump-data # {{{
{
  local -r dir=$1

  local -r prjs=$(mktemp)
  local -r pkgs=$(mktemp)

  o xform-projects $dir/project.xml $prjs
  o xform-packages $dir/packages.xml $pkgs

  o join -j 1 $prjs $pkgs
} # }}}

function name-url # {{{
{
  local -r arch=$1; shift
  local -a products; products=($@)

  local REPLY r prj i parc
  while read r prj i parc; do
      [[ $parc == ($arch|noarch) && $prj == *:$arch ]] \
      || continue
      REPLY=
      o get-product-name $prj $arch
      (( $#products )) && {
        [[ ${REPLY%-LTSS} == ${(j.|.)~products} ]] \
        || continue
      }
      local url="${(e)repo_urls[${i%%:*}]}"
      o print -f "%s %s::p=%s %s\n" -- \
        "${REPLY%%:*}" \
        "${REPLY}" \
        "${i##*:}" \
        "$url"
    done \
  | sort -u
} # }}}

function format-output # {{{
{
  local pn rn ru mode=${1-}
  while read pn rn ru; do
    case $mode in
    ar) o print "zypper ar -cgkn issue-$rn $ru issue-$rn" ;;
    rr) o print "zypper rr issue-$ru" ;;
    * ) o print "issue-$rn $ru" ;;
    esac
    done
} # }}}

function xform-projects # {{{
{
  local inf=$1 ouf=$2
  o xml sel -T -t \
    -m '/project/repository[releasetarget/@repository="update"]' \
    -v @name \
    -o ' ' \
    -v releasetarget/@project \
    --nl \
    $inf \
  | sort \
  > $ouf
} # }}}

function xform-packages # {{{
{
  local inf=$1 ouf=$2
  o xml sel -T -t \
    -m /collection/binary \
    -v @repository \
    -o ' ' \
    -v @project \
    -o ' ' \
    -v @arch \
    --nl \
    $inf \
  | sort \
  > $ouf
} # }}}

function get-product-name # {{{
{
  local prj=$1 arch=$2
  local prdver=${${prj#SUSE:Updates:}%:$arch}
  local prd=${prdver%:*}
  local ver=${${prdver#*:}/-SP/.}
  local issuer=${prj%%:*}
  REPLY=${product_names[$issuer:$prd]:-${(L)prd}}:$ver
} # }}}

function reject-misuse # {{{
{
  local val=${1-} c=$cmdname ex=1
  case $val in
  -?)  print -f "%s: unknown option '%s'\n" -- $c $val ;;
  -?*) print -f "%s: unknown option '%s'\n" -- $c -$val ;;
  ?*)  print -f "%s: unknown argument '%s'\n" -- $c $val ;;
  '')  print -f "%s: missing argument\n" -- $c ;;
  esac
  display-help x
  exit $ex
} # }}}

function display-help # {{{
{
  local c=${cmdname/-/ }
  local -i ex=1
  case $1 in
  help  ) o exec man $cmdname
          ex=0 ;;
  h     ) ex=0 ;&
  *     ) print -u 2 "$c: usage: $c [-A | -R] <DIR> <ARCH> [<PRODUCT>...]" ;;
  esac
  exit $ex
} # }}}

function o o- # {{{
{
  declare -i dryrun=0
  if [[ $1 == -n ]]; then
    shift
    dryrun=1
  fi
  if (( $#SUMAXY_CHATTY )); then
    if [[ "${(@j,%,)@}" == $~SUMAXY_CHATTY ]]; then
      print -ru $logfd -- o "${(q-)@}"
    fi
  fi
  if (( $#SUMAXY_DRYRUN )); then
    if [[ "${(@j,%,)@}" == $~SUMAXY_DRYRUN ]]; then
      dryrun=1
    fi
  fi
  if (( dryrun )); then
    return 0
  fi
  "$@"
} # }}}

main "$@"
