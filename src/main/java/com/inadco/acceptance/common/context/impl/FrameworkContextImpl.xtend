package com.inadco.acceptance.common.context.impl

import org.slf4j.LoggerFactory

import com.inadco.acceptance.common.context.FrameworkContext
import com.inadco.acceptance.common.helpers.LoggerHelper
import com.inadco.acceptance.common.settings.FrameworkSettings
import com.inadco.acceptance.common.settings.impl.FrameworkSettingsImpl
import static extension com.inadco.acceptance.common.helpers.FileHelper.*

/**
* @MONO_STATE
* Provides application-environment specific settings as defined in application.conf
*/
class FrameworkContextImpl implements FrameworkContext {

	val LOG = LoggerFactory.getLogger(this.class)

	static var isInitialized = false

	public new() {
		this(new FrameworkSettingsImpl)
	}

	public new(Class<?> referringClass) {
		this(new FrameworkSettingsImpl(referringClass))
	}

	public new(FrameworkSettings frameworkSettings) {
		if(!isInitialized) {
			LOG.trace("new context using undertest:/n{}",
				frameworkSettings.toString)
			LoggerHelper.setLevel(frameworkSettings.loggingLevel)

			isInitialized = true
		}
	}

	override getLoggingLevel() {
		throw new UnsupportedOperationException(
			"TODO: auto-generated method stub")
	}

	private def asBoolean(String reference) {
		Boolean.valueOf(reference)
	}

	private def asFile(String reference) {
		reference.resourceAsFile
	}

}
