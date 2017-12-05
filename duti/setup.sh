#! /usr/bin/env sh

# Tips: BundleID mdls -name kMDItemCFBundleIdentifier -r "/Applications/App Name.app"

DIR=$(dirname "$0")
cd "$DIR"

find * -not -name "setup.sh" -type f | while read fn; do
    while read ext; do
        echo "duti -s $fn $ext all"
        duti -s $fn $ext all
    done < $fn
done
