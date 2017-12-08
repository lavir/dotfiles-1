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
mkdir -vp "$DESTINATION/completions"

find * -name "*.fish" -not -name '_*.fish' | while read fn; do
    symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done

# Run setup
fish -c "setup"

if [ "$1" == "-chsh" ]; then
    sudo bash -c "echo /usr/local/bin/fish >> /etc/shells"
    sudo chsh -s /usr/local/bin/fish
fi

# Install Powerline 
echo "Install Powerline"
pip install powerline-status

# Install Fisherman 
echo "Install Fisherman"
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

# Install plugins
# echo "fisher done" | fish

# Install oh-my-fish
curl -L https://get.oh-my.fish | fish
# https://github.com/oh-my-fish/theme-bobthefish
echo "omf install await bobthefish" | fish

echo "Apply theme"
echo "omf theme bobthefish" | fish