<p align="center"><img src="branding/logo.png" width="128" alt="Cryptomator Free shield-and-F logo"></p>

# Cryptomator Free

**English** | [简体中文](README.zh-CN.md)

**An independent, unofficial fork. Not affiliated with, endorsed by, or supported by Cryptomator, Skymatic, or the upstream maintainers.**

Cryptomator Free provides permanent read/write access to encrypted vaults on Android, with support for local folders, WebDAV, and S3. No app license, subscription, or trial is required. The upstream encryption implementation and vault format are unchanged.

The first release is **0.1.0 preview**, based on the **Cryptomator Android 2.2.0-SNAPSHOT** development code at commit [4ebaeb9a3a03929eaf2b6aabfbffef5a5b933756](https://github.com/cryptomator/android/commit/4ebaeb9a3a03929eaf2b6aabfbffef5a5b933756), dated 2026-11-05, 70 commits after upstream tag 2.1.0. **This is not an official stable 2.2.0 release.** See [UPSTREAM.md](UPSTREAM.md) for the exact baseline and modification history.

## Download and install

- [Releases: APK, corresponding source, and SHA-256 checksums](https://github.com/xO-ox-ai/cryptomator-free-android/releases).
- Requires Android 8.0 or later.
- Application name: **Cryptomator Free**.
- Package: `io.github.xooxai.cryptomatorfree.lite`; it can coexist with the official app.
- Signed with this fork's independent release key. It cannot replace the official app or the earlier Cryptomator Community debug test build.

The current APK uses the Lite feature set: **local folders, WebDAV, and S3**, with permanent read/write access to all included features. It does not include the Dropbox, Google Drive, OneDrive, SharePoint, pCloud, or Box integrations.

## Offline use and Nextcloud

Create a folder on the phone, such as `Documents/Cryptomator-Free`, then select it through **Local storage** in the app. Create a new vault there, or copy an **entire existing encrypted vault** into the folder and add it to the app. You can then import, view, and edit files offline after unlocking the vault.

When synchronizing, sync the **entire encrypted vault directory**, including its configuration, masterkey file, and `d` directory. Do not use the decrypted file entry exposed to other apps as a cloud sync source. Finish syncing before editing on another device to reduce conflicts.

Nextcloud Android's automatic upload feature is not equivalent to the desktop client's complete two-way folder synchronization. Verify modifications, renames, deletions, remote updates, and background operation on your device. This version cannot decrypt and preview encrypted files directly from Nextcloud; open them in Cryptomator Free or through its Android system file-provider entry.

## Changes in this fork

- Permanent read/write access in free builds, including after trial expiration; no official license is generated or forged.
- Purchase and trial onboarding, billing services, official promotions, and official APK self-updates are disabled.
- New artwork, an independent package and signing key, and explicit unofficial-fork notices in the welcome screen and settings.
- Help links point to this fork; log sharing does not prefill the upstream support email.
- Original copyrights, licenses, dependency attribution, and the vault format are preserved.

See [BUILDING.md](BUILDING.md) for build and signing instructions. The fork's interface and access-control changes were made on **2026-11-10**. This is a preview: the local build, relevant unit tests, APK signature, and package structure have been verified, and the GitHub build has passed. **Android device testing and Nextcloud synchronization testing remain outstanding; the fork has not received an independent security audit.**

## Licenses, attribution, and support

The upstream project is dual-licensed under GPLv3 and a separate commercial option. This fork uses the open-source licensing path and preserves the [GPLv3 license](LICENSE.txt) and upstream history. CryptoLib 2.2.0 is licensed under **AGPLv3**; other dependencies retain their own license requirements. See [THIRD_PARTY.md](THIRD_PARTY.md) and the in-app license screen. New code and original artwork are provided under GPLv3 without replacing dependency license terms.

The Cryptomator name identifies the upstream origin and file-format compatibility; no official trademark permission or endorsement is claimed. Original authors retain copyright in their work. The original project README is preserved in [docs/UPSTREAM-README.md](docs/UPSTREAM-README.md).

Report fork-specific problems in [this repository's Issues](https://github.com/xO-ox-ai/cryptomator-free-android/issues), rather than contacting the upstream support team about this modified version. Thanks to the [Cryptomator authors and contributors](https://github.com/cryptomator/android/graphs/contributors). You can also [support the upstream project](https://cryptomator.org/).
