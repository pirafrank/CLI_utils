#!/bin/bash

INPUT="/Users/francesco/Desktop/test-input/"
OUTPUT="/Users/francesco/Desktop/test-input/mailman-txt-backup/"
#OUTPUT="/Users/francesco/Desktop/test-input/mailman-html-backup/"

rsync -avm --exclude attachments/ --include='*.txt' -f 'hide,! */' "$INPUT" "$OUTPUT"
#rsync -avm --exclude attachments/ --include='*.html' -f 'hide,! */' "$INPUT" "$OUTPUT"

# cp -ri /path/to/extracted/tar/mailman-html-backup/ /var/lib/mailman/archives/
# cp -ri /path/to/extracted/tar/mailman-txt-backup/ /var/lib/mailman/archives/

# tar -zxvf mailman-txt-backup.tar.gz
# tar -zxvf mailman-html-backup.tar.gz
