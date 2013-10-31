package com.inadco.acceptance.core.testdata.generator

@Data
class AperDataGenerator implements DataGenerator {

	val unique = "UNIQUE"

	override getValue(String dataItemName) {
		"aper-" + dataItemName
	}

}
