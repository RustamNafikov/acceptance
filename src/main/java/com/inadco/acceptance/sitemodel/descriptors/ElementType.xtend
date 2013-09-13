package com.inadco.acceptance.sitemodel.descriptors

@Data
//mrobertson - this is a candidate for replacing with a more abstract file-sourced solution
class ElementType {
	public static val PAGE = new ElementType("Page")
	public static val LINK = new ElementType("Link")
	public static val TEXT_FIELD = new ElementType("TextField")
	public static val BUTTON = new ElementType("Button")

	val String name

	private new(String name) {
		_name = name
	}

}
