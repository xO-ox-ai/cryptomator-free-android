package org.cryptomator.presentation.licensing

import android.app.Activity
import org.cryptomator.presentation.model.VaultModel
import org.cryptomator.util.FlavorConfig
import org.cryptomator.util.SharedPreferencesHandler
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertNull
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.Test
import org.junit.jupiter.params.ParameterizedTest
import org.junit.jupiter.params.provider.ValueSource
import org.mockito.Mockito.mock
import org.mockito.Mockito.verifyNoInteractions
import org.mockito.Mockito.`when`

class FreeBuildLicenseEnforcerTest {

	private val preferences: SharedPreferencesHandler = mock()
	private val enforcer = LicenseEnforcer(preferences)

	@BeforeEach
	fun setUp() {
		assumeTrue(FlavorConfig.isFreeBuild)
	}

	@ParameterizedTest
	@ValueSource(longs = [0L, 1L, Long.MAX_VALUE])
	fun `write access survives missing and expired trials without a license`(expiration: Long) {
		`when`(preferences.licenseToken()).thenReturn("")
		`when`(preferences.hasRunningSubscription()).thenReturn(false)
		`when`(preferences.trialExpirationDate()).thenReturn(expiration)
		`when`(preferences.isTrialExpired()).thenReturn(true)

		assertTrue(enforcer.hasWriteAccess())
		assertTrue(enforcer.hasWriteAccessForVault(null))
		assertTrue(enforcer.peekWriteAccessForVault(null))
		assertTrue(enforcer.evaluateUiState().hasWriteAccess)
		assertFalse(enforcer.evaluateTrialState().isExpired)
	}

	@Test
	fun `trial is never started and expiration state is not read or written`() {
		enforcer.startTrial()
		assertFalse(enforcer.hasActiveTrial())
		val state = enforcer.evaluateTrialState()
		assertFalse(state.isActive)
		assertFalse(state.isExpired)
		assertNull(state.formattedExpirationDate)
		verifyNoInteractions(preferences)
	}

	@Test
	fun `every write action proceeds without opening a purchase screen`() {
		val activity: Activity = mock()
		val vault: VaultModel = mock()
		`when`(vault.isHubVault).thenReturn(false)

		LicenseEnforcer.LockedAction.entries.forEach { action ->
			assertTrue(enforcer.ensureWriteAccess(activity, action))
			assertTrue(enforcer.ensureWriteAccessForVault(activity, vault, action))
		}
		verifyNoInteractions(activity, preferences)
	}
}
