package com.inadco.acceptance.common.settings

import java.io.File
import static extension com.inadco.acceptance.common.settings.SettingsProvider.*
describe SettingsProvider {
	
	fact new AperSettings().intoProvider
	
	fact new AperSettings().intoProvider should throw RuntimeException
	
	fact instance.lcxUrl should be "http://www.sitedoesnotexist.com"
	fact instance.webdriver should be "FirefoxDriver"
	fact instance.testDataStore should be "-DOES_NOT_EXIST-"
	fact instance.useTestDataStore should be false
	fact File.isInstance(instance.siteModel)
	fact File.isInstance(instance.dataItems)
	
}