package com.inadco.acceptance.businessmodel.impl

import java.util.List
import com.inadco.acceptance.testdata.DataItem
import com.inadco.acceptance.businessmodel.BusinessObject

class BusinessObjectImpl implements BusinessObject {
	String name
	List<DataItem> dataItems

	override getName() {
		name
	}

	override getDataItem(String name) {
		dataItems.filter[it.name.equals(name)].head
	}

}
