package com.inadco.acceptance.testdata

/**
 * describes a peice of data that would be utilized by a data provider
 */
//mrobertson - this is a candidate for replacing with a more abstract file-sourced solution
class DataItem {
	public static val NAME = new DataItem("Name", "[\\w]{1,}")
	public static val EMAIL = new DataItem("Email", ".*")
	public static val PASSWORD = new DataItem("Password", ".*")

	val String name
	val String validation
	var String value = ""

	private new(String name, String validation) {
		this.name = name
		this.validation = validation
	}

	//merely checks the value against the appropriate regex
	private def ifValid(String value) {

		if(value.matches(validation)) {
			return value
		} else {
			throw new IllegalArgumentException(
				value + "does not pass validation for regex: " + validation)
		}
	}

	/**
	 * @param dataItem the dataItem to attempt to assign the @param value to
	 * @return the dataItem with the value assigned
	 */
	static def withValue(DataItem dataItem, String value) {
		dataItem.value = dataItem.ifValid(value)
		dataItem
	}

	def getName() {
		name
	}

	def getValue() {
		value

	}
}
