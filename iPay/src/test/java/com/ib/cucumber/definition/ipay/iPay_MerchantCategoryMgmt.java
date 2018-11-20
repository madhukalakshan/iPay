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

public class iPay_MerchantCategoryMgmt {

	WebDriver webDriver;
	private WebDriverInitializer webDriverInitializer = null;
	Logger log = Logger.getLogger("LOG");

	public iPay_MerchantCategoryMgmt(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	@Then("^I should be on Add Merchant Category Page$")
	public void i_should_be_on_Add_Merchant_Category_Page(DataTable table) throws Throwable {
		try{
			log.debug("Verify Add Merchant Category Page");
			List<List<String>> addmerCatMngt = table.raw();
			SetElements.setElementByName(Constants.TYPE_TEXT, addmerCatMngt.get(1).get(1), addmerCatMngt.get(1).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, addmerCatMngt.get(2).get(1), addmerCatMngt.get(2).get(0));
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter()+"_Add Merchant Category Page",
					Constants.IMAGE_LOCATION,"iPay\\Mer_Rela\\Mer_Cat_Mgmt\\");
			log.debug("Successfully verified Add Merchant Category Page");
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	
	@Then("^I fill the Search Merchant Category \"([^\"]*)\" Form$")
	public void i_fill_the_Search_Merchant_Category_Form(String arg1,DataTable table) throws Throwable {
		try{
			log.debug("Verify fill the Search Merchant Category "+arg1+" Form");
			List<List<String>> addmerCatMngt = table.raw();
			SetElements.setElementByName(Constants.TYPE_TEXT, addmerCatMngt.get(1).get(1), addmerCatMngt.get(1).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, addmerCatMngt.get(2).get(1), addmerCatMngt.get(2).get(0));
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter()+"_Search Merchant Category "+arg1+" Form",
					Constants.IMAGE_LOCATION,"iPay\\Mer_Rela\\Mer_Cat_Mgmt\\");
			log.debug("Successfully filled the Search Merchant Category "+arg1+" Form");
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Then("^I edit description$")
	public void i_edit_description(DataTable table) throws Throwable {
		try{
			log.debug("Verify edit description");
			List<List<String>> addmerCatMngt = table.raw();
			SetElements.setElementByName(Constants.TYPE_TEXT, addmerCatMngt.get(1).get(1), addmerCatMngt.get(1).get(0));
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter()+"_edit description",
					Constants.IMAGE_LOCATION,"iPay\\Mer_Rela\\Mer_Cat_Mgmt\\");
			log.debug("Successfully edited description");
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Before(value="@MerCatMgmt")
	public void Feature_Glb_Sett_Mgmt() throws InterruptedException{
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: Merchant Category Management");
	}
}
