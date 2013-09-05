package com.inadco.acceptance.lcx.common.settings

import com.inadco.acceptance.lcx.apers.SettingsAper

describe Settings {
	extension Settings si = SettingsAper.instance
	fact "provide lcxUrl"{
		lcxUrl should be "https://lcx.dev.inadco.com"
	}
	
	
	fact "provide webdriver"{
		webdriver should be "FirefoxDriver"
	}
	
	fact "provide PageElement File"{
		siteModel.exists should be true
	}
	


}
