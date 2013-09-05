package com.inadco.acceptance.lcx.sitemodel.impl

import java.util.List
import java.util.HashMap
import org.slf4j.LoggerFactory
import com.inadco.acceptance.lcx.sitemodel.impl.PageImpl
import com.inadco.acceptance.lcx.sitemodel.SiteModel
import com.inadco.acceptance.lcx.sitemodel.Page
import com.inadco.acceptance.lcx.sitemodel.Element
import com.inadco.acceptance.lcx.common.settings.impl.SettingsImpl

import static extension com.inadco.acceptance.lcx.common.helpers.FileHelper.*

class SettingsBasedSiteModel implements SiteModel {
	static val LOG = LoggerFactory.getLogger(SettingsBasedSiteModel)
	static val SiteModel me = new SettingsBasedSiteModel
	val List<Page> pages

	private new() {
		LOG.info("in new")
		val List<String> lines = SettingsImpl.instance.siteModel.asList
		val headerRow = lines.head.replaceAll(" ", "").toLowerCase.split('\t').
			toList

		var unfilteredElements = lines.map [ row |
			//skip header row and comments, capture all others
			if(row.equals(lines.head) || row.startsWith('//') ||
				row.startsWith('#')) {
				return null
			} else {
				val cell = row.split('\t').toList

				//create a map: header(key), cell(value)
				val map = new HashMap<String, String>
				headerRow.forEach[
					map.put(it, cell.get(headerRow.indexOf(it)))]
				LOG.info("the map: {}", map)

				//create an Element using the map
				return new ElementImpl(map) as Element
			}
		]

		val elements = unfilteredElements.filterNull.toList

		//get a set of pages from out of the filtered elements list
		val containingPages = elements.map[it.page].toSet

		//Make a list of Pages and place the elements that belong to each page into it
		pages = containingPages.map [ page |
			return new PageImpl(
				elements.filter[it.page.equals(page)].toList) as Page
		].toList
	}

	static def getInstance() {
		me
	}

	override getPage(String pageName) {
		pages.filter[it.name.equals(pageName)].head
	}
}
