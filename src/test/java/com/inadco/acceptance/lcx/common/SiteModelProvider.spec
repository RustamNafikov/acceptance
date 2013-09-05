package com.inadco.acceptance.lcx.common

import com.inadco.acceptance.lcx.common.providers.SiteModelProvider
import com.inadco.acceptance.lcx.sitemodel.SiteModel
import com.inadco.acceptance.lcx.sitemodel.Page

describe SiteModelProvider {

	var siteModel = SiteModelProvider.siteModel
	fact "pageElements file yields PageModel"{
		siteModel should be SiteModel
		
	}
	
	fact "cannot provide non-existent pages"{
		siteModel.getPage("does not exist") should be null 
		
	}
	
	fact "provide Page by name"{
		
		val pageToGet = "Login Page"
		val samplePage = siteModel.getPage("Login Page")
		samplePage should be Page
		samplePage.name should be pageToGet
	}
	

}