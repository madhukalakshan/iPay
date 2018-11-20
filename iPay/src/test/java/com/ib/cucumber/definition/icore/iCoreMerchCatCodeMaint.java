package com.ib.cucumber.definition.icore;

import org.junit.Assert;
import static org.junit.Assert.assertTrue;

import java.util.List;

import org.apache.log4j.Logger;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

public class iCoreMerchCatCodeMaint {
	String sMessage = "";
	WebDriver webDriver = null;
	private WebDriverInitializer webDriverInitializer = null;
	Logger log = Logger.getLogger("LOG");

	public iCoreMerchCatCodeMaint(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	@Then("^I Check if MCC exists$")
	public void i_Check_if_MCC_exists() throws Throwable {
		try {
			log.debug("Verify check if MCC exists");
			if (SetElements.extractMessageFromTable("No Records Found"))
				assertTrue("No Record Found,Unable to delete MCC", false);
			log.debug("Successfully verified check if MCC exists");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@Then("^I Check if MCG exists$")
	public void i_Check_if_MCG_exists() throws Throwable {
		try {
			log.debug("Verify check if MCC exists");
			if (SetElements.extractMessageFromTable("No Records Found"))
				assertTrue("MCG not Found,Unable to add MCC", false);
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@Then("^I modify \"([^\"]*)\"$")
	public void i_modify(String arg1, DataTable table) throws Throwable {
		try {
			log.debug("Verify modify " + arg1);
			List<List<String>> Carddata = table.raw();
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(1).get(1), Carddata.get(1).get(0));
			log.debug("Successfully verified modify " + arg1);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@And("^I Click the \"([^\"]*)\" icon to Merchant Cat\\. Code Maintenance$")
	public void i_Click_the_icon_to_Merchant_Cat_Code_Maintenance(String arg1) throws Throwable {
		try {
			log.debug("Verify click the " + arg1 + " icon to Merchant Cat Code Maintenance");
			SetElements.clickElementByXpath("//label[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully clicked the " + arg1 + " icon to Merchant Cat Code Maintenance");
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_"+arg1,
					Constants.IMAGE_LOCATION, "iCore\\Mer_Mgmt\\Mer_Cat_Main\\Mer_Cat_Cde_Main\\");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I should see the \"([^\"]*)\" page to Merchant Cat\\. Code Maintenance$")
	public void i_should_see_the_page_to_Merchant_Cat_Code_Maintenance(String arg1) throws Throwable {
		try {
			log.debug("Verify " + arg1 + " page is loading to Merchant Cat Code Maintenance");
			SetElements.verifyPageLoad("//h1[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully loaded " + arg1 + " page to Merchant Cat Code Maintenance");
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_"+arg1,
					Constants.IMAGE_LOCATION,"iCore\\Mer_Mgmt\\Mer_Cat_Main\\Mer_Cat_Cde_Main\\");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}
	
	@Before(value="@MCC")
	public void Feature_Commission_product(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: iCore Merchant Category Code Maintenance");
	}

}
