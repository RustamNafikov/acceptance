package com.inadco.acceptance.common.helpers

import static extension com.inadco.acceptance.common.helpers.InstancePopulator.*
import com.inadco.aper.odd.InstancePopulatable

describe InstancePopulator {

	fact "populate should work"{
		val o = new InstancePopulatable
		val m = #{'a' -> '1', 'b' -> '2'}
		populate(o, m)
		
		o.a should be '1'
		o.b should be '2'
	}
	
	
}
