#!/bin/bash

set -x

for f in $(fd ".typ")
do
	typst compile "$f"
done
