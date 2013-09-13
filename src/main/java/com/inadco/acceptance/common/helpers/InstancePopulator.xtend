package com.inadco.acceptance.common.helpers

import java.util.Map
import org.slf4j.LoggerFactory

/**
 * Helps in creating instances of objects
 */
class InstancePopulator {
	static val LOG = LoggerFactory.getLogger(InstancePopulator)

	/**
	 * @param instance the instance of the object to populate
	 * @param properties the map of properties to use for populating the instance
	 */
	static def populate(Object instance, Map<String, String> properties) {

		LOG.trace("populating an instance of: {}", instance.class.name)

		//List of mapped fields in class
		val stringFields = instance.class.declaredFields.filter [
			it.type.equals(String)
		]

		//for each field, fetch the field from the map, and assign that to the field
		stringFields.forEach [
			it.setAccessible(true)
			val fName = it.name.toLowerCase
			val fValue = properties.get(fName)
			if(fValue == null) {
				LOG.error("expected property: {} was not found", fName)
				throw new IllegalArgumentException(
					"expected property: " + fName + " was not found")
			}
			it.set(instance, fValue)
		]

	}
}
