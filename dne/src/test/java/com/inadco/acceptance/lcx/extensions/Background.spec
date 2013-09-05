package com.inadco.acceptance.lcx.extensions

import com.inadco.acceptance.lcx.extensions.Background
import com.inadco.acceptance.lcx.extensions.impl.BackgroundImpl

describe Background {
	extension Background background = new BackgroundImpl(this.class, "abc 123")
		fact "See an Element "{
			"Create an account".see should be true
			
	}
}
