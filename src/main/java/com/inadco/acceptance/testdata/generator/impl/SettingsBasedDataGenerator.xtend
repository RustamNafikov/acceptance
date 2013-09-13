package com.inadco.acceptance.testdata.generator.impl

import com.inadco.acceptance.testdata.generator.DataGenerator
import org.slf4j.LoggerFactory
import java.util.List
import com.inadco.acceptance.testdata.DataItem
import com.inadco.acceptance.common.settings.impl.SettingsImpl
import static extension org.apache.commons.lang3.RandomStringUtils.*
import static extension com.inadco.acceptance.common.helpers.FileHelper.*
import com.inadco.acceptance.testdata.impl.GeneratedDataItem
import java.util.ArrayList

class SettingsBasedDataGenerator implements DataGenerator {
	static val LOG = LoggerFactory.getLogger(SettingsBasedDataGenerator)
	val unique = 6.randomAlphabetic.toLowerCase.toFirstUpper

	val List<DataItem> dataItems

	new() {

		//get a mapsList from the DataItems File
		val ml = SettingsImpl.instance.dataItems.asMapsList

		//populate the list of dataItems using the mapsList
		dataItems = ml.map[return new GeneratedDataItem(this, it) as DataItem]
	}

	override getValue(String dataItemName) {
		val List<String> dataItemNames = new ArrayList<String>
		dataItems.forEach[dataItemNames.add(it.name)]

		LOG.trace("getting value for dataItem : {}\n\tthese are dataItems: {}",
			dataItemName, dataItemNames)
		dataItems.filter[it.name.equals(dataItemName)].head.value

	}

	override getUnique() {
		unique
	}

}
