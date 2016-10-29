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


# get current status of the week from the file
get_status() {
    local line=( $(head -n1 "$@") )
    echo ${line[3]}
}

# based on the supplied status of the week, return proper file name
get_svg() {
    local status=$(get_status "$@")
    local directory="res/"
    local merges="$directory/week of-merges-green.svg"
    local testing="$directory/week of-testing-orange.svg"

    if [[ $status = "merging" ]]
    then
        echo "$merges"
    elif [[ $status = "testing" ]]
    then
        echo "$testing"
    else
        echo "No matching status!"
        echo "$status"
        exit 1
    fi
}

# push the right status file to `web` dir and name it `status.svg`
push_status() {
    local file="README.md"
    local svg=$(get_svg $file)
    if [[ ! -d web ]]
    then
        mkdir web
    fi
    cp "$svg" web/status.svg
}

push_status
