#!/bin/bash
PACKAGES=

DIRS=$(find .. -type d -not -path "*/\.*")
for DIR in $DIRS; do
    if [[ $DIR != "." ]]; then
        [[ -f "$DIR/README.md" ]] && PACKAGES=$PACKAGES:$DIR
    fi
done

( IFS=:
    for PACKAGE in $PACKAGES; do
        if [[ $PACKAGE != ".." && $PACKAGE != "" ]]; then
            TREE=$(cd $PACKAGE && git ls-files | tree -a --fromfile)
            python3 update_file_tree.py "$PACKAGE/README.md" "$TREE"
        fi
    done
)
