package com.inadco.lcx.features

//only import BackgroundExtension and CommonStepsFeature
import com.inadco.acceptance.extensions.Background
import com.inadco.acceptance.extensions.impl.BackgroundImpl
//import com.inadco.lcx.features.CommonStepsFeature

Feature: Create New User Account
	In order to conduct my business with Inadco
	As an advertiser
	I want to have an LCX Account
Background:
	val lastModified = "08/13/2013 18:13"
	extension Background bg = new BackgroundImpl(this.class, lastModified)
Scenario: Go to Main Page
	Then I should be at the "Login Page"
Scenario: Go to "Create New Account" page
	Given I am at the "Login Page"
	When I click "Create an account"
	Then I should be at the "Create New Account Page"
Scenario: Create User Account
	Given I am at the "Login Page"
	And I can do it
	And I click "Create an account"
	And then I am at the "Create New Account Page"
	When I fill in my user account information
		"First Name".typing
		"Last Name".typing
		"User Name".typing
		"Password".typing
		"Password Confirmation".typing
	And I Submit
	Then I should be at the "Business Details Page"
	And when I fill in my business details information
		"Company Name".typing
		"Address".typing
		"City".typing
		"State".typing //for now, will be selecting later
		"Zip".typing
		"Phone".typing
		"Terms".clicking //for now, will be selecting later
	And I Submit that page too
		"Submit".clicking
	And I wait for "100" seconds
