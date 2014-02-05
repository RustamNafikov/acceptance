package com.inadco.acceptance.core.testdata

import com.inadco.aper.core.testdata.AperDataItem

describe "DataItem"{
extension DataItem = new AperDataItem

	def verifyValues{
		| actual         | expected              |
		| name           | "aper-name"           |
		| value          | "aper-value"          |
		| validationRule | "aper-validationRule" |
		| prototypeValue | "aper-prototypeValue" |
	}
	
	fact verifyValues.forEach[actual should be expected]
}