package com.inadco.acceptance.businessmodel

import com.inadco.acceptance.testdata.DataItem

interface BusinessObject {
	def String getName()

	def DataItem getDataItem(String name)
}
