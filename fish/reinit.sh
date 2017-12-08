#! /usr/bin/env sh

DIR=$(dirname "$0")
cd "$DIR"

. ../scripts/symlink.sh

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/.config/fish)"

echo "Source path:\t\t $SOURCE"
echo "Destination path:\t $DESTINATION"

echo "Creating destination folders"
mkdir -vp "$DESTINATION/functions"
mkdir -vp "$DESTINATION/functions/projects"
mkdir -vp "$DESTINATION/completions"

find * -name "*.fish" -not -name '_*.fish' | while read fn; do
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done
