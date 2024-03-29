package com.inadco.acceptance.core.linkage

import com.inadco.acceptance.core.linkage.Background
import com.inadco.aper.extensions.AperBackground

describe Background {
	extension Background = new AperBackground
	def verifyValues{
		| actual     | expected |
		| "".at      | true     |
		| "".see     | true     |
		| "".see("") | true     |
	}
	

	fact verifyValues.forEach[actual should be expected]
	//mrobertson - void methods would only be tested to see if they exist, 
	//but that is enforced by the compiler, so no need 
}
