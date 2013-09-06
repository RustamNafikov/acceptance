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
}
