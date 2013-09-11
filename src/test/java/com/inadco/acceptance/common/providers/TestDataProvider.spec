package com.inadco.acceptance.common.providers

import com.inadco.acceptance.common.providers.TestDataProvider
import static extension com.inadco.acceptance.common.providers.TestDataProvider.*
import com.inadco.acceptance.testdata.generator.DataGenerator

describe TestDataProvider {
	def verifyTypes {
		| actual      | expected      |
		| getTestData | DataGenerator |
		
	}
	
	fact verifyTypes.forEach[expected.isInstance(actual) should be true]
	

}