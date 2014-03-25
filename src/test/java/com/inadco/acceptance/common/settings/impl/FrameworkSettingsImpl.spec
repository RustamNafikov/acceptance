package com.inadco.acceptance.common.settings.impl

import undertest.lcx.features.CommonStepsFeature
import com.inadco.acceptance.common.settings.FrameworkSettings

describe FrameworkSettingsImpl {
	
	
	extension FrameworkSettings bs = new FrameworkSettingsImpl
	def verifyValues{
		| actual       | expected |
		| loggingLevel | "ALL"    |
	}
	
	fact"defaults should work"{
		verifyValues.forEach[actual should be expected]
	}
	
	fact "Based on the executing class' context should work"{
		(bs as FrameworkSettingsImpl).isInitialized = false
		bs = new FrameworkSettingsImpl(CommonStepsFeature)
		verifyValues.forEach[actual should be expected]
	}

}