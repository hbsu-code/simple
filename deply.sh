npm run generate &&
cd ./.output/public &&
git init . && git add -A . &&
git checkout -b gh-pages &&
git remote add origin git@github.com-hbsu:hbsu-code/simple.git &&
git commit -m "git init-4" &&
git push origin gh-pages -f
