package com.inadco.acceptance.sitemodel

interface SiteModel {
	/**
	 * @return the Page within the Site Model, if it exists
	 */
	def Page getPage(String elementName)
}
