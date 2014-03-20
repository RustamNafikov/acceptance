package com.inadco.aper.odd.loghelper

import org.slf4j.LoggerFactory

class StaticLogLevels {
	static val LOG = LoggerFactory.getLogger(StaticLogLevels)
	static def traceMethod() {
		LOG.trace("trace message")
	}

	static def debugMethod() {
		LOG.debug("debug message")
	}

	static def infoMethod() {
		LOG.info("info message")
	}

	static def errorMethod() {
		LOG.error("error message")
	}

}
