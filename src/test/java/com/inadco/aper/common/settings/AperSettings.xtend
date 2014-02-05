package com.inadco.aper.common.settings

import static extension com.inadco.acceptance.common.helpers.FileHelper.*
import com.inadco.acceptance.common.settings.SettingsProvider

@Data
class AperSettings implements SettingsProvider {
	val lcxUrl = "http://www.sitedoesnotexist.com"
	val webdriver = "FirefoxDriver"
	val siteModel = "SiteModel.csv".getResourceAsFile
	val dataItems = "DataItems.csv".getResourceAsFile
	val testDataStore = "-DOES_NOT_EXIST-"
	val useTestDataStore = false
}
