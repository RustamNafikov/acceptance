package com.inadco.acceptance.core.sitemodel

import com.inadco.acceptance.core.sitemodel.SiteModel
import com.inadco.acceptance.core.sitemodel.Page
import com.inadco.aper.core.sitemodel.AperSiteModel

describe SiteModel {
	extension SiteModel = new AperSiteModel
	def verifyTypes{
		| actual  | expected |
		| "".page | Page     |
	}
		
	fact verifyTypes.forEach[ expected.isInstance(actual) should be true]
	
}