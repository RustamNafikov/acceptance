package com.inadco.acceptance.common.providers

import com.inadco.acceptance.common.providers.SiteModelProvider
import com.inadco.acceptance.sitemodel.SiteModel
import com.inadco.acceptance.sitemodel.Page

describe SiteModelProvider {
extension SiteModel = SiteModelProvider.siteModel
	def getValues{
		| getter                     | expected     |
		| getPage("does not exist")  | null         |
		| getPage("Login Page").name | "Login Page" |
	}
	
	def getObjects{
		| getter                      | expected  |
		| SiteModelProvider.siteModel | SiteModel |
		| getPage("Login Page")       | Page      |
	}
	
	fact getValues.forEach[getter should be expected]
	fact getObjects.forEach[ expected.isInstance(getter) should be true]
	
	

}