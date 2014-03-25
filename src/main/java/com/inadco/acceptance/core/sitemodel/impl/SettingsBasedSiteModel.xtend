package com.inadco.acceptance.core.sitemodel.impl

import java.util.List
import org.slf4j.LoggerFactory
import com.inadco.acceptance.core.sitemodel.impl.PageImpl
import com.inadco.acceptance.core.sitemodel.SiteModel
import com.inadco.acceptance.core.sitemodel.Page
import com.inadco.acceptance.core.sitemodel.Element

import static extension com.inadco.acceptance.common.helpers.FileHelper.*
import com.inadco.acceptance.common.context.impl.UndertestContextImpl
import com.inadco.acceptance.common.context.UndertestContext

/**
 * @MONO_STATE
 * Provides a site-model from the settings
 * @TODO: need to replace this with something more generic (no direct ref to Settings)
 */
class SettingsBasedSiteModel implements SiteModel {
	val LOG = LoggerFactory.getLogger(this.class)
	val uContext = new UndertestContextImpl as UndertestContext
	static var isInitialized = false
	static var List<Page> pages

	public new() {
		if(!isInitialized) {

			//get a mapsList from the SiteModel File
			val ml = uContext.siteModelFile.asMapsList

			//create a general list of elements from the mapsList
			val elements = ml.map[return new ElementImpl(this, it) as Element]

			//create the containing pages list from the general list of elements 
			val containingPages = elements.map[it.pageName].toSet

			//Make a list of Pages and place the elements that belong to each page into it
			pages = containingPages.map [ page |
				return new PageImpl(
					elements.filter[it.pageName.equals(page)].toList) as Page
			].toList
			LOG.trace("Site Model Complete")
			isInitialized = true
		}
	}

	override getPage(String pageName) {
		pages.filter[it.name.equals(pageName)].head
	}

}
