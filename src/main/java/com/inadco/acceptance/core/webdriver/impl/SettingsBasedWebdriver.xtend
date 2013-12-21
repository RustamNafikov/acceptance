package com.inadco.acceptance.core.webdriver.impl

import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.htmlunit.HtmlUnitDriver
import org.slf4j.LoggerFactory
import com.inadco.acceptance.common.settings.impl.BasicSettings
import org.openqa.selenium.WebDriver
import org.openqa.selenium.firefox.FirefoxProfile
import static extension com.inadco.acceptance.common.helpers.FileHelper.*
import com.inadco.acceptance.core.webdriver.WebdriverProvider

/**
 * Merely provides a WebDriver
 */
class SettingsBasedWebdriver implements WebdriverProvider{

	static val LOG = LoggerFactory.getLogger(SettingsBasedWebdriver)
	static val settings = new BasicSettings

	/**
	* 
	* @param driverName the name of the webdriver to get
	* @return a selenium-backed WebDriver
	*/
	override WebDriver webdriver(String driverName) {
		LOG.trace("specified driver: {}", driverName)

		switch (driverName) {
			case "FirefoxDriver": {
				val profile = new FirefoxProfile()
				profile.addExtension("firebug-1.12.0.xpi".resourceAsFile)
				return new FirefoxDriver(profile)
			}
			case "HtmlUnitDriver":
				return new HtmlUnitDriver
			default:
				throw new IllegalArgumentException
		}

	}

	/**
	* @return a selenium-backed WebDriver corresponding the webdriver property in application.conf
	*/
	override getWebdriver() {
		webdriver(settings.webdriver)
	}
}
