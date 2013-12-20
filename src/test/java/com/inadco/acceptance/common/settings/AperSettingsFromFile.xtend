package com.inadco.acceptance.common.settings

import static extension com.inadco.acceptance.common.helpers.FileHelper.*
import com.inadco.acceptance.common.settings.SettingsProvider

@Data
class AperSettingsFromFile implements SettingsProvider {
	val lcxUrl = "http://www.sitedoesnotexist.com"
	val webdriver = "FirefoxDriver"
	val siteModel = "SiteModel.csv".resourceAsFile
	val dataItems = "DataItems.csv".resourceAsFile
	val testDataStore = "-DOES_NOT_EXIST-"
	val useTestDataStore = false
}
