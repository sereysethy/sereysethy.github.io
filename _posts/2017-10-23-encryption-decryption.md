---
title: How to encrypt and decrypt files with public and private keys
date: 2017-10-23 15:56:01 +0200
categories:
  - cryptography
tags: 
  - Encryption
  - Decryption
  - Asymmetric cryptography
---

This post shows how to use OpenSSL to encrypt and decrypt data with an RSA key pair (asymmetric cryptography).

#### Generate paire private and public keys using `openssl`

```bash
$ ssh-keygen -t rsa -C "your.email@example.com" -b 4096
```

The private and public keys will be stored respectively in `~/.ssh/ida_rsa` and `~/.ssh/id_rsa.pub`

#### Get the public key in `pkcs8` format from `private key` or `ssh-rsa public key`

```bash
$ ssh-keygen -f ~/.ssh/id_rsa.pub -e -m pkcs8 > ~/.ssh/id_rsa.pub.pkcs8
```

Or get the public key from private key

```bash
$ openssl rsa -in ~/.ssh/id_rsa -pubout > ~/.ssh/id_rsa.pub.pkcs8
```

#### Encrypt files with public keys

First we generate a test file by simply run following command

```bash
$ echo "This is my program." > input
```

To encrypt with public key, run this command

```bash
$ openssl pkeyutl -encrypt -pubin -inkey ~/.ssh/id_rsa.pub.pkcs8 -in input -out output.enc
```

#### Decrypt files with private key

```bash
$ openssl pkeyutl -decrypt -inkey ~/.ssh/id_rsa -in output.enc -out output.dec
```