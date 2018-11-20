package com.ib.cucumber.definition.ipay;

import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.java.Before;
import cucumber.api.java.en.Then;

public class VirtualTerminal {
	
	WebDriver webDriver;
	private WebDriverInitializer webDriverInitializer = null;
	Logger log = Logger.getLogger("LOG");
	public static String merchantReferenceIdVT = "111111111110";

	public VirtualTerminal(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}
	
	@Then("^I should see \"([^\"]*)\" transaction status in \"([^\"]*)\"$")
	public void i_should_see_transaction_status_in(String arg1, String arg2) throws Throwable {
		webDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
		Boolean trxnStatus;
		String trxnStatusText = "";
		log.debug("Verify Transaction Status");
		try {
			merchantReferenceIdVT = webDriver
					.findElement(By.xpath("//div[@class='main_content']/fieldset/ol/li[2]")).getText().replaceAll("\\s", "").replaceAll("\\D+","");
			log.debug("MerchantRefarenceIDOne is--" + merchantReferenceIdVT+"---");
			trxnStatusText = webDriver.findElement(By.xpath("//div[@class='main_content']/fieldset/ol/li[1]"))
					.getText();
			log.debug("trxnStatusText: " + trxnStatusText);
			trxnStatus = (trxnStatusText.contains(arg1) ? true : false);
			log.debug("trxnStatus: " + trxnStatus);
			Assert.assertTrue(trxnStatus);
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter++ + "_transaction status", Constants.IMAGE_LOCATION,
					SetElements.setScreenShotPath(arg2)[0]);
			log.debug("Successfully verified Transaction Status");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}
	
	@Before(value="@VirtualTerminal")
	public void FeatureirtualTerminal(){
    	log.debug("---------------------------------------------------------------------------");
    	CommonSteps.iImageCounter = 1;
		log.debug("Feature: Feature File for iPay Virtual Terminal");
	}
	
	@Before(value="@VirtualTerminalTrxn")
	public void FeatureVirtualTerminalTrxn(){
    	log.debug("---------------------------------------------------------------------------");
    	CommonSteps.iImageCounter = 100;
    	log.debug("Feature: Feature File for iPay Virtual Terminal");
	}
	 
	@Before(value="@OnbordingVirtualTerminal")
	public void FeatureOnbordingVirtualTerminal(){
    	log.debug("---------------------------------------------------------------------------");
    	CommonSteps.iImageCounter = 100;
    	log.debug("Feature: Feature File for Onboarding Virtual Terminal");
	}
	

}
