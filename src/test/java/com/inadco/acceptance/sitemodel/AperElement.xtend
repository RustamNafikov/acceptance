package com.inadco.acceptance.sitemodel

import org.openqa.selenium.By

@Data
class AperElement implements Element {

	val name = "AperElement-name"
	val page = "aper-page"
	val type = "TextField"
	val within = "aper-within"
	val clicking = "to: aper-page"
	val typing = "name"
	val url = "/aper-url"
	val firefoxLocator = By.name(name)
	val htmlUnitLocator = By.name(name)

}
