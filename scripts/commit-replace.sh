#!/bin/sh

git filter-branch -f --env-filter '

OLD_EMAIL="your-old-email@example.com"
CORRECT_NAME="miodzie"
CORRECT_EMAIL="miodzie@protonmail.com"

# if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
# then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
# fi
# if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
# then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
# fi
' --tag-name-filter cat -- --branches --tags

# then: git push --force --tags origin 'refs/heads/*'
# or only selected references of the branches: git push --force --tags origin 'refs/heads/develop'
