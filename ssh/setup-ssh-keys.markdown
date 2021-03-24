---
layout: default
title:  Setup ssh-keys
date:   2021-03-25
parent: ssh
---

```bash
ssh-keygen -t rsa -C "adiatma9024@gmail.com"
```

```bash
~/.ssh/id_rsa_adiatma
```

then, add keys

```bash
ssh-add ~/.ssh/id_rsa_adiatma
```

check saved keys

```bash
ssh-add -l
```

finally copy the ssh, and save to your github

```bash
pbcopy < ~/.ssh/id_rsa_adiatma.pub
```

check this [article](https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

## Modify the ssh-config

```bash
touch ~/.ssh/config
```

then, add

```bash
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa_adiatma
```

Clone your repo, and modify gitconfig

```bash
cd path/to/your_repo
git config user.name
```

Please make sure the result suitable with your config, if not you can setup the `user.name`

```bash
git config user.name "adiatma"
```

Test your connection

```bash
ssh -T git@github.com
```

Or, for different `Host` `ssh -T git@your_host`

## References

- https://gist.github.com/oanhnn/80a89405ab9023894df7
- https://docs.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account
