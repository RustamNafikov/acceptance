package com.inadco.acceptance.sitemodel

import org.openqa.selenium.By
import com.inadco.acceptance.sitemodel.descriptors.ElementType

@Data
class AperElement implements Element {

	val name = "AperElement-name"
	val pageName = "aper-page"
	val page = new AperPage
	val type = ElementType.PAGE
	val within = "aper-within"
	val clicking = "to: aper-page"
	val typing = "name"
	val url = "/aper-url"
	val firefoxLocator = By.name(name)
	val htmlUnitLocator = By.name(name)

}
