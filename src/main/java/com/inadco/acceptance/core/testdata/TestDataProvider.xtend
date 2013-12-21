package com.inadco.acceptance.core.testdata

interface TestDataProvider {
	/**
	 * @param dataItemName the name of the data item to get a value for
	 * @return a value that would be appropriate for the data item
	 */
	def String getValue(String dataItemName)

}
