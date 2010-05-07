#!/bin/sh

if [ "x$1" == x ]; then
    echo "Usage: $0 directory/where/to/put/zip-file"
    exit 1
fi

# Remove trailing slash.
path=`dirname $1`/`basename $1`
full="$path"/gtk64-source

if [ -f "$full" ]; then
    echo "$full already exists, remove it or use another path."
    exit 1
fi

# Export the tree.
git-checkout-index --prefix="$full"/ -a

# Clean out unwanted files.
rm "$full"/build2.bat
rm "$full"/.gitignore
rm -r "$full"/tools

# Pack it up.
rm "$full".zip 2>/dev/null
pushd . >/dev/null
cd $path
zip -r gtk64-source.zip gtk64-source
popd >/dev/null

# Remove tree.
rm -r "$full"
