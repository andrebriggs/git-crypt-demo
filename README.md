# git-crypt automated walkthrough

## Requirements

Run `brew install git-crypt` to install [git-crypt](https://github.com/AGWA/git-crypt)

## Instructions

Run `sh demo-encryption.sh` and view the output. It will look something like this:

<pre>
$ sh example.sh
Initialized empty Git repository in /private/var/folders/lj/9dqdzw193jg2jhjp9x19fyb00000gn/T/git-crypt-example.qadG8zCJ/.git/
Generating key...
[master (root-commit) 56f46ae] Initial commit
 2 files changed, 2 insertions(+)
 create mode 100644 .gitattributes
 create mode 100644 README.md
    <b>encrypted: config.secret.yaml</b>
not encrypted: config.yaml
not encrypted: .gitattributes
not encrypted: README.md
[master ec04ae9] Adding yaml files
 2 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 config.secret.yaml
 create mode 100644 config.yaml
 </pre>

 Notice that `config.secret.yaml` is encrypted but `config.yaml` is not. If we were to push the created git repo to a remote origin the `config.secret.yaml` file would be encrypted. You can see an example live repo [here](https://github.com/andrebriggs/git-crypt-demo-example)

## Use Cases

 A pattern like this can be used in CI/CD orchestrations such as Azure DevOps pipelines to provide plain sight encryption to files. This could be useful in GitOps patterns where obfuscation via environment variables might not be preferred.
