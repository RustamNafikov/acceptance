package com.inadco.acceptance.common.settings

import java.io.File

import static extension com.inadco.acceptance.common.helpers.FileHelper.*
import com.inadco.acceptance.common.settings.Settings

@Data
class AperSettings implements Settings {
	val String lcxUrl = "http://www.sitedoesnotexist.com"
	val String webdriver = "FirefoxDriver"
	val File siteModel = "/res/SiteModel.csv".resourceAsFile
}
