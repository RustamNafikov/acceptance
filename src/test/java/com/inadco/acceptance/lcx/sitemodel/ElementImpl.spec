package com.inadco.acceptance.lcx.sitemodel

import org.openqa.selenium.By

import com.inadco.acceptance.lcx.common.providers.SiteModelProvider
import com.inadco.acceptance.lcx.sitemodel.impl.ElementImpl

describe ElementImpl {
	val pageModel = SiteModelProvider.siteModel
	val samplePage = pageModel.getPage("Login Page")
	val element = samplePage.getElement("Create an account")
	fact "provides"{
		element.name should be "Create an account"
		element.page should be "Login Page"
		element.type should be "Link"
		element.clicking should be "to: /app/#signup"
		element.typing should be ""
		element.url should be ""
		element.firefoxLocator should be By::linkText("Create an account")
		element.htmlUnitLocator should be null
	}

}