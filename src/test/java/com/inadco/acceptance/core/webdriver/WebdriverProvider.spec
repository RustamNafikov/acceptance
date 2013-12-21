package com.inadco.acceptance.core.webdriver

import com.inadco.acceptance.core.webdriver.WebdriverProvider
import org.openqa.selenium.WebDriver
import com.inadco.acceptance.core.webdriver.impl.SettingsBasedWebdriver

describe WebdriverProvider {
	extension SettingsBasedWebdriver
	
	def verifyTypes {
		| actual           |expected   |
		| "FirefoxDriver"  | WebDriver |
		| "HtmlUnitDriver" | WebDriver |
	}
	
	fact verifyTypes.forEach[
		val wd = actual.webdriver
		expected.isInstance(wd) should be true
		wd.quit
	]
}