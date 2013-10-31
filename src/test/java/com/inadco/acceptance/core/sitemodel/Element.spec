package com.inadco.acceptance.core.sitemodel

import org.openqa.selenium.By
import com.inadco.acceptance.core.sitemodel.descriptors.ElementType

describe "Element" {
	extension Element = new AperElement
	
	def verifyValues{
		| actual          | expected           |
		| name            | "AperElement-name" |
		| pageName        | "aper-page"        |
		| page            | new AperPage       |
		| type            | ElementType.PAGE   |
		| within          | "aper-within"      |
		| clicking        | "to: aper-page"    |
		| typing          | "name"             |
		| url             | "/aper-url"        |
		| firefoxLocator  | By.name(name)      |
		| htmlUnitLocator | By.name(name)      |
	}
	
	fact verifyValues.forEach[actual should be expected]
}
