package com.inadco.acceptance.core.testdata.generator.impl

import com.inadco.acceptance.core.testdata.generator.DataGenerator
import org.slf4j.LoggerFactory
import java.util.List
import com.inadco.acceptance.core.testdata.DataItem
import static extension org.apache.commons.lang3.RandomStringUtils.*
import static extension com.inadco.acceptance.common.helpers.FileHelper.*
import com.inadco.acceptance.core.testdata.impl.GeneratedDataItem
import com.inadco.acceptance.common.context.impl.UndertestContextImpl
import com.inadco.acceptance.common.context.UndertestContext

/**
 * @TODO Make it mono-state
 * @TODO Remove settings dependence
 */
class SettingsBasedDataGenerator implements DataGenerator {
	val LOG = LoggerFactory.getLogger(this.class)

	static var isInitialized = false

	val context = new UndertestContextImpl as UndertestContext
	val unique = 6.randomAlphabetic.toLowerCase.toFirstUpper

	static var List<DataItem> dataItems

	new() {
		if(!isInitialized) {

			//get a mapsList from the DataItems File
			val ml = context.dataItemsFile.asMapsList
			LOG.trace("found dataItems: \n{}", ml.toString)

			//populate the list of dataItems using the mapsList
			dataItems = ml.map[
				return new GeneratedDataItem(this, it) as DataItem]
			isInitialized = true
		}

	}

	override getValue(String dataItemName) {
		dataItems.filter[it.name.equals(dataItemName)].head.value
	}

	override getUnique() {
		unique
	}

}
