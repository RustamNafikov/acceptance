package com.inadco.acceptance.sitemodel

import com.inadco.acceptance.sitemodel.SiteModel

describe SiteModel {
	extension SiteModel = new AperSiteModel
	def verifyTypes{
		| actual  | expected |
		| "".page | Page     |
	}
		
	fact verifyTypes.forEach[ expected.isInstance(actual) should be true]
	
}