#!/bin/sh

if [ "x$1" == x ]; then
    echo "Usage: $0 directory/where/to/put/diffs"
    exit 1
fi

# Remove trailing slash.
path=`dirname $1`/`basename $1`
full="$path"/gtk64-patches

if [ -f "$full" ]; then
    echo "$full already exists, remove it or use another path."
    exit 1
fi

mkdir -p "$full"

git diff --diff-filter=ACM a0d4c1cbb1b8e98e44f4c5b47b3a0313f21fbc31 HEAD libiconv-win/ > "$full"/libiconv-win.diff

git diff --diff-filter=ACM 93165f7c3530dadf16bb74ba66fb7faf828e5f88 HEAD gettext-0.17/ > "$full"/gettext-0.17.diff

git diff --diff-filter=ACM ad82348726d9b32e8dd1e32e13819ae943279b71 HEAD glib-2.14.6/ > "$full"/glib-2.14.6.diff

git diff --diff-filter=ACM e44660d24244ae774f7c01dc95aff28112ccb928 HEAD zlib-1.2.3/ > "$full"/zlib-1.2.3.diff

git diff --diff-filter=ACM cbf78c35c0fe9f6c3086518262898a9066760926 HEAD libpng-1.2.26/ > "$full"/libpng-1.2.26.diff

git diff --diff-filter=ACM 561d966ecd41b07fb184356ff26d47bbaabfb5da HEAD cairo-1.4.14/ > "$full"/cairo-1.4.14.diff

git diff --diff-filter=ACM 9f858234130f7b09b131bbfd9e8a3fbdf14482b5 HEAD pango-1.18.4/ > "$full"/pango-1.18.4.diff

git diff --diff-filter=ACM a682bb28f847e40fc9328ca7170a1166d638ef6b HEAD atk-1.22.0/ > "$full"/atk-1.22.0.diff

git diff --diff-filter=ACM 8bea8048562550ffd45697fb5b3b1f6e66e4f504 HEAD gtk+-2.12.9/ > "$full"/gtk+-2.12.9.diff

rm "$full".zip 2>/dev/null
pushd . >/dev/null
cd $path
zip -r gtk64-patches.zip gtk64-patches
popd >/dev/null

# Remove tree.
rm -r "$full"
