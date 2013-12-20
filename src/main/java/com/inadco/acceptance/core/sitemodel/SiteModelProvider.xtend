package com.inadco.acceptance.core.sitemodel

import java.io.File
import com.inadco.acceptance.core.sitemodel.impl.SettingsBasedSiteModel

/**
 * Merely provides a SiteModel
 */
class SiteModelProvider {
	/**
	* @param the File containing the site model definition
	* @return the site model
	*/
	static def getSiteModel(File siteModelDefinition) {

		throw new UnsupportedOperationException(
			"TODO: this has not been implemented")
	}

	/**
	* @return a site model corresponding the siteModel property in application.conf
	*/
	static def getSiteModel() {
		new SettingsBasedSiteModel
	}

}
