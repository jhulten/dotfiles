SEOMOZ_ROOT=~/src/github.com/seomoz
alias edit_secrets='ansible-vault edit ~/rogeros-ansible-secrets.yml.encrypted --vault-password-file ~/.rogeros-ansible-vault-pass'
alias fetch_secrets='pushd $SEOMOZ_ROOT/roger && ansible-playbook -i ansible/hosts/dev-1 ansible/ansible-secrets-fetch.yml && popd'
alias push_secrets='pushd $SEOMOZ_ROOT/roger && ansible-playbook -i ansible/hosts/dev-1 ansible/ansible-secrets-push.yml && popd'
alias view_secrets='ansible-vault view ~/rogeros-ansible-secrets.yml.encrypted --vault-password-file ~/.rogeros-ansible-vault-pass'

chruby chefdk
