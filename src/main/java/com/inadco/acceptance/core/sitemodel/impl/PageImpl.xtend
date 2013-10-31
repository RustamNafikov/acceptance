package com.inadco.acceptance.core.sitemodel.impl

import java.util.List
import org.openqa.selenium.By
import com.inadco.acceptance.core.sitemodel.Page
import com.inadco.acceptance.core.sitemodel.Element
import com.inadco.acceptance.core.sitemodel.descriptors.ElementType

@Data
class PageImpl implements Page {
	val List<Element> elements
	val String name
	val String url
	val By firefoxLocator
	val By htmlUnitLocator

	new(List<Element> elements) {
		_elements = elements
		val me = _elements.filter[it.type.equals(ElementType.PAGE)].head
		_elements.remove(me)
		_name = me.name
		_url = me.url
		_firefoxLocator = me.firefoxLocator
		_htmlUnitLocator = me.htmlUnitLocator
	}

	override getElement(String elementName) {
		elements.filter[it.name.equals(elementName)].head
	}

}
