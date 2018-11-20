package com.ib.cucumber.definition.icore;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

public class iCoreMerchCatGroupMaint {

	WebDriver webDriver = null;
	private WebDriverInitializer webDriverInitializer = null;
	Logger log = Logger.getLogger("LOG");

	public iCoreMerchCatGroupMaint(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	@Given("^I fill \"([^\"]*)\"$")
	public void i_fill(String arg1, DataTable table) throws Throwable {
		try {
			log.debug("Verify fill "+arg1);
			List<List<String>> Carddata = table.raw();
			for(int i=1; i<Carddata.size();i++)
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(i).get(1), Carddata.get(i).get(0));
			log.debug("Successfully filled "+arg1);
		}  catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@And("^I Click the \"([^\"]*)\" icon to Merchant Cat\\. Group Maintenance$")
	public void i_Click_the_icon_to_Merchant_Cat_Group_Maintenance(String arg1) throws Throwable {
		try {
			log.debug("Verify click the " + arg1 + " icon to Merchant Cat Group Maintenance");
			SetElements.clickElementByXpath("//label[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully clicked the " + arg1 + " icon to Merchant Cat Group Maintenance");
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_"+arg1,
					Constants.IMAGE_LOCATION,"iCore\\Mer_Mgmt\\Mer_Cat_Main\\Mer_Cat_Grp_Main\\");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I should see the \"([^\"]*)\" page to Merchant Cat\\. Group Maintenance$")
	public void i_should_see_the_page_to_Merchant_Cat_Group_Maintenance(String arg1) throws Throwable {
		try {
			log.debug("Verify " + arg1 + " page is loading to Merchant Cat Group Maintenance");
			SetElements.verifyPageLoad("//h1[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully loaded " + arg1 + " page to Merchant Cat Group Maintenance");
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_"+arg1,
					Constants.IMAGE_LOCATION,"iCore\\Mer_Mgmt\\Mer_Cat_Main\\Mer_Cat_Grp_Main\\");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}
	
	@Before(value="@MCG")
	public void Feature_MCG(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: iCore Merchant Category Group Maintenance");
	}
	
	

}
