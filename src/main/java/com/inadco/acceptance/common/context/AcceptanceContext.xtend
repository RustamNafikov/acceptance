package com.inadco.acceptance.common.context

import org.openqa.selenium.WebDriver
import java.io.File
import com.inadco.acceptance.core.sitemodel.SiteModel
import com.inadco.acceptance.core.testdata.generator.DataGenerator

/**
 * represents application-environment specific settings
 */
interface AcceptanceContext {

	/**
	* @return the Site Under Test's Url
	*/
	def String getSiteUrl()

	/**
	* @return the Webdriver's Name
	*/
	def String getWebdriverName()

	/**
	* @return the Webdriver
	*/
	def WebDriver getWebdriver()

	/**
	* @return the Site Model Definition File
	*/
	def File getSiteModelFile()

	/**
	* @return the Site Model Definition File
	*/
	def SiteModel getSiteModel()

	/**
	 * @return the Data Items Definiton File
	 */
	def File getDataItemsFile()

	/**
	 * @return the Test Data Generator
	 */
	def DataGenerator getTestDataGenerator()

	/**
	 * @return if the Test Data Store should be used
	 */
	def boolean getUseTestDataStore()

}
