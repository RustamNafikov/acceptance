package com.inadco.acceptance.testdata.generator

import static extension com.inadco.acceptance.testdata.DataItem.*
import static extension org.apache.commons.lang3.RandomStringUtils.*

class AperDataGenerator implements DataGenerator {

	val unique = "Utests"

	val _NAME = NAME.withValue("Name" + unique)
	val _EMAIL = EMAIL.withValue("Email-" + unique + "@inadco.com")
	val _PASSWORD = PASSWORD.withValue("12345678")

	override getValue(String dataItemName) {
		switch (dataItemName.toLowerCase) {
			case _NAME.name.toLowerCase:
				_NAME.value
			case _EMAIL.name.toLowerCase:
				_EMAIL.value
			case _PASSWORD.name.toLowerCase:
				_PASSWORD.value
			default:
				throw new IllegalArgumentException(
					dataItemName + " is not a recognized DataItem type")
		}
	}

}
