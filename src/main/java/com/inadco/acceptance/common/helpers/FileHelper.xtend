package com.inadco.acceptance.common.helpers

import java.io.File
import static extension org.apache.commons.io.FileUtils.*
import java.util.List
import org.slf4j.LoggerFactory
import java.util.HashMap
import java.util.Map

/**
 * Handles common io tasks from a centralized class
 */
class FileHelper {
	static val LOG = LoggerFactory.getLogger(FileHelper)

	/**
	* @Param the name of the resource file (expected to be on the classpath)
	* @Return the URI for the named resource
	*/
	static package def getResourceUri(String resourceName) {
		FileHelper.getResource(resourceName).toURI
	}

	/**
	* @param the name of the resource file (expected to be on the classpath)
	* @Return the File Located associated with that resource name
	*/
	static def getResourceAsFile(String resourceName) {
		new File(resourceName.resourceUri)
	}

	/**
	* @param a File to read
	* @return the file's contents as a list of lines
	*/
	static def List<String> asList(File file) {
		file.readLines.toList
	}

	/**
	* @param a File to read
	* the file should have a header row and it should be tab-seperated 
	* @return the file's contents as a mapped list of lines (header-row derived)
	*/
	static def List<Map<String, String>> asMapsList(File file) {
		LOG.info("creating maps list from file: {}", file.name)
		val List<String> lines = file.asList
		val headerRow = lines.head.replaceAll(" ", "").toLowerCase.split('\t').
			toList

		val unfilteredElements = lines.map [ row |
			//skip header row and comments, capture all others
			if(row.equals(lines.head) || row.startsWith('//') ||
				row.startsWith('#')) {
				return null
			} else {
				val cell = row.split('\t').toList

				//create a map: header(key), cell(value)
				val map = new HashMap<String, String>
				headerRow.forEach[
					map.put(it, cell.get(headerRow.indexOf(it)))]
				LOG.trace("the map: {}", map)

				//create an Element using the map
				map as Map<String, String>
			}
		]

		unfilteredElements.filterNull.toList

	}

}
