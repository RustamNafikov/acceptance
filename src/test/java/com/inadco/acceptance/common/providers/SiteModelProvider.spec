package com.inadco.acceptance.common.providers

import com.inadco.acceptance.common.providers.SiteModelProvider
import com.inadco.acceptance.sitemodel.SiteModel
import com.inadco.acceptance.sitemodel.Page

describe SiteModelProvider {
extension SiteModel = SiteModelProvider.siteModel
	def verifyValues{
		| actual                     | expected     |
		| getPage("does not exist")  | null         |
		| getPage("Login Page").name | "Login Page" |
	}
	
	def verifyTypes{
		| actual                      | expected  |
		| SiteModelProvider.siteModel | SiteModel |
		| getPage("Login Page")       | Page      |
	}
	
	fact verifyValues.forEach[actual should be expected]
	fact verifyTypes.forEach[ expected.isInstance(actual) should be true]
	
	

}