package com.inadco.acceptance.sitemodel.impl

import java.util.List
import org.slf4j.LoggerFactory
import com.inadco.acceptance.sitemodel.impl.PageImpl
import com.inadco.acceptance.sitemodel.SiteModel
import com.inadco.acceptance.sitemodel.Page
import com.inadco.acceptance.sitemodel.Element
import com.inadco.acceptance.common.settings.impl.SettingsImpl

import static extension com.inadco.acceptance.common.helpers.FileHelper.*

class SettingsBasedSiteModel implements SiteModel {
	static val LOG = LoggerFactory.getLogger(SettingsBasedSiteModel)
	static val SiteModel me = new SettingsBasedSiteModel
	val List<Page> pages

	private new() {

		//get a mapsList from the SiteModel File
		val ml = SettingsImpl.instance.siteModel.asMapsList

		//create a general list of elements from the mapsList
		val elements = ml.map[return new ElementImpl(this, it) as Element]

		//create the containing pages list from the general list of elements 
		val containingPages = elements.map[it.pageName].toSet

		//Make a list of Pages and place the elements that belong to each page into it
		pages = containingPages.map [ page |
			return new PageImpl(
				elements.filter[it.pageName.equals(page)].toList) as Page
		].toList
		LOG.trace("Model Complete")
	}

	static def getInstance() {
		me
	}

	override getPage(String pageName) {
		pages.filter[it.name.equals(pageName)].head
	}
}
