package com.ib.cucumber.definition.iadmin;

import org.apache.log4j.Logger;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;

import cucumber.api.java.Before;
import cucumber.api.java.en.Then;

public class MerchantUserManagement {
	
	private WebDriverInitializer webDriverInitializer;
	WebDriver webDriver = null;
	Logger log = Logger.getLogger("LOG");

	public MerchantUserManagement(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}
	
	@Before(value="@iAdminMerUsrMgmt")
	public void Feature_POS_Terminal_Mgmt(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: Feature File for Merchant User Management");
	}


}
