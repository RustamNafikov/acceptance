package com.inadco.acceptance.core.testdata.impl

import com.inadco.acceptance.core.testdata.DataItem
import com.inadco.acceptance.core.testdata.generator.DataGenerator
import java.util.Map
import org.slf4j.LoggerFactory
import static extension com.inadco.acceptance.common.helpers.InstancePopulator.*

/**
 * describes a piece of data that would be utilized by a data provider
 */
class GeneratedDataItem implements DataItem {
	static val LOG = LoggerFactory.getLogger(GeneratedDataItem)

	var String name
	var String validationRule
	var String prototypeValue
	val DataGenerator dataGenerator

	new(DataGenerator dataGenerator, Map<String, String> items) {
		this.dataGenerator = dataGenerator
		this.populate(items)
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
		val result = prototypeValue.replaceAll("\\$\\{unique\\}",
			dataGenerator.unique).ifValid
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
