package com.inadco.acceptance.core.webdriver

import org.slf4j.LoggerFactory
import org.openqa.selenium.WebDriver

/**
 * Merely provides a WebDriver
 */
interface WebdriverProvider {

	static val LOG = LoggerFactory.getLogger(WebdriverProvider)

	/**
	* 
	* @param driverName the name of the webdriver to get
	* @return a selenium-backed WebDriver
	*/
	def WebDriver webdriver(String driverName)
	
	/**
	* @return a selenium-backed WebDriver
	*/
	def WebDriver getWebdriver()
}
