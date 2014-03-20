package com.inadco.aper.odd.loghelper

import org.slf4j.LoggerFactory

class InstanceLogLevels {
	static val LOG = LoggerFactory.getLogger(InstanceLogLevels)
	new() {
	}
	def traceMethod() {
		LOG.trace("trace message")
	}

	def debugMethod() {
		LOG.debug("debug message")
	}

	def infoMethod() {
		LOG.info("info message")
	}

	def errorMethod() {
		LOG.error("error message")
	}

	def callAll() {
		traceMethod
		debugMethod
		infoMethod
		errorMethod
	}

}
