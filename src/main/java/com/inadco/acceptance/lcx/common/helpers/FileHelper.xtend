package com.inadco.acceptance.lcx.common.helpers

import java.io.File
import static extension org.apache.commons.io.FileUtils.*
import java.util.List

/**
 * Handles common io tasks from a centralized class
 */
class FileHelper {
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

}
