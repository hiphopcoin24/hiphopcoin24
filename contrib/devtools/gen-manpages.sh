#!/usr/bin/env bash
# Copyright (c) 2016-2019 The Hiphopcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

HIPHOPCOIND=${HIPHOPCOIND:-$BINDIR/hiphopcoind}
HIPHOPCOINCLI=${HIPHOPCOINCLI:-$BINDIR/hiphopcoin-cli}
HIPHOPCOINTX=${HIPHOPCOINTX:-$BINDIR/hiphopcoin-tx}
WALLET_TOOL=${WALLET_TOOL:-$BINDIR/hiphopcoin-wallet}
HIPHOPCOINQT=${HIPHOPCOINQT:-$BINDIR/qt/hiphopcoin-qt}

[ ! -x $HIPHOPCOIND ] && echo "$HIPHOPCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
read -r -a HPCVER <<< "$($HIPHOPCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }')"

# Create a footer file with copyright content.
# This gets autodetected fine for hiphopcoind if --version-string is not set,
# but has different outcomes for hiphopcoin-qt and hiphopcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$HIPHOPCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $HIPHOPCOIND $HIPHOPCOINCLI $HIPHOPCOINTX $WALLET_TOOL $HIPHOPCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${HPCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${HPCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
