package undertest.lcx.features

import com.inadco.acceptance.core.linkage.Background
import com.inadco.acceptance.core.linkage.impl.BackgroundImpl
import com.inadco.lcx.features.*


Feature: CommonSteps
	Background:
	val lastModified = "08/13/2013 18:13"
	extension Background bg = new BackgroundImpl(this.class, lastModified)

Scenario: ""
	Given _
		println()
	When __
		println()
	Then ___
		println()
	//page navigation
	And I am at the "FIRST"
		args.first.at
	//page checking
	And I should be at the "FIRST"
		args.first.at should be true
		
	And I should see "FIRST"
		args.first.see should be true
		
	And I should see "FIRST" in "SECOND"
		args.second.see(args.first) should be true

	And I Submit "FIRST"
		submit
	And I click "FIRST"
		args.first.clicking
	And I fill out "FIRST"
		args.first.typing
	And I type "FIRST" into "SECOND"
		args.first.typing(args.second)

	//development
	And I wait for "FIRST" seconds
		pauseFor(Integer.parseInt(args.first))
