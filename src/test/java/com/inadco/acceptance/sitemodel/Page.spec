package com.inadco.acceptance.sitemodel

import com.inadco.acceptance.sitemodel.Page
import org.openqa.selenium.By
import java.util.List

describe "Page" {
	extension Page = new AperPage
	def verifyValues{
		| actual          | expected        |
		| name            | "AperPage-name" |
		| url             | "/aper-url"     |
		| firefoxLocator  | By.name(name)   |
		| htmlUnitLocator | By.name(name)   |
	}
	
	def verifyTypes{
		| actual         | expected |
		| elements       | List     |
		| getElement("") | Element  |
	}
	fact verifyValues.forEach[actual should be expected]
	fact verifyTypes.forEach[ expected.isInstance(actual) should be true]
}