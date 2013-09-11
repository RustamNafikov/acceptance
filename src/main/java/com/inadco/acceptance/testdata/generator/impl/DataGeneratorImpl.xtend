package com.inadco.acceptance.testdata.generator.impl

import com.inadco.acceptance.testdata.generator.DataGenerator
import static extension com.inadco.acceptance.testdata.DataItem.*
import static extension org.apache.commons.lang3.RandomStringUtils.*
import org.slf4j.LoggerFactory

class DataGeneratorImpl implements DataGenerator {
	static val LOG = LoggerFactory.getLogger(DataGeneratorImpl)
	val unique = 6.randomAlphabetic.toLowerCase.toFirstUpper

	val _NAME = NAME.withValue("Name" + unique)
	val _EMAIL = EMAIL.withValue("Email-" + unique + "@inadco.com")
	val _PASSWORD = PASSWORD.withValue("12345678")

	override getValue(String dataItemName) {
		var String result
		switch (dataItemName.toLowerCase) {
			case _NAME.name.toLowerCase:
				result = _NAME.value
			case _EMAIL.name.toLowerCase:
				result = _EMAIL.value
			case _PASSWORD.name.toLowerCase:
				result = _PASSWORD.value
			default:
				throw new IllegalArgumentException(
					dataItemName + " is not a recognized DataItem type")
		}
		LOG.info("generated value {} for {}", result, dataItemName)
		result
	}

}
