package com.inadco.acceptance.testdata.generator

describe "DataGenerator"{
extension DataGenerator = new AperDataGenerator

	def verifyValues{
		| actual     | expected                  |
		| "Name"     | "NameUtests"              |
		| "Email"    | "Email-Utests@inadco.com" |
		| "Password" | "12345678"                |
	}
	
	fact verifyValues.forEach[actual.value.equals(expected) should be true]
}