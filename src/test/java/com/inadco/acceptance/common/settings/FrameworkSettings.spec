package com.inadco.acceptance.common.settings

import com.inadco.aper.common.settings.AperFrameworkSettings

describe FrameworkSettings {
	
	
	extension FrameworkSettings = new AperFrameworkSettings
	def verifyValues{
		| actual       | expected |
		| loggingLevel | "ALL"    |
	}
	
//	def verifyTypes{
//		| actual    | expected |
//		| siteModel | File     |
//		| dataItems | File     |
//	}

	
	fact verifyValues.forEach[actual should be expected]
//	fact verifyTypes.forEach[ expected.isInstance(actual) should be true]
}