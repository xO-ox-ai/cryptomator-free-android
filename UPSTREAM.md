# Upstream provenance and unofficial fork notice

**Cryptomator Free is an independent, unofficial fork. It is not affiliated with, endorsed by, sponsored by, or supported by Cryptomator, Skymatic GmbH, or the upstream maintainers.**

**Cryptomator Free 是独立维护的非官方修改版，与 Cryptomator、Skymatic GmbH 或上游维护者无隶属关系，未获其背书，也不由官方提供支持。**

## Exact upstream baseline

| Item | Value |
| --- | --- |
| Original project | [cryptomator/android](https://github.com/cryptomator/android) |
| Original branch | `develop` |
| Original application version | `2.2.0-SNAPSHOT` (development version, not a final 2.2.0 release) |
| Original commit | [`4ebaeb9a3a03929eaf2b6aabfbffef5a5b933756`](https://github.com/cryptomator/android/commit/4ebaeb9a3a03929eaf2b6aabfbffef5a5b933756) |
| Commit date | 2026-11-05 |
| Commit subject | `harden ci: don't persist github token` |
| Relationship to the last release | 70 commits after upstream tag `2.1.0` (`git describe`: `2.1.0-70-g4ebaeb9a`) |
| Fork version | `0.1.0` preview |
| Fork modification date | 2026-11-10 |
| Fork repository | [xO-ox-ai/cryptomator-free-android](https://github.com/xO-ox-ai/cryptomator-free-android) |
| Published Android package | `io.github.xooxai.cryptomatorfree.lite` |

## Changes in this fork

- Permanent read/write access in free builds; no purchase token is generated or forged.
- Trial creation and expiration are bypassed in free builds, including the system documents provider.
- Purchase and trial onboarding, billing services, official store promotions, and official APK self-updates are disabled in free builds.
- The application is named **Cryptomator Free**, with an original navy/mint shield-and-F icon, a separate package, and an independent signing key.
- The welcome screen, settings, README, and release notes identify the fork as unofficial and name the upstream baseline.
- Help links point to the fork. Log export uses Android sharing without pre-addressing upstream support.
- The first APK uses the Lite feature set: local folders, WebDAV, and S3. Provider integrations requiring separate API credentials are not included.
- Tests verify permanent access after trial expiration and the documents provider write permissions. Source attribution and license screens are retained.

The vault encryption code and vault format are unchanged by this fork. This is not an independent security audit. The preview APK has been built and its signature verified; Android runtime behavior and Nextcloud synchronization still require device testing.

## Copyright, licenses, and names

The upstream application is offered under GPLv3 and a separate commercial licensing option. This fork uses the open-source licensing path and preserves [LICENSE.txt](LICENSE.txt), the upstream history, and upstream attribution. The upstream authors retain copyright in their work. Fork-specific changes and original artwork dated 2026-11-10 are provided under GPLv3, subject to the applicable licenses of combined dependencies.

CryptoLib 2.2.0 is licensed under **AGPLv3**. Its license and source links are recorded in [THIRD_PARTY.md](THIRD_PARTY.md); the application also retains its existing third-party license screen. GPLv3 and AGPLv3 have provisions for combining covered works; this notice does not replace the dependency licenses.

The Cryptomator name identifies the upstream origin and file-format compatibility. No official endorsement or trademark permission is claimed. The upstream logo and mascot are replaced in the application; historical upstream files and Git history retain their original attribution.

Please report fork-specific problems to this repository, not the upstream support service. To support the original authors, see [cryptomator.org](https://cryptomator.org/).
