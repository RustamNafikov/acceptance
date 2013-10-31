package com.inadco.acceptance.core.businessmodel

import com.inadco.acceptance.core.testdata.DataItem

interface BusinessObject {
	def String getName()

	def DataItem getDataItem(String name)
}
