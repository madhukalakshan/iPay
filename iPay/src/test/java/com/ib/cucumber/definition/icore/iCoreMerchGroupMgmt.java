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
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class iCoreMerchGroupMgmt {
	WebDriver webDriver = null;
	private WebDriverInitializer webDriverInitializer = null;
	Logger log = Logger.getLogger("LOG");

	public iCoreMerchGroupMgmt(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	@Given("^I fill the Merchant Group Details$")
	public void i_fill_the_Merchant_Group_Details(DataTable table) throws Throwable {
		try {
			log.debug("Verify fill Merchant Group Details");
			List<List<String>> Carddata = table.raw();
			
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(1).get(1), Carddata.get(1).get(0));
			SetElements.SelectNamedDropDownByValue(Carddata.get(2).get(0), Carddata.get(2).get(1));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(3).get(1), Carddata.get(3).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(4).get(1), Carddata.get(4).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(5).get(1), Carddata.get(5).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(6).get(1), Carddata.get(6).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(7).get(1), Carddata.get(7).get(0));
			SetElements.SelectNamedDropDownByValue(Carddata.get(8).get(0), Carddata.get(8).get(1));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(9).get(1), Carddata.get(9).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(10).get(1), Carddata.get(10).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(11).get(1), Carddata.get(11).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(12).get(1), Carddata.get(12).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(13).get(1), Carddata.get(13).get(0));
			SetElements.SelectNamedDropDownByValue(Carddata.get(14).get(0), Carddata.get(14).get(1));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(15).get(1), Carddata.get(15).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(16).get(1), Carddata.get(16).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(17).get(1), Carddata.get(17).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(18).get(1), Carddata.get(18).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(19).get(1), Carddata.get(19).get(0));
			SetElements.SelectNamedDropDownByValue(Carddata.get(20).get(0), Carddata.get(20).get(1));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(21).get(1), Carddata.get(21).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(22).get(1), Carddata.get(22).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(23).get(1), Carddata.get(23).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(24).get(1), Carddata.get(24).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(25).get(1), Carddata.get(25).get(0));
			
			log.debug("Successfully filled Merchant Group Details");

		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@When("^I fill Search Merchant Group Details$")
	public void i_fill_Search_Merchant_Group_Details(DataTable table) throws Throwable {
		try {
			log.debug("Verify fill Search Merchant Group Details");
			List<List<String>> Carddata = table.raw();
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(1).get(1), Carddata.get(1).get(0));
			log.debug("Successfully filled Search Merchant Group Details");

		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	// -- edit merchant group

	@Then("^I fill the Modify Merchant Group Details$")
	public void i_fill_the_Edit_Merchant_Group_Details(DataTable table) throws Throwable {
		try {
			log.debug("Verify fill Modify Merchant Group Details");
			List<List<String>> Carddata = table.raw();
			
			SetElements.SelectNamedDropDownByValue(Carddata.get(1).get(0), Carddata.get(1).get(1));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(2).get(1), Carddata.get(2).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(3).get(1), Carddata.get(3).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(4).get(1), Carddata.get(4).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(5).get(1), Carddata.get(5).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(6).get(1), Carddata.get(6).get(0));
			SetElements.SelectNamedDropDownByValue(Carddata.get(7).get(0), Carddata.get(7).get(1));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(8).get(1), Carddata.get(8).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(9).get(1), Carddata.get(9).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(10).get(1), Carddata.get(10).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(11).get(1), Carddata.get(11).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(12).get(1), Carddata.get(12).get(0));
			SetElements.SelectNamedDropDownByValue(Carddata.get(13).get(0), Carddata.get(13).get(1));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(14).get(1), Carddata.get(14).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(15).get(1), Carddata.get(15).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(16).get(1), Carddata.get(16).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(17).get(1), Carddata.get(17).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(18).get(1), Carddata.get(18).get(0));
			SetElements.SelectNamedDropDownByValue(Carddata.get(19).get(0), Carddata.get(19).get(1));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(20).get(1), Carddata.get(20).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(21).get(1), Carddata.get(21).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(22).get(1), Carddata.get(22).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(23).get(1), Carddata.get(23).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(24).get(1), Carddata.get(24).get(0));
			
			log.debug("Successfully filled Edit Merchant Group Details");

		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Then("^I should select the \"([^\"]*)\" reason in \"([^\"]*)\"$")
	public void i_should_select_the_reason_in(String arg1, String arg2, DataTable table) throws Throwable {
		try {
			log.debug("Verify select the "+arg1+" reason "+arg2);
			List<List<String>> Carddata = table.raw();
			SetElements.scrolldown();
			SetElements.SelectNamedDropDownByValue(Carddata.get(1).get(0), Carddata.get(1).get(1));
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter()+"_"+arg1+" reason",
					Constants.IMAGE_LOCATION, SetElements.setScreenShotPath(arg2)[0]);
			log.debug("Successfully selected the "+arg1+" reason "+arg2);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Given("^I Click the \"([^\"]*)\" icon to Merchant Group Management$")
	public void i_Click_the_icon_to_Merchant_Group_Management(String arg1) throws Throwable {
		try{
			log.debug("Verify click the "+arg1+" icon to Merchant Group Management");
			SetElements.clickElementByXpath("//label[contains(text(),'"+arg1+"')]");
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter()+"_"+arg1,
					Constants.IMAGE_LOCATION, "iCore\\Mer_Mgmt\\Mer_Group_Mgmt\\");
			log.debug("Successfully clicked "+arg1+" icon to Merchant Group Management");
		}
		catch(Exception e){
			log.error("Error:",e);
			throw(e);
		}
	}

	@Then("^I should see the \"([^\"]*)\" page to Merchant Group Management$")
	public void i_should_see_the_page_to_Merchant_Group_Management(String arg1) throws Throwable {
		try{
			log.debug("Verify "+arg1+" page to Merchant Group Management is loading");
			SetElements.verifyPageLoad("//h1[contains(text(),'"+arg1+"')]");
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter()+"_"+arg1,
					Constants.IMAGE_LOCATION, "iCore\\Mer_Mgmt\\Mer_Group_Mgmt\\");
			log.debug("Successfully loaded "+arg1+" page to Merchant Group Management");
		}
		catch (AssertionError e) {
			log.error("Error:",e);
			Assert.fail();
		}
	}
	
	@Before(value="@MerGrp")
	public void Feature_Commission_product(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: iCore Merchant Group Maintenance");
	}

}
