package com.inadco.acceptance.extensions

@Data
class AperBackground implements Background {
	val at = true
	val see = true

	override at(String pageName) {
		at
	}

	override see(String elementName) {
		see
	}

	override clicking(String elementName) {
	}

	override typing(String elementName, String text) {
	}

	override typing(String elementName) {
	}

	override closeDriver() {
	}

	override pauseFor(int timeInSeconds) {
	}

}
