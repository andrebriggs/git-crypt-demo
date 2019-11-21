#brew install git-crypt # Assumes Mac OS
repo_name=$1

mkdir "test"
mkdir $repo_name
cd "test/$repo_name"
git init
touch README.md
echo "This is repo has secrets." >> README.md

touch .gitattributes
echo "*.secret filter=git-crypt diff=git-crypt" >> .gitattributes

git add -A
git commit -m "Initial commit"

touch config.secret
echo "Super duper secrets" >> config.secret
git add config.secret

git-crypt status

git commit -m "Adding config.secret file"

