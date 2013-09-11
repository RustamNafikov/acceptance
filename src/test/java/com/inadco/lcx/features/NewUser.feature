package com.inadco.lcx.features

//only import BackgroundExtension
import com.inadco.acceptance.extensions.Background
import com.inadco.acceptance.extensions.impl.BackgroundImpl

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
		"First Name".typing
		"Last Name".typing
		"User Name".typing
		"Password".typing
		"Password Confirmation".typing
	And I Click Submit
		"Submit".clicking
	And I wait
		pauseFor(100)
	Then I should be at the "DNE page"
