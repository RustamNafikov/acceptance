package com.inadco.aper.common.settings

import com.inadco.acceptance.common.settings.UndertestSettings

@Data
class AperSettings implements UndertestSettings {
	val siteUrl = "http://www.sitedoesnotexist.com"
	val webdriver = "FirefoxDriver"
	val siteModel = "SiteModel.csv"
	val dataItems = "DataItems.csv"
	val testDataStore = "-DOES_NOT_EXIST-"
	val useTestDataStore = "false"
}
