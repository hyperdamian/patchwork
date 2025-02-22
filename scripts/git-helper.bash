#!/usr/bin/env bash

git config --local user.name 'Damian Kołaczyński'
echo "Git property 'user.name' set to: $(git config --local user.name)"

git config --local user.email '60873175+hyperdamian@users.noreply.github.com'
echo "Git property 'user.email' set to: $(git config --local user.email)"

# Refer to "Connecting to GitHub with SSH" at GitHub Help:
# https://help.github.com/articles/connecting-to-github-with-ssh/
echo "Please remember to generate SSH key and add it to GitHub account!"
