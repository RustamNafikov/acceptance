package com.inadco.acceptance.sitemodel

import com.inadco.acceptance.sitemodel.Page
import org.openqa.selenium.By

describe "Page" {
	extension Page = new AperPage
	def getValues{
		| getter            | expected        |
		| name            | "AperPage-name" |
		| url             | "/aper-url"     |
		| firefoxLocator  | By.name(name) |
		| htmlUnitLocator | By.name(name) |
	}
	
	def getObjects{
		| getter           | expected |
		| getElement("") | Element  |
	}
	fact getValues.forEach[getter should be expected]
	fact getObjects.forEach[ expected.isInstance(getter) should be true]
}