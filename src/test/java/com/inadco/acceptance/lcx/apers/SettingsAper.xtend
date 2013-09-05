package com.inadco.acceptance.lcx.apers

import java.io.File

import static extension com.inadco.acceptance.lcx.common.helpers.FileHelper.*
import com.inadco.acceptance.lcx.common.settings.Settings

class SettingsAper implements Settings {
	static val Settings me = new SettingsAper
	var String lcxUrl
	var String webdriver
	var File pageElement

	private new() {
		lcxUrl = "https://lcx.dev.inadco.com"
		webdriver = "FirefoxDriver"
		pageElement = "/res/SiteModel.csv".resourceAsFile
	}

	static def instance() {
		return me
	}

	override getLcxUrl() {
		lcxUrl
	}

	override getWebdriver() {
		webdriver
	}

	override getSiteModel() {
		pageElement
	}
}
