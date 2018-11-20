package com.ib.cucumber.definition.ipay;

import org.apache.log4j.Logger;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.java.en.Then;

public class IpayCommonSteps {

	private WebDriverInitializer webDriverInitializer;
	WebDriver webDriver = null;
	Logger log = Logger.getLogger("LOG");

	public IpayCommonSteps(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	@Then("^I Click on Button \"([^\"]*)\" in \"([^\"]*)\"$")
	public void i_Click_on_Button_in(String arg1, String arg2) throws Throwable {
		try {
			SetElements.scrolldown();
			log.debug("Verify click on " + arg1 + " Button in " + arg2);
			SetElements.waitElementVisibleById(arg1, Constants.TIME_OUT_PERIOD);
			SetElements.clickElementById(arg1);
			if(SetElements.isAlertPresent()){
				SetElements.clickAlert();
			}
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_" + arg2, Constants.IMAGE_LOCATION,
					SetElements.setScreenShotPath(arg2)[0]);
			log.debug("Successfully clicked on " + arg1 + " Button in " + arg2);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I click the link \"([^\"]*)\" in ipay \"([^\"]*)\"$")
	public void i_click_the_link_in_ipay(String arg1, String arg2) throws Throwable {
		try{
			log.debug("Click on "+arg1+" details link in ipay "+arg2);
			SetElements.clickFirstDetailLink(arg1);
			log.debug("Successfully click on details link in ipay "+arg2);
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_" + arg2, Constants.IMAGE_LOCATION,
					SetElements.setScreenShotPath(arg2)[0]);
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}

	}
}
