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

public class iPay_BlacklistedCardManagement {

	WebDriver webDriver;
	private WebDriverInitializer webDriverInitializer = null;
	Logger log = Logger.getLogger("LOG");

	public iPay_BlacklistedCardManagement(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	@Then("^I should be on Add Blacklisted Card Page$")
	public void i_should_be_on_Add_Blacklisted_Card_Page(DataTable table) throws Throwable {
		try{
			log.debug("Verify Add Blacklisted Card Page");
			List<List<String>> addmerCatMngt = table.raw();
			SetElements.setElementByName(Constants.TYPE_TEXT, addmerCatMngt.get(1).get(1), addmerCatMngt.get(1).get(0));
			SetElements.SelectIDDropDownByValue(addmerCatMngt.get(2).get(0), addmerCatMngt.get(2).get(1));
			SetElements.setElementByName(Constants.TYPE_TEXT, addmerCatMngt.get(3).get(1), addmerCatMngt.get(3).get(0));
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_Add Blacklisted Card Page",
					Constants.IMAGE_LOCATION,"iPay\\Maintenance\\BlaLis_Card_Mgmt\\");
			log.debug("Successfully verified Add Blacklisted Card Page");
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
		
	}

	@Then("^I fill Search  Blacklisted Card Details$")
	public void i_fill_Search_Blacklisted_Card_Details(DataTable table) throws Throwable {
		try{
			List<List<String>> searchBlacklisted = table.raw();
			SetElements.setElementByName(Constants.TYPE_TEXT, searchBlacklisted.get(1).get(1), searchBlacklisted.get(1).get(0));
			SetElements.SelectIDDropDownByValue(searchBlacklisted.get(2).get(0), searchBlacklisted.get(2).get(1));
			SetElements.setElementByName(Constants.TYPE_TEXT, searchBlacklisted.get(3).get(1), searchBlacklisted.get(3).get(0));
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_Add Blacklisted Card Page",
					Constants.IMAGE_LOCATION,"iPay\\Maintenance\\BlaLis_Card_Mgmt\\");
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
		
	}
	
	public String maskCardnumber(String cardNumber){
		try{
			String myName = cardNumber;
			String newName1 = myName.substring(0, 6);
			String newName2 = myName.substring(6, 12);
			String newName3 = newName2.replace(newName2, "XX..XX");
			String newName4 = myName.substring(12, 16);
			String maskCardNumber=newName1+newName3+newName4;
			return maskCardNumber;
		}catch(IndexOutOfBoundsException e){
		    log.error("Error:", e);
		    throw (e);
	   }
	}

	@Then("^I click the link \"([^\"]*)\" in \"([^\"]*)\"$")
	public void i_click_the_link_in(String arg1, String arg2) throws Throwable {
		try {
			log.debug("Click on details link "+arg1+" in "+arg2);
			SetElements.clickFirstDetailLink(maskCardnumber(arg1));
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_click the link",
					Constants.IMAGE_LOCATION,SetElements.setScreenShotPath(arg2)[0]);
			log.debug("Successfully clicked on details link "+arg1+" in "+arg2);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I edit the Reason in \"([^\"]*)\"$")
	public void i_edit_the_Reason_in(String arg1, DataTable table) throws Throwable {
		try{
			List<List<String>> editBlacklisted = table.raw();
			SetElements.setElementByName(Constants.TYPE_TEXT, editBlacklisted.get(1).get(1), editBlacklisted.get(1).get(0));
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_edit the Reason",
					Constants.IMAGE_LOCATION,SetElements.setScreenShotPath(arg1)[0]);
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Before(value="@BlacklistCardMgmt")
	public void Feature_Glb_Sett_Mgmt(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter = 1;
		log.debug("Feature File for Blacklisted Card Management");
	}


}
