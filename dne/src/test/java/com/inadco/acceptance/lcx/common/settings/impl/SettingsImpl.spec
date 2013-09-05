package com.inadco.acceptance.lcx.common.settings.impl

import com.inadco.acceptance.lcx.common.settings.Settings
import com.inadco.acceptance.lcx.common.settings.impl.SettingsImpl

describe SettingsImpl {
	extension Settings si = SettingsImpl.instance
	
	fact "provide lcxUrl"{
		lcxUrl should startWith "https://lcx."
		lcxUrl should endWith ".inadco.com"
	}
	
	
	fact "provide webdriver"{
		webdriver should contain "Driver"
	}
	
	fact "provide PageElement File"{
		siteModel.exists should be true
	}

}