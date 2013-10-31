package com.inadco.acceptance.common.settings

class SettingsProvider {
	static Settings internal

	static def void intoProvider(Settings effectiveSettings) {
		if(internal == null) {
			internal = effectiveSettings
		} else {
			throw new RuntimeException
		}
	}

	static def instance() {
		if(internal == null) {
			throw new RuntimeException
		}
		internal
	}
}
