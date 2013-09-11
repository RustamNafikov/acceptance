package com.inadco.acceptance.common.settings.impl

import org.slf4j.LoggerFactory
import com.typesafe.config.ConfigFactory
import com.typesafe.config.Config
import java.io.File

import com.inadco.acceptance.common.settings.Settings
import static extension com.inadco.acceptance.common.helpers.FileHelper.*

/**
* Provides application-environment specific settings as defined in application.conf
*/
class SettingsImpl implements Settings {

	val LOG = LoggerFactory.getLogger(this.class)
	static val Settings me = new SettingsImpl

	var Config internalConfig
	var String lcxUrl
	var String webdriver
	var File siteModel
	var String testDataStore
	var boolean useTestDataStore

	private new() {
		val rootConfig = ConfigFactory.load
		LOG.debug("new Config with:\n{}", rootConfig)
		internalConfig = rootConfig.getConfig("internal")
		LOG.debug("internal part:\n{}", internalConfig)

		lcxUrl = "lcxUrl".asString
		webdriver = "webdriver".asString

		siteModel = "siteModel".asFile
		testDataStore = "testDataStore".asString
		useTestDataStore = "useTestDataStore".asBoolean
	}

	/**
	* @return the Settings represented by SettingsImpl
	*/
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
		siteModel
	}

	override getTestDataStore() {
		testDataStore
	}

	override getUseTestDataStore() {
		useTestDataStore
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

	private def getProperty(String reference) {
		internalConfig.getString(reference)
	}

}
