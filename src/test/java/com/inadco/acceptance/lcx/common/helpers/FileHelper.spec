package com.inadco.acceptance.lcx.common.helpers

import java.io.File
import java.net.URI

import static extension com.inadco.acceptance.lcx.common.helpers.FileHelper.*
import java.util.List

describe FileHelper {
	
	String resourceToFind = "/res/TestFileHelper.txt"

	fact "resourceUri - provide resource file URI"{
		val uri = resourceToFind.resourceUri
		uri should be URI
		uri.toString should contain resourceToFind
	}
	
	File file
	fact "resourceAsFile - provide resource File"{
		val file = resourceToFind.resourceAsFile
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
		val list = resourceToFind.resourceAsFile.asList
		list should be List
		listCheckTable.forEach[list.get(listPosition) should be expectedContents]
	}
}
