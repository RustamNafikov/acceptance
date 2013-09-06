package com.inadco.acceptance.common.settings

import java.io.File

describe Settings {
	extension Settings = new AperSettings
	def getValues{
		| getter    | expected                          |
		| lcxUrl    | "http://www.sitedoesnotexist.com" |
		| webdriver | "FirefoxDriver"                   |
	}
	
	def getObjects{
		| getter    | expected |
		| siteModel | File     |
	}
	fact getValues.forEach[getter should be expected]
	fact getObjects.forEach[ expected.isInstance(getter) should be true]
	
}
