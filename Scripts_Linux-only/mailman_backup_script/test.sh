#!/bin/bash

#########################################################################
# mailman-backup-script <https://github.com/pirafrank/CLI_utils>
# Backups mailman archives
#
# Copyright (C) 2015 Francesco Pira <dev@fpira.com> 
#
# This file is part of CLI_utils.
#
# CLI_utils is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# CLI_utils is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with CLI_utils. If not, see <http://www.gnu.org/licenses/>.
#
#########################################################################

INPUT="/Users/francesco/Desktop/test-input/"
OUTPUT="/Users/francesco/Desktop/test-input/mailman-txt-backup/"
#OUTPUT="/Users/francesco/Desktop/test-input/mailman-html-backup/"

rsync -avm --exclude attachments/ --include='*.txt' -f 'hide,! */' "$INPUT" "$OUTPUT"
#rsync -avm --exclude attachments/ --include='*.html' -f 'hide,! */' "$INPUT" "$OUTPUT"

# cp -ri /path/to/extracted/tar/mailman-html-backup/ /var/lib/mailman/archives/
# cp -ri /path/to/extracted/tar/mailman-txt-backup/ /var/lib/mailman/archives/

# tar -zxvf mailman-txt-backup.tar.gz
# tar -zxvf mailman-html-backup.tar.gz
