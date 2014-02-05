package com.inadco.acceptance.extensions.impl

import org.openqa.selenium.By

import org.openqa.selenium.support.ui.WebDriverWait
import org.slf4j.LoggerFactory

import com.inadco.acceptance.common.settings.impl.BasicSettings
import com.inadco.acceptance.extensions.Background

import org.openqa.selenium.support.ui.ExpectedConditions
import com.inadco.acceptance.core.sitemodel.impl.SettingsBasedSiteModel
import com.inadco.acceptance.core.testdata.generator.impl.SettingsBasedDataGenerator
import com.inadco.acceptance.core.webdriver.impl.SettingsBasedWebdriverProvider

/**
 * a basic implementation of Background interface
 */
class BackgroundImpl implements Background { //
	val LOG = LoggerFactory.getLogger(this.class)

	val settings = new BasicSettings
	val sm = new SettingsBasedSiteModel
	val td = new SettingsBasedDataGenerator
	val wd = (new SettingsBasedWebdriverProvider).webdriver

	//	val dp = TestDataProvider.testData
	val String referringFeature
	val String lastModified

	val initialPage = sm.getPage("Login Page")
	var currentPage = initialPage

	new(Class<?> referringFeature, String lastModified) {
		LOG.info("new Background for: {}, lastMod: {}",
			referringFeature.simpleName, lastModified)
		this.referringFeature = referringFeature.simpleName
		this.lastModified = lastModified
		wd.get(settings.lcxUrl + initialPage.url)
	}

	override at(String pageName) {
		var isDisplayed = pageName.pageLocator.find.displayed
		if(isDisplayed) {
			currentPage = sm.getPage(pageName)
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

	override typing(String elementName) {
		elementName.elementLocator.find.sendKeys(
			getTypingValue(elementName)
		)
	}

	override submit() {
		val typable = currentPage.elements.filter[!it.typing.empty]
		typable.forEach[(it.name).typing]
		"Submit".clicking

	}

	override closeDriver() {
		LOG.debug("closing driver")
		wd.close
		wd.quit
	}

	override pauseFor(int timeInSeconds) {
		LOG.info("pausing for {} seconds - start", timeInSeconds)
		try {
			new WebDriverWait(wd, timeInSeconds).until(
				ExpectedConditions.alertIsPresent())
		} catch(Exception e) {

			//exception is expected, thats how this works
			LOG.info("pausing for {} seconds - done", timeInSeconds)
		}
	}

	//tries to find an element on the currently displayed page
	// @return the found WebElement, if any
	private def find(By by) {
		new WebDriverWait(wd, 60).until[findElement(by) != null]
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
		val p = sm.getPage(pageName)
		switch settings.webdriver {
			case "FirefoxDriver": p.firefoxLocator
			case "HtmlUnitDriver": p.htmlUnitLocator
		}
	}

	//gets the type of value to fetch from the testDataProvider
	private def getTypingValue(String elementName) {
		var currentElement = currentPage.getElement(elementName)
		td.getValue(currentElement.typing)
	}

}
