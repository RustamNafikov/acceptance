package com.inadco.acceptance.testdata.impl

import com.inadco.acceptance.testdata.DataItem
import com.inadco.acceptance.testdata.generator.DataGenerator
import java.util.Map
import org.slf4j.LoggerFactory

/**
 * describes a peice of data that would be utilized by a data provider
 */
//mrobertson - this is a candidate for replacing with a more abstract file-sourced solution
class GeneratedDataItem implements DataItem {
	static val LOG = LoggerFactory.getLogger(GeneratedDataItem)

	var String name
	var String validationRule
	var String prototypeValue
	val DataGenerator dataGenerator

	new(DataGenerator dataGenerator, Map<String, String> items) {
		this.dataGenerator = dataGenerator

		//List of mapped fields in GeneratedDataItem
		val stringFields = GeneratedDataItem.declaredFields.filter[
			it.type.equals(String)]

		//for each field, fetch the field from the map, and assign that to the field
		stringFields.forEach [
			it.setAccessible(true)
			val fName = it.name.toLowerCase
			val fValue = items.get(fName)
			if(fValue == null) {
				LOG.error("expected property: {} was not found", fName)
				throw new IllegalArgumentException(
					"expected property: " + fName + " was not found")
			}
			it.set(this, fValue)
		]
	}

	//merely checks the value against the appropriate regex
	private def ifValid(String value) {
		if(value.matches(validationRule)) {
			return value
		}
		LOG.error("value: {} did not pass validationRule: {}", value,
			validationRule)
		throw new IllegalArgumentException("value did not pass regex")
	}

	/**
	 * @return the Name of this DataItem
	 */
	override getName() {
		name
	}

	/**
	 * @return the Value contained in this DataItem
	 */
	override getValue() {
		val result = prototypeValue.replaceAll("\\$\\{unique\\}", dataGenerator.unique).
			ifValid
		LOG.trace("generated - {} : {}", name, result)
		result
	}

	override getValidationRule() {
		validationRule
	}

	override getPrototypeValue() {
		prototypeValue
	}

}
