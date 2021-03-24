---
layout: default
title:  Setup android environment di MacOS tanpa Android Studio
date:   2021-03-25
parent: android
---

# Setup Android Enviroment in MacOS Without Android Studio

make sure to install `homebrew`, in your computer, and then install java development kit.

```bash
brew cask install adoptopenjdk/openjdk/adoptopenjdk8
java --version
```

## Install Android SDK

checkout version of command line tools  ini here [https://developer.android.com/studio/#downloads](https://developer.android.com/studio/#downloads) scroll until you see command line tool.

```bash
# download
curl https://dl.google.com/android/repository/commandlinetools-mac-6858069_latest.zip -o $HOME/android-sdk.zip
# unzip
unzip $HOME/android-sdk.zip -d $HOME/.tmp-android
# create directory `~/Library/Android/sdk` and move android-sdk to directory `~/Library/Android/sdk`
mkdir ~/Library/Android && mkdir ~/Library/Android/sdk && mkdir ~/Library/Android/sdk/cmdline-tools
mv $HOME/.tmp-android/cmdline-tools ~/Library/Android/sdk/cmdline-tools/latest
```

## Setup Android Enviroment

```bash
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

next, please enable `.zshrc` with command `source ~/.zshrc`.

## Install `platforms;android-30` `platform-tools`, and `build-tools;29.0.2`

```bash
sdkmanager "platform-tools" "platforms;android-30" "build-tools;29.0.2"
```

## Install android `system-images`

```bash
sdkmanager --list --channel=0 # list stable packages
```

```bash
...
system-images;android-30;google_apis;x86_64                                              | 10           | Google APIs Intel x86 Atom_64 System Image
system-images;android-30;google_apis_playstore;x86                                       | 9            | Google Play Intel x86 Atom System Image
system-images;android-30;google_apis_playstore;x86_64                                    | 10           | Google Play Intel x86 Atom_64 System Image
```

```bash
sdkmanager install "system-images;android-30;google_apis_playstore;x86_64"
```

and finally, create avdmanager.

```bash
avdmanager create avd --name andro30 --package "system-images;android-30;google_apis_playstore;x86_64"
# run emulator with
emulator @andro30
```
