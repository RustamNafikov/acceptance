package com.inadco.acceptance.testdata

interface DataItem {
	/**
	 * @return the name of this DataItem
	 */
	def String getName()

	/**
	 * @return the value contained in this DataItem
	 */
	def String getValue()

	/**
	 * @return the validation rule associated with this DataItem
	 */
	def String getValidationRule()

	/**
	 * @return the prototype for generating while still identifying the type
	 */
	def String getPrototypeValue()
}
