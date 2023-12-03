#!/usr/bin/env bash

CURDIR=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

. "$CURDIR/dirs.env"

function extract_single_zip {
    local ZIP_FILE=$(realpath "$1")
    local FONT_NAME=$(basename -s .zip "$ZIP_FILE")
    local TEMPDIR=$(mktemp -d)

    # Target directories
    local TARGET_DIR=$(realpath -m "$CURDIR/$EXTRACTED_FONTS_DIR/$FONT_NAME")
    local TARGET_OTF_DIR=$TARGET_DIR/otf
    local TARGET_TTF_DIR=$TARGET_DIR/ttf

    # Unzip fonts into the temporary directory
    unzip -q -o -d "$TEMPDIR" "$ZIP_FILE"

    # Find fonts in the temporary directory (otf & ttf), and copy them to target directories
    find "$TEMPDIR" -type f -regextype posix-extended -regex '.*/[^.][^/]+\.(otf|ttf)$' | {
        while read -r FONT_FILE; do
            if [[ "$FONT_FILE" =~ .*\.otf ]]; then
                mkdir -p "$TARGET_OTF_DIR"
                cp "$FONT_FILE" "$TARGET_OTF_DIR"
            elif [[ "$FONT_FILE" =~ .*\.ttf ]]; then
                mkdir -p "$TARGET_TTF_DIR"
                cp "$FONT_FILE" "$TARGET_TTF_DIR"
            fi
        done
    }

    # Clean up
    rm -rf "$TEMPDIR"
}

function extract_all_zip {
    local ZIP_DIR=$(realpath "$1")

    find "$ZIP_DIR" -type f -name '*.zip' | {
        while read -r ZIP_FILE; do
            extract_single_zip "$ZIP_FILE"
        done
    }
}

extract_all_zip "$CURDIR/$FONTS_ZIP_DIR"