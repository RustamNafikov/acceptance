package com.inadco.acceptance.core.sitemodel

import com.inadco.acceptance.core.sitemodel.SiteModel
import com.inadco.acceptance.core.sitemodel.Page

class AperSiteModel implements SiteModel {

	protected static val Page page = new AperPage

	override getPage(String elementName) {
		page
	}

}
