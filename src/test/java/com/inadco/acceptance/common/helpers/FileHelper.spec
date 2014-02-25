package com.inadco.acceptance.common.helpers

import java.io.File
import java.net.URI

import static extension com.inadco.acceptance.common.helpers.FileHelper.*
import java.util.List

describe FileHelper {
	val resourcePath = "/aperproject/res/"
	val oddPath = "/aperproject/odd/"
	val resourceToFind = "TestFileHelper.txt"
	val resourceUriToGet = "/com/inadco/aperproject/odd/TestFileHelper.txt"
	val resourceToFindDNE = "DoesntExist.txt"
	val resourceUriToGetDNE = "/com/inadco/aperproject/odd/TestFileHelper.txt"
	fact "getResourceUri - provide resource file URI"{
		val uri = resourceUriToGet.resourceUri
		uri should be URI
		uri.toString should contain resourceToFind
	}

	fact "getResourceAsFile - provide resource File"{
		val file = (oddPath + resourceToFind).resourceAsFile
		file should be File
		file.exists should be true
		file.absolutePath should contain resourceToFind
	}

	
	def listCheckTable{
		|listPosition |expectedContents|
		|0            |"Line 1"        |
		|1            |"Line 2"        |
		|2            |"Line 3"        |
	}
	
	fact "asList -provide File contents as a List of Strings"{
	val list = (oddPath + resourceToFind).resourceAsFile.asList
		list should be List
		listCheckTable.forEach[list.get(listPosition) should be expectedContents]
	}
	
	//	TODO: fact "asMapsList" should be "implemented"
}
