package com.inadco.aper.core.testdata.generator

import com.inadco.acceptance.core.testdata.generator.DataGenerator

@Data
class AperDataGenerator implements DataGenerator {

	val unique = "UNIQUE"

	override getValue(String dataItemName) {
		"aper-" + dataItemName
	}

}
