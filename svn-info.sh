#!/bin/sh

## From Jeroen Ooms: https://raw.githubusercontent.com/r-devel/r-svn/4261a6da16aff47c92ca4f815f4ba4cf93521ae0/.github/scripts/svn-info.sh

# This is a hack to infer the SVN revision number from the git mirror
set -e
echo "Revision: $(git log --grep="git-svn-id" -n1 | grep git-svn | cut -d'@' -f2 | cut -d' ' -f1)"
echo "Last Changed Date: $(git log --grep="git-svn-id" -n1 --pretty=format:"%ad" --date=short)"
exit 0
