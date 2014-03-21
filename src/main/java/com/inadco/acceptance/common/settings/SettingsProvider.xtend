package com.inadco.acceptance.common.settings

/**
 * represents application-environment specific settings
 */
interface SettingsProvider {

	/**
	* @return the Site Under Test's Url
	*/
	def String getSiteUrl()

	/**
	* @return the Webdriver
	*/
	def String getWebdriver()

	/**
	* @return the Site Model Definition File
	*/
	def String getSiteModel()

	/**
	 * @return the Data Items Definiton File
	 */
	def String getDataItems()

	/**
	 * @return the Test Data Store File
	 */
	// mrobertson - returns a string until this is needed 
	def String getTestDataStore()

	/**
	 * @return if the Test Data Store should be used
	 */
	def String getUseTestDataStore()

}
