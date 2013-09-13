package com.inadco.acceptance.common.providers

import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.htmlunit.HtmlUnitDriver
import org.slf4j.LoggerFactory
import com.inadco.acceptance.common.settings.impl.SettingsImpl
import org.openqa.selenium.WebDriver
import org.openqa.selenium.firefox.FirefoxProfile
import static extension com.inadco.acceptance.common.helpers.FileHelper.*

/**
 * Merely provides a WebDriver
 */
class WebdriverProvider {

	static val LOG = LoggerFactory.getLogger(WebdriverProvider)

	/**
	* 
	* @param driverName the name of the webdriver to get
	* @return a selenium-backed WebDriver
	*/
	static def WebDriver webdriver(String driverName) {
		LOG.trace("specified driver: {}", driverName)

		switch (driverName) {
			case "FirefoxDriver": {
				val profile = new FirefoxProfile()
				profile.addExtension(
					"/res/webdriver/firefox/extensions/firebug-1.12.0.xpi".
						resourceAsFile)
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
	static def getWebdriver() {
		webdriver(SettingsImpl.instance.webdriver)
	}
}
