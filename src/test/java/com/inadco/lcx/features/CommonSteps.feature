package com.inadco.lcx.features

import com.inadco.acceptance.extensions.Background
import com.inadco.acceptance.extensions.impl.BackgroundImpl

Feature: CommonSteps
	Background:
	val lastModified = "08/13/2013 18:13"
	extension Background bg = new BackgroundImpl(this.class, lastModified)
Scenario: ""
	Given I am at the "FIRST"
		args.first.at
	And I can do it
		println("it is done")
	And then I am at the "FIRST"
		args.first.at
	And I wait for "FIRST" seconds
		pauseFor(Integer.parseInt(args.first))
	And I Submit
		"Submit".clicking
	When I click "FIRST"
		args.first.clicking
	Then I should be at the "FIRST"
		args.first.at
