package com.inadco.acceptance.sitemodel

class AperSiteModel implements SiteModel {

	protected static val Page page = new AperPage

	override getPage(String elementName) {
		page
	}

}
