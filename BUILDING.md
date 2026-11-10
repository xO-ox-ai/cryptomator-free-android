# Build Cryptomator Free

This is an unofficial fork. The exact upstream baseline, copyright attribution, and modification notice are recorded in [UPSTREAM.md](UPSTREAM.md). Source and artwork changes were made on 2026-11-10. Dependencies retain their own licenses; see [THIRD_PARTY.md](THIRD_PARTY.md).

## Requirements

- JDK 21.
- Android SDK Platform 37 / 37.0 and Build Tools 37.0.0, as pinned in `buildsystem/dependencies.gradle`.
- The Gradle 9.8.1 wrapper included in this repository.
- Set `JAVA_HOME` and `ANDROID_HOME`, or set `sdk.dir` in the ignored `local.properties` file. Gradle can download missing SDK components after their licenses have been accepted.

## Build a development APK

```powershell
.\gradlew.bat :presentation:assembleLiteDebug -PfreeBuild=true
```

On Linux/macOS, use `./gradlew` instead of `.\gradlew.bat`. The APK is written to `presentation/build/outputs/apk/lite/debug/`. Debug APKs use the upstream repository's public development key and are only for development. They cannot replace release-signed APKs without uninstalling first.

Free builds are enabled by default. The Lite variant includes local storage, WebDAV, and S3; it excludes provider integrations that need API credentials. The package is `io.github.xooxai.cryptomatorfree.lite`, and the launcher label is `Cryptomator Free`.

The legacy access checks remain available for development with `-PfreeBuild=false`; that option does not restore official branding, package identity, or signing keys.

## Tests

```powershell
.\gradlew.bat :presentation:testLiteDebugUnitTest --tests 'org.cryptomator.presentation.licensing.FreeBuildLicenseEnforcerTest' --tests 'org.cryptomator.presentation.docprovider.HelpersTest' --tests 'org.cryptomator.presentation.presenter.VaultListPresenterTest'
```

These tests exercise permanent access with no license or subscription, expired trials, all write actions, the system documents provider, and existing vault-list behavior. Tests for upstream-only license restrictions skip when they do not apply to a free build.

## Release signing

The published APK is signed with a dedicated Cryptomator Free key. Its private key and passwords are not in the repository, source archive, or GitHub Actions. Preserve your private signing key to allow future Android updates.

Release certificate SHA-256: `ffeb04beecf3edf82c095bbff83dc8f5ff2bbf4cafc3e50ab2b7aeedd7434904`.

For your own build, generate a private signing key using `keytool` and create a properties file outside the repository:

```properties
storeFile=/absolute/path/to/your/private-signing-key.p12
storePassword=your-private-password
keyAlias=cryptomator-free
keyPassword=your-private-password
```

Point `FORK_SIGNING_PROPERTIES` to that file, then build:

```powershell
$env:FORK_SIGNING_PROPERTIES = 'C:\private\signing.properties'
.\gradlew.bat :presentation:assembleLiteRelease -PfreeBuild=true
```

Without signing properties, the release task produces an unsigned APK. The signed release is written to `presentation/build/outputs/apk/lite/release/`. A newly generated key does not match this repository's published APK; use a different package or uninstall the existing app before installing a differently signed build.

The GitHub Actions workflow builds a debug APK and runs the relevant tests. It does not publish releases or contain the private release key.

## Original artwork

`branding/logo.svg` and the Android VectorDrawable resources are editable source assets. On Windows, run `./branding/generate-icons.ps1` from the repository root to regenerate the vectors, monochrome icon, and README PNG. Original fork artwork is GPLv3; it does not include the upstream mascot.

## Manual offline test

1. Create `Documents/Cryptomator-Free` on the phone and grant access through the system folder picker.
2. Create a test vault there, import a small text file, and unlock it again.
3. While in airplane mode, open, edit, rename, and delete the test file.
4. To synchronize later, synchronize the entire encrypted vault directory, including `vault.cryptomator`, `masterkey.cryptomator`, and `d/`, rather than an exported plaintext directory.
5. Verify modifications, renames, deletions, and remote changes with your chosen sync tool before relying on multi-device editing.

Nextcloud Android's private cache or offline downloads are not necessarily an ordinary writable shared directory. Its system file-picker entry can represent remote documents. This fork has not yet been tested on a connected Android device or against the user's Nextcloud server.
