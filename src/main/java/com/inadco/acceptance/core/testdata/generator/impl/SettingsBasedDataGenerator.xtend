package com.inadco.acceptance.core.testdata.generator.impl

import com.inadco.acceptance.core.testdata.generator.DataGenerator
import org.slf4j.LoggerFactory
import java.util.List
import com.inadco.acceptance.core.testdata.DataItem
import com.inadco.acceptance.common.settings.impl.BasicSettings
import static extension org.apache.commons.lang3.RandomStringUtils.*
import static extension com.inadco.acceptance.common.helpers.FileHelper.*
import com.inadco.acceptance.core.testdata.impl.GeneratedDataItem

class SettingsBasedDataGenerator implements DataGenerator {
	static val LOG = LoggerFactory.getLogger(SettingsBasedDataGenerator)
	val SETTINGS = new BasicSettings
	val unique = 6.randomAlphabetic.toLowerCase.toFirstUpper

	val List<DataItem> dataItems

	new() {

		//get a mapsList from the DataItems File
		val ml = SETTINGS.dataItems.asMapsList

		//populate the list of dataItems using the mapsList
		dataItems = ml.map[return new GeneratedDataItem(this, it) as DataItem]
	}

	override getValue(String dataItemName) {
		dataItems.filter[it.name.equals(dataItemName)].head.value
	}

	override getUnique() {
		unique
	}

}
