#!/bin/bash
#
#    Copyright © 2016 Zetok Zalbavar <zetok@openmailbox.org>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.


set -eu -o pipefail


# get the first line from provided file
first_line() {
    head -n1 "$@"
}

# create new line, "opposite" to what it was from provided file
newline() {
    local old=( $(first_line "$@") )
    local state="${old[3]}"
    local new="${old[0]} ${old[1]} ${old[2]}"

    if [[ $state = "merging" ]]
    then
        new="${new} testing"
    else
        new="${new} merging"
    fi
    echo $new
}

# get all the lins except the first one from provided file
other_lines() {
    tail -n +2 "$@"
}


change() {
    local file="README.md"
    local header=$(newline $file)
    local rest=$(other_lines $file)
    echo "$header" > "$file"
    echo "$rest" >> "$file"
}

change
