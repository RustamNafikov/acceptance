package com.inadco.acceptance.core.webdriver

import com.inadco.acceptance.core.webdriver.WebdriverProvider
import org.openqa.selenium.WebDriver
import static extension com.inadco.acceptance.core.webdriver.WebdriverProvider.*

describe WebdriverProvider {
	
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