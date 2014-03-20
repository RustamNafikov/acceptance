package com.inadco.acceptance.common.helpers

import com.inadco.aper.odd.loghelper.InstanceLogLevels
import com.inadco.aper.odd.loghelper.StaticLogLevels
import static extension ch.qos.logback.classic.Level.*
import static extension com.inadco.acceptance.common.helpers.LoggerHelper.*

describe LoggerHelper {
	
	val initialLevel = DEBUG
	
	fact "getLevel - provide the current logging level"{
		level should be initialLevel
	}
	
	def levelsTable{
		| input   | expected     |
		| "ALL"   | ALL          |
		| "trace" | TRACE        |
		| "deBug" | DEBUG        |
		| "info"  | INFO         |
		| "ERROR" | ERROR        |
		| "DNE"   | initialLevel |
	}

	fact levelsTable.forEach[
		level = input
//		checkLevels
		val actual = level
		//reset the level
		level = initialLevel.toString
		actual should be expected
	]

	val targetInstance = new InstanceLogLevels

	
	fact "getLevel - provide the logging level for a class"{
//		targetInstance.callAll
		//it is initially null
		targetInstance.class.level should be null
	}
	
	fact levelsTable.forEach[
		targetInstance.callAll
		targetInstance.class.level = input
		targetInstance.class.level should be expected
		targetInstance.class.level = initialLevel.toString
	]

	val targetStatic = StaticLogLevels
	
	

}
