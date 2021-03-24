---
layout: default
title:  Cara setup multiple git config
date:   2021-03-25
parent: git
---

## Kasus

Buat kalian yang memiliki akun di banyak platform seperti github,
bitbucket, dan gitlab, tentunya setiap platform butuh konfigurasi yang berbeda, nah biasanya untuk
urusan konfigurasi yang berbeda - beda tersebut saya memecah beberapa konfigurasi menjadi beberapa
bagian kecil, dan mengatur konfigurasi tertentu dengan folder atau direktori yang beda - beda,
jadinya cukup masukin project di direktori tersebut.

Contohnya saya punya akun di gitlab, nah dari root direktori, saya akan buat folder gitlab misalnya,
kemudian, untuk konfigurasi yang berkaitan dengan gitlab akan secara otomatis tersetup di folder
tersebut, dan untuk project lainnya yang tersimpan di github, cukup buat direktori github, dan
simpan semua repo disana, begitupun dengan konfigurasinya.

## Implementasi

Dari root direktori, buat file `.gitconfig`

```bash
touch ~/.gitconfig
```

Kemudian isi dengan konfigurasi dibawah ini.

```
[includeIf "gitdir:~/Personal/"]
  path = ~/.config/.git-personal-config
```

Syntax `[includeIf "gitdir:<folder_projectmu>"]` tersebut akan memberitahu bahwa direktori
tersebut akan di apply dengan konfigurasi yang ada di path bawahnya pada syntax `path = <kofig_git_projectmu>`, sehingga semua hal yang berkaitan dengan otorisasi dll akan di setup disana.

Nah, selanjutnya cukup, isi email dan name, sesuaikan dengan konfigurasi kalian sendiri

```
[user]
  name = adiatma
  email = adiatma9024@gmail.com
```

Nah untuk test konfigurasi tersebut, cukup masuk ke folder project kalian tadi, dan masukan perintah
`git config user.name` untuk melihat konfigurasi `name` yang ter apply di folder project kalian.

```bash
cd project_mu/your_repo
git config user.name
```
