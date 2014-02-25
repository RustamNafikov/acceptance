package com.inadco.acceptance.common.settings.impl

import org.slf4j.LoggerFactory
import com.typesafe.config.ConfigFactory
import com.typesafe.config.Config
import java.io.File

import static extension com.inadco.acceptance.common.helpers.FileHelper.*
import com.inadco.acceptance.common.settings.SettingsProvider

/**
* @MONO_STATE
* Provides application-environment specific settings as defined in application.conf
*/
class BasicSettings implements SettingsProvider {

	val LOG = LoggerFactory.getLogger(this.class)

	static var isInitialized = false

	static Config internalConfig
	static String siteUrl
	static String webdriver
	static File siteModel
	static File dataItems
	static String testDataStore
	static boolean useTestDataStore

	public new() {
		if(!isInitialized) {
			val rootConfig = ConfigFactory.load
			LOG.debug("new Config with:\n{}", rootConfig)
			internalConfig = rootConfig.getConfig("internal")
			LOG.debug("internal part:\n{}", internalConfig)

			siteUrl = "lcxUrl".asString
			webdriver = "webdriver".asString

			siteModel = "siteModel".asFile
			dataItems = "dataItems".asFile
			testDataStore = "testDataStore".asString
			useTestDataStore = "useTestDataStore".asBoolean
			isInitialized = true
		}
	}

	override getSiteUrl() {
		siteUrl
	}

	override getWebdriver() {
		webdriver
	}

	override getSiteModel() {
		siteModel
	}

	override getDataItems() {
		dataItems
	}

	override getTestDataStore() {
		testDataStore
	}

	override getUseTestDataStore() {
		useTestDataStore
	}

	private def getProperty(String reference) {
		internalConfig.getString(reference)
	}

	private def asFile(String reference) {
		reference.property.resourceAsFile
	}

	private def asString(String reference) {
		reference.property
	}

	private def asBoolean(String reference) {
		Boolean.valueOf(reference.property)
	}

}
