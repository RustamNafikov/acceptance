package com.inadco.acceptance.common.settings.impl

import com.inadco.acceptance.common.settings.UndertestSettings
import undertest.lcx.features.CommonStepsFeature

describe BasicSettings {
	
	
	extension UndertestSettings bs = new BasicSettings
	def verifyValues{
		| actual           | expected                          |
		| siteUrl          | "https://lcx.qa.inadco.com"       |
		| siteModel        | "https://lcx.qa.inadco.com"       |
		| webdriver        | "FirefoxDriver"                   |
		| testDataStore    | "-DOES_NOT_EXIST-"                |
		| useTestDataStore | "false"                           |
	}
	
	fact"defaults should work"{
		verifyValues.forEach[actual should be expected]
	}
	
	fact "Based on the executing class' context should work"{
		(bs as BasicSettings).isInitialized = false
		bs = new BasicSettings(CommonStepsFeature)
		verifyValues.forEach[actual should be expected]
	}

}