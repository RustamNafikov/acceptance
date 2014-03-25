package com.inadco.acceptance.common.context

/**
 * represents application-environment specific settings
 */
interface FrameworkContext {

	/**
	* @return the Framework's Logging Level
	*/
	def String getLoggingLevel()

}
