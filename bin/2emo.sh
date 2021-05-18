#!/bin/sh
# convert words like e.g. house or smile from stdin to emojis.

xargs -r printf ':%s:' | pandoc -f gfm -t plain
