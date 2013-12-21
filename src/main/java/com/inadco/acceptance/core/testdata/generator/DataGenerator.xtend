package com.inadco.acceptance.core.testdata.generator

import com.inadco.acceptance.core.testdata.TestDataProvider

/**
 * merely generates values for use in tests
 */
interface DataGenerator extends TestDataProvider{
	/**
	 * @param dataItemName the name of the data item to generate a value for
	 * @return a generated value that would be appropriate for the data item
	 */
	override String getValue(String dataItemName)

	def String getUnique()

}
