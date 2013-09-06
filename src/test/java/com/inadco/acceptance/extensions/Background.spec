package com.inadco.acceptance.extensions

import com.inadco.acceptance.extensions.Background

describe Background {
	extension Background = new AperBackground
		def getValues{
		| getter  | expected |
		| at("")  | true     |
		| see("") | true     |
	}
	

	fact getValues.forEach[getter should be expected]
	fact "expected void methods exist"{
		clicking("")
		typing("", "")
		closeDriver()
	}

}
