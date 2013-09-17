package com.inadco.acceptance.common.helpers

import org.slf4j.LoggerFactory
import static extension org.apache.commons.lang3.RandomStringUtils.*
import com.inadco.acceptance.testdata.DataItem

class DataGenerator {
	static val LOG = LoggerFactory.getLogger(DataGenerator)

	static def unique() {
		6.randomAlphabetic.toLowerCase.toFirstUpper
	}

	static def valueFor(DataItem dataItem) {
		LOG.error("this does not exist yet")
	}

}
