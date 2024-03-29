package com.inadco.acceptance.common.settings

import com.inadco.aper.common.settings.AperUndertestSettings

describe UndertestSettings {
	
	
	extension UndertestSettings = new AperUndertestSettings
	def verifyValues{
		| actual           | expected                          |
		| siteUrl          | "http://www.sitedoesnotexist.com" |
		| webdriver        | "FirefoxDriver"                   |
		| testDataStore    | "-DOES_NOT_EXIST-"                |
		| useTestDataStore | "false"                           |
	}
	
//	def verifyTypes{
//		| actual    | expected |
//		| siteModel | File     |
//		| dataItems | File     |
//	}

	
	fact verifyValues.forEach[actual should be expected]
//	fact verifyTypes.forEach[ expected.isInstance(actual) should be true]
}