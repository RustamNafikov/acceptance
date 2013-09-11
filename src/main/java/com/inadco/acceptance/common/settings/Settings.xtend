package com.inadco.acceptance.common.settings

import java.io.File

/**
 * represents application-environment specific settings
 */
interface Settings {
	/**
	* @return the LCX Url
	*/
	def String getLcxUrl()

	/**
	* @return the Webdriver
	*/
	def String getWebdriver()

	/**
	* @return the Site Model Definition File
	*/
	def File getSiteModel()

	/**
	 * @return the Test Data Store File
	 */
	// mrobertson - returns a string until this is needed 
	def String getTestDataStore()

	/**
	 * @return if the Test Data Store should be used
	 */
	def boolean getUseTestDataStore()
}
