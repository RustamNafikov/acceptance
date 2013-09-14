package com.inadco.acceptance.sitemodel

import org.openqa.selenium.By
import java.util.List

interface Page {
	/**
	 * @param the name of the Element to find
	 * @return the Element within this page, if it exists
	 */
	def Element getElement(String elementName)

	/**
	 * @return a List of the Elements within this page 
	 */
	def List<Element> getElements()

	/**
	 * @return the name of this page
	 */
	def String getName()

	/**
	 * @return the url that this page could be found at
	 */
	def String getUrl()

	/**
	 * used by FireFox Driver to uniquely identify elements on a page(combination of a Selenium Locator and a Selenium By)
	 * @return a Selenium By 
	 */
	def By getFirefoxLocator()

	/**
	 * used by HtmlUnit Driver to uniquely identify elements on a page(combination of a Selenium Locator and a Selenium By) 
	 * @return a Selenium By
	 */
	def By getHtmlUnitLocator()

}
