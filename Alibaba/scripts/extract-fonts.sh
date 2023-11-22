#!/usr/bin/env bash

CURDIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

. "$CURDIR/dirs.env"

function extract_single_zip {
    local ZIP_FILE=$(realpath "$1")
    local FONT_NAME=$(basename -s .zip "$ZIP_FILE")
    local TEMPDIR=$(mktemp -d)

    # Create target directory
    local TARGET_DIR=$(realpath -m "$CURDIR/$EXTRACTED_FONTS_DIR/$FONT_NAME")
    mkdir -p "$TARGET_DIR"

    # Unzip fonts into the temporary directory
    unzip -o -d "$TEMPDIR" "$ZIP_FILE"

    # Find fonts in the temporary directory, and copy them to target directory
    find "$TEMPDIR" -type f -regextype posix-extended -regex '.*/[^.][^/]+\.(otf|ttf)$' \
        -exec cp {} "$TARGET_DIR" \;

    # Clean up
    rm -rf "$TEMPDIR"
}

function extract_all_zip {
    local ZIP_DIR=$(realpath "$CURDIR/$FONTS_ZIP_DIR/")

    find "$ZIP_DIR" -type f -name '*.zip' | {
        while read -r ZIP_FILE; do
            extract_single_zip "$ZIP_FILE"
        done
    }
}

extract_all_zip