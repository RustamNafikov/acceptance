package com.inadco.acceptance.core.testdata.generator

import com.inadco.aper.core.testdata.generator.AperDataGenerator

describe "DataGenerator"{
extension DataGenerator = new AperDataGenerator

	def verifyValues{
		| actual     | expected        |
		| "Name"     | "aper-Name"     |
		| "Email"    | "aper-Email"    |
		| "Password" | "aper-Password" |
		| unique     | "aper-UNIQUE"   |
	}
	
	fact verifyValues.forEach[actual.value.equals(expected) should be true]
}