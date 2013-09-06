package com.inadco.acceptance.sitemodel

import com.inadco.acceptance.sitemodel.SiteModel

describe SiteModel {
	extension SiteModel = new AperSiteModel
	def getObjects{
		| getter      | expected |
		| getPage("") | Page     |
	}
		
	fact getObjects.forEach[ expected.isInstance(getter) should be true]
	
}