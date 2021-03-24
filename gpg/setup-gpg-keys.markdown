---
layout: default
title:  Setup GPG keys
date:   2021-03-25
parent: gpg
---

install with `brew`

```bash
brew install gpg
```

then, open `~/.gitconfig` fill with this config at bellow.

```
[commit]
  gpgsign = true

[gpg]
  program = /usr/local/bin/gpg
```

generating a gpg key

```bash
gpg --full-generate-key
```

at the prompt, choose default `RSA`, then enter desired key size `4096`, next and verify your
information ID.

```bash
gpg --list-secret-keys --keyid-format LONG

sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot 
ssb   4096R/42B317FD4BA89E7A 2016-03-10
```

GPG key id is `3AA5C34371567BD2`, then export with this command `gpg --armor --export 3AA5C34371567BD2`, then finally copy your GPG key.

and, dont't forget to add GPG key ID, to `.gitconfig`

```
[user]
  signingkey = 3AA5C34371567BD2 
```

and now, your commit in github, gitlab auto sign in with GPG keys, but if you found a problem like
this [signingkey faild](./signing-failed.md).

## References

- https://docs.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key
