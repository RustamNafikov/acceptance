package com.inadco.acceptance.common.providers

import com.inadco.acceptance.testdata.generator.impl.DataGeneratorImpl
import com.inadco.acceptance.testdata.generator.DataGenerator

class TestDataProvider {
	static def getTestData() {
		new DataGeneratorImpl as DataGenerator
	}

}
