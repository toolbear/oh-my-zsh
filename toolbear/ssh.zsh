function ssh-add-pkcs8 () {
  openssl pkcs8 -in ~/.ssh/$USER |ssh-add -
}
