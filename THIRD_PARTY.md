# Attribution and dependency licenses

Cryptomator Free is derived from [Cryptomator for Android](https://github.com/cryptomator/android). Original copyrights, the [GPLv3 license](LICENSE.txt), Git history, and the in-app third-party license screen are preserved.

The project uses the versions pinned in [buildsystem/dependencies.gradle](buildsystem/dependencies.gradle). The upstream in-app license list is retained in [licenses.xml](presentation/src/main/res/xml/licenses.xml); dependency metadata and each dependency's own notices remain authoritative.

## CryptoLib 2.2.0

- Copyright: the Cryptomator/CryptoLib authors, including Sebastian Stenzel and Skymatic.
- License: GNU Affero General Public License, version 3.
- Exact source: [Cryptomator CryptoLib tag 2.2.0](https://github.com/cryptomator/cryptolib/tree/2.2.0).
- Source archive: [cryptolib-2.2.0-sources.jar](https://repo.maven.apache.org/maven2/org/cryptomator/cryptolib/2.2.0/cryptolib-2.2.0-sources.jar).
- License text: [AGPLv3 (included copy)](third_party/cryptolib-2.2.0/LICENSE.txt).
- An unmodified CryptoLib 2.2.0 source archive is provided alongside the first APK in Releases.

CryptoLib is used without modifications. Preserve its license and fulfill its source obligations when redistributing this application. The presence of the application's GPLv3 license does not remove third-party license requirements.

## Fork artwork

The shield-and-F artwork in `branding/` and the corresponding replacement Android vectors were created for this fork on 2026-11-10 and are licensed under GPLv3. The logo uses geometric shapes and does not incorporate the upstream mascot.
