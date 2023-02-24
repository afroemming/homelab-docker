#! /bin/bash
source ./.env

openssl rand -hex 64 > $SECRETSDIR/authelia_jwt_secret
openssl rand -hex 64 > $SECRETSDIR/authelia_session_secret
openssl rand -hex 64 > $SECRETSDIR/authelia_storage_encryption_key_file

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

chown -R root:root $SECRETSDIR
chmod -R 600 $SECRETSDIR
