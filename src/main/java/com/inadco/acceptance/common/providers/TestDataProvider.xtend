package com.inadco.acceptance.common.providers

import com.inadco.acceptance.testdata.generator.DataGenerator
import com.inadco.acceptance.testdata.generator.impl.SettingsBasedDataGenerator

class TestDataProvider {
	static def getTestData() {
		new SettingsBasedDataGenerator as DataGenerator
	}

}
