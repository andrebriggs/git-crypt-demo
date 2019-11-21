repo_path=$(mktemp -d -t git-crypt-example)
cd $repo_path
git init
touch README.md
echo "This is repo has secrets." >> README.md

# Intialize git-crypt
git-crypt init

# Export the key git-crypt will use so we can share it
git-crypt export-key ~/git-crypt-key

touch .gitattributes
echo "*.secret.yaml filter=git-crypt diff=git-crypt" >> .gitattributes

git add -A
git commit -m "Initial commit"

touch config.secret.yaml
echo "access_token:9dqdzw193jg2jhjp9x19fyb" >> config.secret.yaml

touch config.yaml
echo "agent_vm_count:5" >> config.yaml

# Stage the encrypted version
git-crypt status -f

# Verify files we expect are encrypted
git-crypt status
git add *.yaml
git commit -m "Adding yaml files"

