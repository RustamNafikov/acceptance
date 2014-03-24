package com.inadco.acceptance.common.context.impl

import org.slf4j.LoggerFactory
import java.io.File

import static extension com.inadco.acceptance.common.helpers.FileHelper.*
import com.inadco.acceptance.common.context.AcceptanceContext
import com.inadco.acceptance.core.webdriver.impl.SettingsBasedWebdriverProvider
import com.inadco.acceptance.core.sitemodel.impl.SettingsBasedSiteModel
import com.inadco.acceptance.core.testdata.generator.impl.SettingsBasedDataGenerator
import com.inadco.acceptance.common.settings.UndertestSettings
import com.inadco.acceptance.common.settings.impl.UndertestSettingsImpl

/**
* @MONO_STATE
* Provides application-environment specific settings as defined in application.conf
*/
class StandardContext implements AcceptanceContext {

	val LOG = LoggerFactory.getLogger(this.class)

	static var isInitialized = false

	static String siteUrl
	static String webdriver
	static File siteModelFile
	static File dataItemsFile
	static String testDataStore
	static boolean useTestDataStore

	public new() {
		this(new UndertestSettingsImpl)
	}

	public new(Class<?> referringClass) {
		this(new UndertestSettingsImpl(referringClass))
	}

	public new(UndertestSettings settingsProvider) {
		if(!isInitialized) {
			siteUrl = settingsProvider.siteUrl
			webdriver = settingsProvider.webdriver
			siteModelFile = settingsProvider.siteModel.asFile
			dataItemsFile = settingsProvider.dataItems.asFile
			testDataStore = settingsProvider.testDataStore
			useTestDataStore = settingsProvider.useTestDataStore.asBoolean
			isInitialized = true
		}
	}

	override getSiteUrl() {
		siteUrl
	}

	override getWebdriver() {
		(new SettingsBasedWebdriverProvider).webdriver
	}

	override getWebdriverName() {
		webdriver
	}

	override getSiteModelFile() {
		siteModelFile
	}

	override getSiteModel() {
		new SettingsBasedSiteModel
	}

	override getDataItemsFile() {
		dataItemsFile
	}

	override getTestDataGenerator() {
		new SettingsBasedDataGenerator
	}

	override getUseTestDataStore() {
		useTestDataStore
	}

	private def asBoolean(String reference) {
		Boolean.valueOf(reference)
	}

	private def asFile(String reference) {
		reference.resourceAsFile
	}

}
