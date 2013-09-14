package com.inadco.acceptance.sitemodel

import org.openqa.selenium.By

@Data
class AperPage implements Page {

	protected static val Element element = new AperElement

	val name = "AperPage-name"
	val url = "/aper-url"
	val firefoxLocator = By.name(name)
	val htmlUnitLocator = By.name(name)
	val elements = #{element, element}.toList

	override getElement(String elementName) {
		element
	}

}
