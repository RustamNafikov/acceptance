package com.inadco.acceptance.extensions.impl

import org.openqa.selenium.By

import org.openqa.selenium.support.ui.WebDriverWait
import org.slf4j.LoggerFactory

import com.inadco.acceptance.common.settings.Settings
import com.inadco.acceptance.common.settings.impl.SettingsImpl
import com.inadco.acceptance.extensions.Background

import com.inadco.acceptance.common.providers.SiteModelProvider
import com.inadco.acceptance.common.providers.WebdriverProvider

/**
 * a basic implementation of Background interface
 */
class BackgroundImpl implements Background { //
	val LOG = LoggerFactory.getLogger(this.class)

	val Settings settings = SettingsImpl.instance
	val wd = WebdriverProvider.webdriver
	val pm = SiteModelProvider.siteModel

	val initialPage = pm.getPage("Login Page")
	var currentPage = initialPage

	new(Class<?> referringFeature, String lastModified) {
		wd.get(settings.lcxUrl + initialPage.url)
	}

	override at(String pageName) {
		var isDisplayed = pageName.pageLocator.find.displayed
		if(isDisplayed) {
			currentPage = pm.getPage(pageName)
		}
		return isDisplayed

	}

	override see(String elementName) {
		elementName.elementLocator.find.displayed

	}

	override clicking(String elementName) {
		elementName.elementLocator.find.click

	}

	override typing(String elementName, String text) {
		elementName.elementLocator.find.sendKeys(text)
	}

	//tries to find an element on the currently displayed page
	// @return the found WebElement, if any
	private def find(By by) {
		new WebDriverWait(wd, 5).until[findElement(by) != null]
		wd.findElement(by)
	}

	//gets the correct element locator for this Background's SiteModel / Webdriver combination
	private def getElementLocator(String elementName) {
		val e = currentPage.getElement(elementName)
		switch settings.webdriver {
			case "FirefoxDriver": e.firefoxLocator
			case "HtmlUnitDriver": e.htmlUnitLocator
		}
	}

	//gets the correct page locator for this Background's SiteModel / Webdriver combination
	private def getPageLocator(String pageName) {
		val p = pm.getPage(pageName)
		switch settings.webdriver {
			case "FirefoxDriver": p.firefoxLocator
			case "HtmlUnitDriver": p.htmlUnitLocator
		}
	}

	override closeDriver() {
		LOG.debug("closing driver")
		wd.close
		wd.quit
	}

}
