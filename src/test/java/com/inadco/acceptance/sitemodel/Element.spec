package com.inadco.acceptance.sitemodel

import org.openqa.selenium.By

describe "Element" {
	extension Element = new AperElement
	def getValues{
		| getter            | expected           |
		| name            | "AperElement-name" |
		| page            | "aper-page"        |
		| type            | "TextField"        |
		| within          | "aper-within"      |
		| clicking        | "to: aper-page"    |
		| typing          | "name"             |
		| url             | "/aper-url"        |
		| firefoxLocator  | By.name(name)    |
		| htmlUnitLocator | By.name(name)    |
	}
	
	fact getValues.forEach[getter should be expected]
}
