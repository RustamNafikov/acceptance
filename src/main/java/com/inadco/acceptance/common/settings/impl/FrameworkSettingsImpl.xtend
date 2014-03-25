package com.inadco.acceptance.common.settings.impl

import com.inadco.acceptance.common.settings.FrameworkSettings
import org.slf4j.LoggerFactory
import com.typesafe.config.ConfigFactory
import com.typesafe.config.ConfigException

/**
* @MONO_STATE
* Provides site under test specific settings as defined in x.conf
*/
class FrameworkSettingsImpl implements FrameworkSettings {
	val LOG = LoggerFactory.getLogger(this.class)
	static var isInitialized = false

	static String loggingLevel

	public new() {
		this(FrameworkSettings)
	}

	public new(Class<?> referringClass) throws ConfigException {

		referringClass ?: this.class
		LOG.trace('init with: {}', referringClass)

		if(!isInitialized) {
			LOG.trace('was not init')

			extension val c = ConfigFactory.load(referringClass.configName).
				getConfig("internal")
			loggingLevel = "logging".string
			LOG.info("the logging level should be set to: {}", loggingLevel)

			isInitialized = true

		} else {
			LOG.trace('was already init')
		}
	}

	/**
	 * @return the current Logging Level
	 */
	override String getLoggingLevel() {
		loggingLevel
	}

	package def getConfigName(Class<?> referringClass) {

		LOG.trace("referring class is {}", referringClass)

		//by convention the config name should be the same as the package in undertest
		val splitPN = referringClass.package.name.split("\\.")
		LOG.trace('split package name is: {}', splitPN.join('\t'))

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
