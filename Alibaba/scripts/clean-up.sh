#!/usr/bin/env bash

CURDIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

. "$CURDIR/dirs.env"

rm -rf "$CURDIR/$EXTRACTED_FONTS_DIR"