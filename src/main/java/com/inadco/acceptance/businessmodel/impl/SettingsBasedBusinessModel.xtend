package com.inadco.acceptance.businessmodel.impl

import com.inadco.acceptance.businessmodel.BusinessModel
import java.util.List
import com.inadco.acceptance.businessmodel.BusinessObject

class SettingsBasedBusinessModel implements BusinessModel {

	List<BusinessObject> users
	List<BusinessObject> advertiser
	List<BusinessObject> campaign

	override getUser() {
		users.head
	}

}
