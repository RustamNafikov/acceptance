package com.inadco.aper.core.sitemodel

import org.openqa.selenium.By
import com.inadco.acceptance.core.sitemodel.Page
import com.inadco.acceptance.core.sitemodel.Element

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
