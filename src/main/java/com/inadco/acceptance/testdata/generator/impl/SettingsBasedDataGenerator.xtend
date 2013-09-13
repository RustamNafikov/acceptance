package com.inadco.acceptance.testdata.generator.impl

import com.inadco.acceptance.testdata.generator.DataGenerator
import org.slf4j.LoggerFactory
import java.util.List
import com.inadco.acceptance.testdata.DataItem
import com.inadco.acceptance.common.settings.impl.SettingsImpl
import static extension org.apache.commons.lang3.RandomStringUtils.*
import static extension com.inadco.acceptance.common.helpers.FileHelper.*
import java.util.HashMap
import com.inadco.acceptance.testdata.impl.GeneratedDataItem
import java.util.ArrayList

class SettingsBasedDataGenerator implements DataGenerator {
	static val LOG = LoggerFactory.getLogger(SettingsBasedDataGenerator)
	val unique = 6.randomAlphabetic.toLowerCase.toFirstUpper

	val List<DataItem> dataItems

	new() {
		val List<String> lines = SettingsImpl.instance.dataItems.asList
		val headerRow = lines.head.replaceAll(" ", "").toLowerCase.split('\t').
			toList

		dataItems = lines.map [ row |
			//skip header row and comments, capture all others
			if(row.equals(lines.head) || row.startsWith('//') ||
				row.startsWith('#')) {
				return null
			} else {
				val cell = row.split('\t').toList

				//create a map: header(key), cell(value)
				val map = new HashMap<String, String>
				headerRow.forEach[
					map.put(it, cell.get(headerRow.indexOf(it)))]
				LOG.trace("the map: {}", map)

				//create an Element using the map
				return new GeneratedDataItem(this, map) as DataItem

			}
		].filterNull.toList
	}

	//	val _NAME = NAME.withValue("Name" + unique)
	//	val _EMAIL = EMAIL.withValue("Email-" + unique + "@inadco.com")
	//	val _PASSWORD = PASSWORD.withValue("12345678")
	override getValue(String dataItemName) {
		val List<String> dataItemNames = new ArrayList<String>
		dataItems.forEach[dataItemNames.add(it.name)]

		LOG.info("getting value for dataItem : {}\n\tthese are dataItems: {}",
			dataItemName, dataItemNames)
		dataItems.filter[it.name.equals(dataItemName)].head.value

	}

	override getUnique() {
		unique
	}

}
