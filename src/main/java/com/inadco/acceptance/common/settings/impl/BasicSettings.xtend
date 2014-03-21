package com.inadco.acceptance.common.settings.impl

import org.slf4j.LoggerFactory
import com.typesafe.config.ConfigFactory
import com.typesafe.config.Config

import static extension com.inadco.acceptance.common.helpers.FileHelper.*
import com.inadco.acceptance.common.settings.SettingsProvider

/**
* @MONO_STATE
* Provides application-environment specific settings as defined in reference.conf
*/
class BasicSettings implements SettingsProvider {

	val LOG = LoggerFactory.getLogger(this.class)

	static var isInitialized = false

	static Config internalConfig
	static String siteUrl
	static String webdriver
	static String siteModel
	static String dataItems
	static String testDataStore
	static String useTestDataStore

	public new() {
		if(!isInitialized) {
			val rootConfig = ConfigFactory.load
			LOG.debug("new Config with:\n{}", rootConfig)
			internalConfig = rootConfig.getConfig("internal")
			LOG.debug("internal part:\n{}", internalConfig)

			siteUrl = "siteUrl".asProperty
			webdriver = "webdriver".asProperty

			siteModel = "siteModel".asProperty
			dataItems = "dataItems".asProperty
			testDataStore = "testDataStore".asProperty
			useTestDataStore = "useTestDataStore".asProperty
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

	private def asProperty(String reference) {
		internalConfig.getString(reference)
	}

}
