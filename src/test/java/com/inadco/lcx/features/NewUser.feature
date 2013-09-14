package com.inadco.lcx.features

Feature: Create New User Account
	In order to conduct my business with Inadco
	As an advertiser
	I want to have an LCX Account

Scenario: Go to Main Page
	Then I should be at the "Login Page"
Scenario: Go to "Create New Account" page
	Given I am at the "Login Page"
	When I click "Create an account"
	Then I should be at the "Create New Account Page"
Scenario: Create User Account
	Given I am at the "Login Page"
	And I click "Create an account"
	And I am at the "Create New Account Page"
	And I Submit "this page"
	Then I should be at the "Business Details Page"
	//mrobertson - clicking terms first is a hack
	And I click "Terms"
	And I Submit "that page"
	And I wait for "100" seconds
