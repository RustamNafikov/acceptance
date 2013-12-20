package com.inadco.acceptance.core.testdata

import com.inadco.acceptance.core.testdata.generator.DataGenerator
import com.inadco.acceptance.core.testdata.generator.impl.SettingsBasedDataGenerator

class TestDataProvider {
	def getTestData() {
		new SettingsBasedDataGenerator as DataGenerator
	}

}
