---
layout: default
title:  GPG signing filed
date:   2021-03-25
parent: gpg
---

if you try, to signing with gpg, and found this error

```
error: gpg failed to sign the data
fatal: failed to write commit object
```
so, you want to try this setup

```bash
brew install pinentry-mac
echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
killall gpg-agent

# now test if it is working
echo "test" | gpg --clearsign
```
## References

- https://github.com/keybase/keybase-issues/issues/2798#issuecomment-498171379
