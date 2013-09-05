package com.inadco.acceptance.lcx.common.helpers

import java.io.File

import static extension com.inadco.acceptance.lcx.common.helpers.FileHelper.*

describe FileHelper {
	
	fact "provide resource file URI"{
		var resourceToFind = "/res/SiteModel.csv" 
		resourceToFind.resourceUri.toString should contain resourceToFind
	}
	
	fact "provide resource File"{
		"/res/SiteModel.csv".resourceAsFile should be File
	}
}
