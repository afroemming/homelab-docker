#! /bin/bash
cd "${0%/*}"
source ../.env

mkdir $SECRETSDIR
openssl rand -hex 64 > $SECRETSDIR/authelia_jwt_secret
openssl rand -hex 64 > $SECRETSDIR/authelia_session_secret
openssl rand -hex 64 > $SECRETSDIR/authelia_storage_encryption_key_file
openssl rand -hex 64 > $SECRETSDIR/ldap_jwt_secret
openssl rand -hex 64 > $SECRETSDIR/ldap_user_pass

touch $SECRETSDIR/acme.json

printf "htppaswd\n"
htpasswd -c $SECRETSDIR/.htpasswd $BASICAUTHUSER

printf 'cloudflare email:\n'
read CFMAIL
echo "$CFMAIL" > $SECRETSDIR/cloudflare_email

printf 'cloudflare key:\n'
read -s CFKEY
echo "$CFKEY" > $SECRETSDIR/cloudflare_api_key

printf 'smtp password:\n'
read -s SMTPPASS
echo "$SMTPPASS" > $SECRETSDIR/smtp_password

printf 'openvpn user:\n'
read -s VPNUSER
echo "$VPNUSER" > $SECRETSDIRS/openvpn_user

printf 'openvpn pass:\n'
read -s VPNPASS
echo "$VPNPASS" > $SECRETSDIRS/openvpn_pass


chown -R root:root $SECRETSDIR
chmod -R 600 $SECRETSDIR
