package com.inadco.acceptance.common.helpers

import org.slf4j.LoggerFactory
import ch.qos.logback.classic.Logger
import ch.qos.logback.classic.Level
import static extension ch.qos.logback.classic.Level.*

class LoggerHelper {
	static val LOG = LoggerFactory.getLogger(LoggerHelper)
	static val LOGGER = LoggerFactory.getLogger(Logger.ROOT_LOGGER_NAME) as Logger

	static def setLevel(String targetLevel) {

		//set the root logger's level to the specified level or leave it alone
		LOGGER.level = targetLevel.toLevel(getLevel)
		if(!getLevel.toString.equalsIgnoreCase(targetLevel)) {
			LOG.error(
				"Invalid target log level {} was specified, {} logging is still in effect",
				targetLevel, LOGGER.level.toString)
		}
	}

	static def setLevel(Class<?> targetClass, String targetLevel) {
		val logger = targetClass.loggerForClass

		//set the target class' log level to the specified level or leave it alone
		logger.level = targetLevel.toLevel(targetClass.level)
		if(!logger.getLevel.toString.equalsIgnoreCase(targetLevel)) {
			LOG.error(
				"Invalid target log level {} was specified for {}, {} logging is still in effect",
				targetLevel, targetClass.simpleName, targetClass.level)
		}
	}

	package static def getLevel() {
		LOGGER.level
	}

	package static def getLevel(Class<?> targetClass) {
		targetClass.loggerForClass.level
	}

	private static def getLoggerForClass(Class<?> targetClass) {
		LoggerFactory.getLogger(targetClass) as Logger
	}

	package static def checkLevels() {
		LOG.error("At log level {}, ERROR logged", LOGGER.level)
		LOG.info("At log level {}, INFO logged", LOGGER.level)
		LOG.debug("At log level {}, DEBUG logged", LOGGER.level)
		LOG.trace("At log level {}, TRACE logged", LOGGER.level)
	}

}
