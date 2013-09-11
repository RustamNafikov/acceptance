package com.inadco.acceptance.sitemodel.impl

import java.util.Map
import org.slf4j.LoggerFactory
import org.openqa.selenium.By
import com.inadco.acceptance.sitemodel.Element
import static com.inadco.acceptance.sitemodel.descriptors.ElementType.*
import com.inadco.acceptance.sitemodel.SiteModel

/**
 * a basic implementation of the Element interface
 */
class ElementImpl implements Element {
	static val LOG = LoggerFactory.getLogger(ElementImpl)
	var SiteModel siteModel
	var String name
	var String pageName
	var String type
	var String within
	var String clicking
	var String typing
	var String url
	var String firefoxIdentifier
	var String firefoxBy
	var String htmlUnitIdentifier
	var String htmlUnitBy

	/**
	 * Constructs an Element given an unordered map of properties
	 * ignores any unrecognized elements within the map
	 * @param the SiteModel that this element belongs to
	 * @param properties map of properties to associate with this element
	 * @throws IllegalArgument exception in case of expected property missing
	 */
	new(SiteModel siteModel, Map<String, String> properties) throws IllegalArgumentException{

		this.siteModel = siteModel

		//List of mapped fields in ElementImpl
		val stringFields = ElementImpl.declaredFields.filter[
			it.type.equals(String)]

		//for each field, fetch the field from the map, and assign that to the field
		stringFields.forEach [
			it.setAccessible(true)
			val fName = it.name.toLowerCase
			val value = properties.get(fName)
			if(value == null) {
				LOG.error("expected property: {} was not found", fName)
				throw new IllegalArgumentException(
					"expected property: " + fName + " was not found")
			}
			it.set(this, value)
		]

	}

	private def toBy(String identifier, String by) {
		switch by {
			case "name": return By::name(identifier)
			case "linkText": return By::linkText(identifier)
			case "cssSelector": return By::cssSelector(identifier)
		}
	}

	override getName() {
		name
	}

	override getPageName() {
		pageName
	}

	override getPage() {
		siteModel.getPage(pageName)
	}

	override getType() {
		switch (type) {
			case PAGE.name: PAGE
			case LINK.name: LINK
			case TEXT_FIELD.name: TEXT_FIELD
			case BUTTON.name: BUTTON
		}
	}

	override getWithin() {
		within
	}

	override getClicking() {
		clicking
	}

	override getTyping() {
		typing
	}

	override getUrl() {
		url
	}

	override getFirefoxLocator() {
		toBy(firefoxIdentifier, firefoxBy)
	}

	override getHtmlUnitLocator() {
		toBy(htmlUnitIdentifier, htmlUnitBy)
	}


}
