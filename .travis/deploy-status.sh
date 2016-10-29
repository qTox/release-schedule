#!/bin/bash

# used in travis to deploy status to gh-pages branch

(
cd web
git init
git config user.name "Travis CI"
git config user.email "zetok@users.noreply.github.com"
echo "<body></body>" > index.html
git add .
git commit --quiet -m "Deploy to GH pages."
git push --force --quiet "https://${GH_TOKEN}@github.com/qTox/release-schedule.git" master:gh-pages &> /dev/null
)
