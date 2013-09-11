package com.inadco.acceptance.extensions

import com.inadco.acceptance.extensions.Background

describe Background {
	extension Background = new AperBackground
	def verifyValues{
		| actual  | expected |
		| "".at   | true     |
		| "".see  | true     |
	}
	

	fact verifyValues.forEach[actual should be expected]
	//mrobertson - void methods would only be tested to see if they exist, 
	//but that is enforced by the compiler, so no need 
}
