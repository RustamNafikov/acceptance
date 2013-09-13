package com.inadco.acceptance.common.settings

import static extension com.inadco.acceptance.common.helpers.FileHelper.*
import com.inadco.acceptance.common.settings.Settings

@Data
class AperSettings implements Settings {
	val lcxUrl = "http://www.sitedoesnotexist.com"
	val webdriver = "FirefoxDriver"
	val siteModel = "/res/SiteModel.csv".resourceAsFile
	val dataItems = "/res/DataItems.csv".resourceAsFile
	val testDataStore = "-DOES_NOT_EXIST-"
	val useTestDataStore = false
}
