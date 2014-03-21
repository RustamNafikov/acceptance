package com.inadco.aper.common.settings

import com.inadco.acceptance.common.settings.SettingsProvider

@Data
class AperSettingsFromFile implements SettingsProvider {
	val siteUrl = "http://www.sitedoesnotexist.com"
	val webdriver = "FirefoxDriver"
	val siteModel = "SiteModel.csv"
	val dataItems = "DataItems.csv"
	val testDataStore = "-DOES_NOT_EXIST-"
	val useTestDataStore = "false"

}
