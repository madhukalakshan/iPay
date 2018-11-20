package com.ib.cucumber.definition.ipay;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.dto.iadmin.LoginFormDto;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

public class Ipay_MerchantUserRegistration {
	
	private WebDriverInitializer webDriverInitializer;
	WebDriver webDriver=null;
	LoginFormDto loginForm = null;
	Logger log = Logger.getLogger("LOG");
	
	public Ipay_MerchantUserRegistration(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	@Then("^I verify Merchant User Registration page is loaded$")
	public void i_verify_Merchant_User_Registration_page_is_loaded() throws Throwable {
		try{
			log.debug("Verify Merchant User Registration page is loaded");
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_Registration page load",
                    Constants.IMAGE_LOCATION,"iPay\\NewMerchUsrRegis\\");
			Assert.assertTrue(SetElements.getTitle().equals("Merchant User Registration Form"));
			log.debug("Successfully verified Merchant User Registration page is loaded");
		}catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@Before(value="@MerusrRegis")
	public void Feature_Glb_Sett_Mgmt(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: Feature File for Merchant User Registration");
	}

}
