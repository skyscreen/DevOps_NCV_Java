consul-template -template "consul.tpl:vault.html" -once -config $CONSUL_CONFIG
value=`cat vault.html`
export VAULT_TOKEN=$value
consul-template -template "vault.tpl:vault.html" -once -config $CONSUL_CONFIG
rm -rf /usr/local/tomcat/webapps/vault
mkdir -p /usr/local/tomcat/webapps/vault
cp /tmp/vault.html /usr/local/tomcat/webapps/vault/
