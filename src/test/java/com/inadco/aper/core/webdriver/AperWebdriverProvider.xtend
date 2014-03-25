package com.inadco.aper.core.webdriver

import com.inadco.acceptance.core.webdriver.WebdriverProvider
import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.WebDriver
import org.openqa.selenium.htmlunit.HtmlUnitDriver

class AperWebdriverProvider implements WebdriverProvider {

	override webdriver(String driverName) {
		switch driverName {
			case "FirefoxDriver":
				new FirefoxDriver as WebDriver
			case "HtmlUnitDriver":
				new HtmlUnitDriver as WebDriver
		}

	}

	override getWebdriver() {
		new FirefoxDriver as WebDriver
	}

}
