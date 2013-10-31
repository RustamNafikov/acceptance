package com.inadco.acceptance.core.businessmodel.impl

import com.inadco.acceptance.core.businessmodel.BusinessModel
import java.util.List
import com.inadco.acceptance.core.businessmodel.BusinessObject

class SettingsBasedBusinessModel implements BusinessModel {

	List<BusinessObject> users
	List<BusinessObject> advertiser
	List<BusinessObject> campaign

	override getUser() {
		users.head
	}

}
