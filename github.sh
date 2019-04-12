rm -rf ~/.ssh/id_rsa ~/.ssh/id_rsa.pub
ssh-keygen -t rsa -b 4095 -C "contact@fabienlefrapper.me"
ssh-add ~/.ssh/id_rsa
pub=`cat ~/.ssh/id_rsa.pub`
read -p "Enter github username: " githubuser
echo "Using username $githubuser"
curl -u $githubuser -X POST -d "{\"title\":\"`hostname`\",\"key\":\"$pub\"}" https://api.github.com/user/keys
