package com.inadco.acceptance.core.testdata

//import static extension com.inadco.acceptance.core.testdata.TestDataProvider.*
import com.inadco.acceptance.core.testdata.generator.DataGenerator
describe TestDataProvider {
	extension TestDataProvider TDP = new TestDataProvider
	def verifyTypes {
		| actual      | expected      |
		| getTestData | DataGenerator |
		
	}
	
	fact verifyTypes.forEach[expected.isInstance(actual) should be true]
	

}