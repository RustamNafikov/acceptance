package com.inadco.acceptance.sitemodel

import org.openqa.selenium.By
import com.inadco.acceptance.sitemodel.descriptors.ElementType

/**
 * Represents an element within the Site Model
 */
interface Element {
	/**
	 * @return the name of this Element
	 */
	def String getName()

	/**
	 * @return the page this element resides within
	 */
	def Page getPage()

	/**
	 * @return the name of the page this element resides within
	 */
	def String getPageName()

	/**
	 * @return the type of element this is (such as Button, Link, Page)
	 */
	def ElementType getType()

	/**
	 * @return the name of another element that this element is directly nested within (such as a pop-over, or collapsible)
	 */
	//mrobertson - This should return the Element that this Element is nested within from the SiteModel
	//waiting for this to be relevant to implement
	def String getWithin()

	/**
	 * @return information that is relevant for when this element is clicked (such as the URL it goes to)
	 */
	//mrobertson - This needs to be a ClickingAction
	def String getClicking()

	/**
	 * @return information that is relevant for when this element is typed into (such as the validation rule)
	 */
	//mrobertson - This needs to be a TypingAction
	def String getTyping()

	//mrobertson - Will need 'getIsRequired' for fieldTypes
	//def boolean getIsRequired()
	//
	/**
	 * @return the url that should be shown when this page is viewed (for Pages)
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
