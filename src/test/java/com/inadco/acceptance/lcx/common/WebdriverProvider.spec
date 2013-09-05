package com.inadco.acceptance.lcx.common

import com.inadco.acceptance.lcx.common.providers.WebdriverProvider
import static extension com.inadco.acceptance.lcx.common.providers.WebdriverProvider.*
import org.openqa.selenium.WebDriver


describe WebdriverProvider {

	fact "Unrecognized driver is illegal"{
		val driverName = "IllegalDriver"
		driverName.webdriver should throw IllegalArgumentException
	}
	
	fact "HtmlUnitDriver works"{
		val driverName = "HtmlUnitDriver"
		val WebDriver wd = driverName.webdriver
		val urlToGet = "https://www.google.com"
		
		wd.class.name should contain driverName
		wd.get(urlToGet)
		wd.currentUrl should contain urlToGet
		wd.close
		wd.quit
	}
	
	fact "FirefoxDriver works"{
		val driverName = "FirefoxDriver"
		val WebDriver wd = driverName.webdriver
		val urlToGet = "https://www.google.com"
		
		wd.class.name should contain driverName
		wd.get(urlToGet)
		wd.currentUrl should contain urlToGet
		wd.close
		wd.quit
	}
	
}