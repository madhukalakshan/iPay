package com.ib.cucumber.definition.ipay;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.DbManager;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.Then;

public class MerchantOnboardManagement {
	
	WebDriver webDriver = null;
	private WebDriverInitializer webDriverInitializer = null;
	public static String merchantRefNumber="000406";
	Logger log = Logger.getLogger("LOG");

	public MerchantOnboardManagement(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	@Then("^I click on Merchant Ref Number$")
	public void i_click_on_Merchant_Ref_Number() throws Throwable {
		try {
			log.debug("Verify click on Merchant Ref Number");
			SetElements.clickFirstDetailLink(merchantRefNumber);
			log.debug("Successfully clicked on Merchant Ref Number");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Then("^I should see the Success message as \"([^\"]*)\" for OnBord Register new user$")
	public void i_should_see_the_Success_message_as_for_OnBord_Register_new_user(String arg1) throws Throwable {
		try {
			log.debug("Verify success message: " + arg1+" for On Bord Register new user");
			merchantRefNumber = SetElements.getID();
			log.debug("Merchan Reference Number is: "+merchantRefNumber);
			if (!SetElements.extractMessageFromListElement(arg1))
				assertTrue(arg1 + " Message not shown, No Success Message", false);
			log.debug("Successfully verified: " + arg1);
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_OnBord Register new user",
					Constants.IMAGE_LOCATION, "iPay\\On_Board_usr_reg\\");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}
	
	@Before(value="@OnBoardUsrRegis")
	public void FeatureOnboardMercUsrReg(){
    	log.debug("---------------------------------------------------------------------------");
    	CommonSteps.iImageCounter = 1;
		log.debug("Feature: Feature File for On Boad Merchant User Registration");
	}
	
	@Before(value="@MerOnboardMana")
	public void FeatureOnboardMgmt(){
    	log.debug("---------------------------------------------------------------------------");
    	CommonSteps.iImageCounter = 200;
		log.debug("Feature: Feature File for iPay Merchant Onboarding Management");
	}
}
