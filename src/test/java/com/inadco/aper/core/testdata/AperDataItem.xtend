package com.inadco.aper.core.testdata

import com.inadco.acceptance.core.testdata.DataItem

@Data
class AperDataItem implements DataItem {
	val name = "aper-name"
	val value = "aper-value"
	val validationRule = "aper-validationRule"
	val prototypeValue = "aper-prototypeValue"

}
