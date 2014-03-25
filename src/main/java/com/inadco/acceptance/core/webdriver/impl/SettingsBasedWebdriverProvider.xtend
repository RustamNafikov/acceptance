package com.inadco.acceptance.core.webdriver.impl

import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.htmlunit.HtmlUnitDriver
import org.slf4j.LoggerFactory
import org.openqa.selenium.WebDriver
import org.openqa.selenium.firefox.FirefoxProfile
import com.inadco.acceptance.core.webdriver.WebdriverProvider
import static extension com.inadco.acceptance.common.helpers.FileHelper.*
import com.inadco.acceptance.common.context.impl.UndertestContextImpl
import com.inadco.acceptance.common.context.UndertestContext

/**
 * @TODO: Make mono-state - not pure static method
 * @TODO: Remove settings dependence
 * Merely provides a WebDriver
 */
class SettingsBasedWebdriverProvider implements WebdriverProvider {

	static val LOG = LoggerFactory.getLogger(SettingsBasedWebdriverProvider)
	static val context = new UndertestContextImpl as UndertestContext

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
		webdriver(context.webdriverName)
	}

}
