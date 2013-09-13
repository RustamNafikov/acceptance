package com.inadco.acceptance.testdata.generator

@Data
class AperDataGenerator implements DataGenerator {

	val unique = "UNIQUE"

	override getValue(String dataItemName) {
		"aper-" + dataItemName
	}

}
