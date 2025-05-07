#!/bin/bash

mkdir -p rendered

recompiled=0

for f in $(fd --exclude "typst/*" ".typ")
do
	out_nosuffix="rendered/$(dirname $f)/$(basename -s .typ $f)"
	mkdir -p "rendered/$(dirname $f)"

	# Recompile only if md5 of the typst file has changed
	if [ -f "$out_nosuffix.checksum" ]; then
		old_checksum=$(cat "$out_nosuffix.checksum")
		if [ "$(md5sum "$f")" != "$old_checksum" ]; then
			typst compile "$f" "$out_nosuffix.pdf" &
			md5sum "$f" > "$out_nosuffix.checksum"
			recompiled=$(($recompiled + 1))
		fi
	else
		typst compile "$f" "$out_nosuffix.pdf" &
		md5sum "$f" > "$out_nosuffix.checksum"
		recompiled=$(($recompiled + 1))
	fi
done

wait

echo "Recompiled $recompiled new files."
