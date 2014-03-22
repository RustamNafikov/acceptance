package com.inadco.acceptance.core.linkage.impl

import org.openqa.selenium.By

import org.openqa.selenium.support.ui.WebDriverWait
import org.slf4j.LoggerFactory

import com.inadco.acceptance.core.linkage.Background

import org.openqa.selenium.support.ui.ExpectedConditions
import com.inadco.acceptance.common.context.impl.StandardContext
import com.inadco.acceptance.common.context.AcceptanceContext
import org.openqa.selenium.WebDriver
import com.inadco.acceptance.core.sitemodel.SiteModel
import com.inadco.acceptance.core.testdata.generator.DataGenerator
import com.inadco.acceptance.core.sitemodel.Page

/**
 * a basic implementation of Background interface
 */
class BackgroundImpl implements Background { //
	val LOG = LoggerFactory.getLogger(this.class)

	//
	val String siteUrl
	val WebDriver wd
	val String wdName
	val SiteModel sm
	val DataGenerator td

	//	val dp = TestDataProvider.testData
	val String referringFeature
	val String lastModified

	val Page initialPage
	var Page currentPage

	/**
	 * @TODO: Need to init settings, site model, datagenerator here
	 * based on the referring feature's parent's (Site Under Test) local settings
	 * (with a fall-back of basic settings)
	 */
	new(Class<?> referringFeature, String lastModified) {
		this(referringFeature, lastModified, new StandardContext)
	}

	new(Class<?> referringFeature, String lastModified,
		AcceptanceContext context) {
		LOG.info("new Background for: {}, lastMod: {}",
			referringFeature.simpleName, lastModified)
		referringFeature = referringFeature.simpleName
		siteUrl = context.getSiteUrl
		wd = context.getWebdriver
		wdName = context.getWebdriverName
		sm = context.getSiteModel
		td = context.getTestDataGenerator

		this.lastModified = lastModified
		initialPage = sm.getPage("Login Page")
		currentPage = initialPage

		wd.get(siteUrl + initialPage.getUrl)

	}

	override at(String pageName) {
		var isDisplayed = pageName.getPageLocator.find.displayed
		if(isDisplayed) {
			currentPage = sm.getPage(pageName)
		}
		return isDisplayed

	}

	override see(String elementName) {
		elementName.getElementLocator.find.displayed

	}

	override clicking(String elementName) {
		elementName.getElementLocator.find.click

	}

	override typing(String elementName, String text) {
		elementName.getElementLocator.find.sendKeys(text)
	}

	override typing(String elementName) {
		elementName.getElementLocator.find.sendKeys(
			getTypingValue(elementName)
		)
	}

	override submit() {
		val typable = currentPage.getElements.filter[!it.getTyping.empty]
		typable.forEach[(it.getName).typing]
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

		//		new WebDriverWait(wd, 60).until[ it |it.findElements(by).size > 0]
		new WebDriverWait(wd, 60).until(
			ExpectedConditions.presenceOfElementLocated(by))

		wd.findElement(by)
	}

	//gets the correct element locator for this Background's SiteModel / Webdriver combination
	private def getElementLocator(String elementName) {
		val e = currentPage.getElement(elementName)
		switch wdName {
			case "FirefoxDriver": e.getFirefoxLocator
			case "HtmlUnitDriver": e.getHtmlUnitLocator
		}
	}

	//gets the correct page locator for this Background's SiteModel / Webdriver combination
	private def getPageLocator(String pageName) {
		val p = sm.getPage(pageName)
		switch wdName {
			case "FirefoxDriver": p.getFirefoxLocator
			case "HtmlUnitDriver": p.getHtmlUnitLocator
		}
	}

	//gets the type of value to fetch from the testDataProvider
	private def getTypingValue(String elementName) {
		var currentElement = currentPage.getElement(elementName)
		td.getValue(currentElement.getTyping)
	}

}
