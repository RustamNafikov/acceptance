package com.inadco.acceptance.lcx.run.features

//only import BackgroundExtension
import com.inadco.acceptance.lcx.extensions.Background
import com.inadco.acceptance.lcx.extensions.impl.BackgroundImpl

Feature: Create New User Account
	In order to conduct my business with Inadco
	As an advertiser
	I want to have an LCX Account
Background:
	val lastModified = "08/13/2013 18:13"
	extension Background bg = new BackgroundImpl(this.class, lastModified)
Scenario: Go to Main Page
	Then I should be at the "Login Page"
		args.first.at
Scenario: Go to "Create New Account" page
	Given I am at the "Login Page"
		args.first.at
	When I click on "Create an account"
		args.first.clicking
	Then I should be at the "Create New Account Page"
Scenario: Create User Account
	Given I am at the "Login Page"
	And I go to the "Create New Account Page"
		"Create an account".clicking
		args.first.at
	When I fill in the required information
		val fakePass = "12345678"
		"First Name".typing("myFirstName")
		"Last Name".typing("myLastName")
		"User Name".typing("noone3@gmail.com")
		"Password".typing(fakePass)
		"Password Confirmation".typing(fakePass)
	And I Click Submit
		"Submit".clicking
