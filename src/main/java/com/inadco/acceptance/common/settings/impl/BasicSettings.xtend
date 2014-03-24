package com.inadco.acceptance.common.settings.impl

import org.slf4j.LoggerFactory
import com.typesafe.config.ConfigFactory

import com.inadco.acceptance.common.settings.UndertestSettings
import com.typesafe.config.ConfigException

/**
* @MONO_STATE
* Provides application-environment specific settings as defined in reference.conf
*/
class BasicSettings implements UndertestSettings {

	val LOG = LoggerFactory.getLogger(this.class)

	static var isInitialized = false

	static String siteUrl
	static String webdriver
	static String siteModel
	static String dataItems
	static String testDataStore
	static String useTestDataStore

	public new() {
		this(UndertestSettings)
	}

	public new(Class<?> referringClass) throws ConfigException {
		referringClass ?: this.class
		LOG.error('init with: {}, the conf will be: ', referringClass)

		if(!isInitialized) {
			LOG.error('was not init')

			extension val c = ConfigFactory.load(referringClass.configName).
				getConfig("internal")
			siteUrl = "siteUrl".string
			webdriver = "webdriver".string
			siteModel = "siteModel".string
			dataItems = "dataItems".string
			testDataStore = "testDataStore".string
			useTestDataStore = "useTestDataStore".string
			isInitialized = true

		} else {
			LOG.error('was already init')
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

	package def getConfigName(Class<?> referringClass) {

		LOG.error("referring class is {}", referringClass)

		//by convention the config name should be the same as the package in undertest
		val splitPN = referringClass.package.name.split("\\.")
		LOG.trace('split package name is: {}', splitPN)

		val conventionalPath = splitPN.take(2).join('/').concat('/').
			concat(splitPN.get(1)).concat('.conf')
		LOG.trace("conventional path should be: {}", conventionalPath)

		conventionalPath

	}

	package def getConfigName(Object instance) {
		instance.class.configName
	}

	package def getIsInitialized() {
		isInitialized
	}

	package def setIsInitialized(boolean that) {
		isInitialized = that
	}

}
