package com.ib.cucumber.definition.ipay;

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
import cucumber.api.java.en.Then;

public class iPay_BusinessTypeMgmt {

	WebDriver webDriver;
	private WebDriverInitializer webDriverInitializer = null;
	Logger log = Logger.getLogger("LOG");

	public iPay_BusinessTypeMgmt(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	@Then("^I should be on Add Business Type Mgmt Page$")
	public void i_should_be_on_Add_Business_Type_Mgmt_Page(DataTable table) throws Throwable {
		try{
			log.debug("Verify Add Business Type Mgmt Page");
			List<List<String>> addBusTyp = table.raw();
			SetElements.setElementByName(Constants.TYPE_TEXT, addBusTyp.get(1).get(1), addBusTyp.get(1).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, addBusTyp.get(2).get(1), addBusTyp.get(2).get(0));
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_Add Business Type",
					Constants.IMAGE_LOCATION,"iPay\\Mer_Rela\\Bus_Type_Mgmt\\");
			log.debug("Successfully verified Add Business Type Mgmt Page");
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I fill Search business type Details$")
	public void i_fill_Search_business_type_Details(DataTable table) throws Throwable {
		try{
			log.debug("Verify fill Search business type Details");
			List<List<String>> addBusTyp = table.raw();
			SetElements.setElementByName(Constants.TYPE_TEXT, addBusTyp.get(1).get(1), addBusTyp.get(1).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, addBusTyp.get(2).get(1), addBusTyp.get(2).get(0));
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_Search business type Details",
					Constants.IMAGE_LOCATION,"iPay\\Mer_Rela\\Bus_Type_Mgmt\\");
			log.debug("Successfully filled Search business type Details");
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}	
	}
	
	@Then("^I Click on \"([^\"]*)\" Button in \"([^\"]*)\" of Business Type Mgmt$")
	public void i_Click_on_Button_in_of_Business_Type_Mgmt(String arg1, String arg2) throws Throwable {
		try {
			SetElements.scrolldown();
			log.debug("Verify click on " + arg1 + " Button in "+arg2+" of Business Type Mgmt");
			SetElements.clickElementByXpath("//input[@value='"+arg1+"']");
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter()+"_"+arg2,
					Constants.IMAGE_LOCATION, SetElements.setScreenShotPath(arg2)[0]);
			log.debug("Successfully clicked on " + arg1 + " Button in "+arg2+" of Business Type Mgmt");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Before(value="@BusTypeMgmt")
	public void Feature_Glb_Sett_Mgmt(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: Business Type Management");
	}
}
