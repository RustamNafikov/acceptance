package com.inadco.acceptance.core.testdata.generator

/**
 * merely generates values for use in tests
 */
interface DataGenerator {
	/**
	 * @param dataItemName the name of the data item to generate a value for
	 * @return an generate value that would be appropriate for the data item
	 */
	def String getValue(String dataItemName)

	def String getUnique()

}
