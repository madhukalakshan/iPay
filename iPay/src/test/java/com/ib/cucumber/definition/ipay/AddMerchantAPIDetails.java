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

public class AddMerchantAPIDetails {
	private WebDriverInitializer webDriverInitializer;
	WebDriver webDriver = null;
	WebDriver webDriverthree = null;
	Logger log = Logger.getLogger("LOG");
	LoginFormDto loginForm = null;
	public static String apiKeyValue = "MTIzNDU2Q0FSR0lMTFNNRVJDSEFOVE9OR";
	public static String onboardingApiKeyValue = "MTIzNDU2MDAxMDgwMDAxMDAzM";
	
	public AddMerchantAPIDetails(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}
	
	@Then("^I get API Key value \"([^\"]*)\"$")
	public void i_get_API_Key_value(String arg1) throws Throwable {
		String function=arg1.replaceAll("\\s", "").toLowerCase();
		try{
			log.debug("Verify get API Key value");
			if(function.equals("onboarding")){
				onboardingApiKeyValue=SetElements.getAttributeValueById("apiKey");
				log.debug("ApiKey value in Onboarding: "+onboardingApiKeyValue);
			}else{
				apiKeyValue=SetElements.getAttributeValueById("apiKey");
				log.debug("ApiKey value in iPay: "+apiKeyValue);
			}
			log.debug("Successfully got API Key value");
		}catch (Exception e) {
            log.error("Error:", e);
            throw (e);
        }	
	}
	
	@Then("^I should display message as \"([^\"]*)\" when navigate to \"([^\"]*)\"$")
	public void i_should_display_message_as_when_navigate_to(String arg1, String arg2) throws Throwable {
		String displayMessage = "";
		String message = arg1.replaceAll("\\s", "");
		log.debug("Verify success message: " + arg1 + " in " + arg2);
		log.debug("Message 1:" + arg1);
		try {
			displayMessage = SetElements.messageText();
			log.debug("Message 2:" + displayMessage);
			Assert.assertTrue("Massage comparision are different", displayMessage.contains(message));
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
		log.debug("Successfully verified: " + arg1 + " in " + arg2);
		WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter++ + "_" + arg2, Constants.IMAGE_LOCATION,
				SetElements.setScreenShotPath(arg2)[0]);
	}
	
	@Before(value="@AddMerAPIDtls")
	public void FeatureAddMerAPIDtls(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter = 1;
		log.debug("Feature: Feature File for Add Merchant API Details");
	}
	
	@Before(value="@OnbordingAddMerAPIDtls")
	public void FeatureOnboardingAddMerAPIDtls(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter = 100;
		log.debug("Feature: Feature File for Add Merchant API Details to Onbording");
	}

}
