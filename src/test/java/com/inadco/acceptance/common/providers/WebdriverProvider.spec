package com.inadco.acceptance.common.providers

import com.inadco.acceptance.common.providers.WebdriverProvider
import org.openqa.selenium.WebDriver
import static extension com.inadco.acceptance.common.providers.WebdriverProvider.*

describe WebdriverProvider {
	
	def verifyTypes {
		| actual           |expected   |
		| "HtmlUnitDriver" | WebDriver |
		| "FirefoxDriver"  | WebDriver |
	}
	
	fact verifyTypes.forEach[
		val wd = actual.webdriver
		expected.isInstance(wd) should be true
		wd.quit
	]
}