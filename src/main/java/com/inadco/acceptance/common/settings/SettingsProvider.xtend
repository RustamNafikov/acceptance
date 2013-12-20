package com.inadco.acceptance.common.settings

/**
 * TODO: this
 */
class SettingsProvider {
	static var Settings internal
	
	new(){
		
	}

	def void intoProvider(Settings effectiveSettings) {
		if(internal == null) {
			internal = effectiveSettings
		} else {
			throw new RuntimeException
		}
	}

	def getInternal() {
		internal
	}

}
