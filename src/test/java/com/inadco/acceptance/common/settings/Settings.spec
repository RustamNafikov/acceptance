package com.inadco.acceptance.common.settings

import java.io.File

describe Settings {
	extension Settings = new AperSettings
	def verifyValues{
		| actual           | expected                          |
		| lcxUrl           | "http://www.sitedoesnotexist.com" |
		| webdriver        | "FirefoxDriver"                   |
		| testDataStore    | "-DOES_NOT_EXIST-"                |
		| useTestDataStore | false                             |
	}
	
	def verifyTypes{
		| actual    | expected |
		| siteModel | File     |
		| dataItems | File     |
	}
	fact verifyValues.forEach[actual should be expected]
	fact verifyTypes.forEach[ expected.isInstance(actual) should be true]
}