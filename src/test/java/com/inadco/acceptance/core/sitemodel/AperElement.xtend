package com.inadco.acceptance.core.sitemodel

import org.openqa.selenium.By
import com.inadco.acceptance.core.sitemodel.descriptors.ElementType
import com.inadco.acceptance.core.sitemodel.Element

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
