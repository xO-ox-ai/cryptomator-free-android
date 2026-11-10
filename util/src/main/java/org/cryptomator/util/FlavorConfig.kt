package org.cryptomator.util

object FlavorConfig {

	/** Personal source build with permanent access and no purchase or trial flow. */
	val isFreeBuild: Boolean = BuildConfig.FREE_BUILD
	val hasFullAccess: Boolean get() = isFreeBuild || isPremiumFlavor

	/** The premium (paid) Play Store edition ships with full access, so license enforcement is bypassed. */
	val isPremiumFlavor: Boolean = BuildConfig.FLAVOR == "playstore"

	/** The freemium IAP (in-app purchase) flavor distributed on Google Play. */
	val isFreemiumFlavor: Boolean = BuildConfig.FLAVOR == "playstoreiap"

	/** The APK Store edition (website direct download). Supports self-update checks. */
	val isApkStoreFlavor: Boolean = BuildConfig.FLAVOR == "apkstore"

	/** The lite (F-Droid main repo) edition. Excludes all API-key-based cloud providers. */
	val isLiteFlavor: Boolean = BuildConfig.FLAVOR == "lite"

	/** The Accrescent store edition. */
	val isAccrescentFlavor: Boolean = BuildConfig.FLAVOR == "accrescent"

	/** Flavors that exclude Google Drive (no Google Play Services available). */
	val excludesGoogleDrive: Boolean = BuildConfig.FLAVOR == "fdroid" || BuildConfig.FLAVOR == "accrescent"

}
