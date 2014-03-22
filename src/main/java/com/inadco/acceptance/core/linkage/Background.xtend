package com.inadco.acceptance.core.linkage

import org.junit.After

/**
 * this is the single point of contact between features and the runner
 */
interface Background {
	/**
	* Checks whether the webdriver is at a particular page 
	* and ready to interact with elements on that page
	* @param pageName the page name to check (as defined in the SiteModel)
	* @return result of the check
	*/
	def boolean at(String pageName)

	/**
	* Checks whether the element exists (visibly) on the page the webdriver is currently at
	* @param the element name to check (as defined in the Site Model)
	* @return result of the check
	*/
	def boolean see(String elementName)

	/**
	* Attempts to click on an element that may exist on the page the webdriver is currently at
	* @param elementName the element name to check (as defined in the Site Model)
	*/
	def void clicking(String elementName)

	/**
	* Attempts to type a value into an element that may exist on the page the webdriver is currently at
	* @param elementName the element name to check (as defined in the Site Model)
	* @param text the text to type into the element
	*/
	def void typing(String elementName, String text)

	/**
	* Attempts to type a value (generated or looked up) into an element 
	* that may exist on the page the webdriver is currently at
	* @param elementName the element name to check (as defined in the Site Model)
	* @param text the text to type into the element
	*/
	def void typing(String elementName)

	/**
	 * Attempts to fill in all values for the fields on the current page 
	 * that are still blank and click the submit button 
	 */
	def void submit()

	/**
	* Causes the test to wait for a period of time
	*/
	def void pauseFor(int timeInSeconds)

	/**
	* Closes the webdriver instance
	* @After - forces this for every test run (Scenario within a Feature)
	*/
	@After
	def void closeDriver()

}
