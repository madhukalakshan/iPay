package com.ib.cucumber.definition.ipay;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.dto.ipay.merchantProductManagementDto;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.*;

public class merchantProductMangement {
	
	private WebDriverInitializer webDriverInitializer;
	WebDriver webDriver = null;
	Logger log = Logger.getLogger("LOG");

	public merchantProductMangement(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
		webDriver.manage().window().maximize();
	}
	
	@And ("^I fill the Add Merchant Product Form$")
	public void i_fill_the_Add_Merchant_Product_form(DataTable table) throws Throwable {
		try{
			log.debug("Verify fill the Add Merchant Product Form");
			merchantProductManagementDto prodManDto = new merchantProductManagementDto(webDriver);
			List<List<String>> MerchProductData = table.raw();
			int i = 0;
			
			prodManDto.setMerchant_id(MerchProductData.get(++i).get(1), MerchProductData.get(i).get(0));		
			prodManDto.setProduct_code(MerchProductData.get(++i).get(1), MerchProductData.get(i).get(0));	
//			prodManDto.setBin_length(MerchProductData.get(++i).get(1), MerchProductData.get(i).get(0));	
//			prodManDto.setBin(MerchProductData.get(++i).get(1), MerchProductData.get(i).get(0));	
//			prodManDto.setBank_code(MerchProductData.get(++i).get(1), MerchProductData.get(i).get(0));	
//			prodManDto.setBank_name(MerchProductData.get(++i).get(1), MerchProductData.get(i).get(0));	
//			prodManDto.setIss_country_code(MerchProductData.get(++i).get(1), MerchProductData.get(i).get(0));	
//			prodManDto.setCard_no_length(MerchProductData.get(++i).get(1), MerchProductData.get(i).get(0));	
//			prodManDto.setInclude_exclude(MerchProductData.get(++i).get(1), MerchProductData.get(i).get(0));
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_Add Merchant Product Form",
					Constants.IMAGE_LOCATION, "iPay\\Mer_Rela\\Mer_Pro_Mgmt\\");
			log.debug("Successfully filled the Add Merchant Product Form");
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	
	}
	
	@And ("^I fill the Search Merchant Product Form$")
	public void i_fill_the_Search_Merchant_Product_form(DataTable table) throws Throwable {
		try{
			log.debug("Verify fill the Search Merchant Product Form");
			merchantProductManagementDto prodManDto = new merchantProductManagementDto(webDriver);
			List<List<String>> MerchProductData = table.raw();
			int i = 0;		
			prodManDto.setMerchant_id_input(MerchProductData.get(++i).get(1), MerchProductData.get(i).get(0));
			prodManDto.setProduct_code(MerchProductData.get(++i).get(1), MerchProductData.get(i).get(0));
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_Search Merchant Product Form$",
					Constants.IMAGE_LOCATION, "iPay\\Mer_Rela\\Mer_Pro_Mgmt\\");
			log.debug("Successfully filled the Search Merchant Product Form");
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
				
	}
	
	@Given("^I Click the \"([^\"]*)\" icon to Merchant Product Management$")
	public void i_Click_the_icon_to_Merchant_Product_Management(String arg1) throws Throwable {
		try {
			log.debug("Verify click the " + arg1 + " icon");
			SetElements.clickElementByXpath("//label[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully clicked the " + arg1 + " icon");
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_"+arg1,
					Constants.IMAGE_LOCATION, "iPay\\Mer_Rela\\Mer_Pro_Mgmt\\");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I should see the \"([^\"]*)\" page to Merchant Product Management$")
	public void i_should_see_the_page_to_Merchant_Product_Management(String arg1) throws Throwable {
		try {
			log.debug("Verify " + arg1 + " page is loading");
			SetElements.verifyPageLoad("//h1[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully loaded " + arg1 + " page");
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_"+arg1,
					Constants.IMAGE_LOCATION, "iPay\\Mer_Rela\\Mer_Pro_Mgmt\\");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}
	
	@Before(value="@MerProMgmt")
	public void Feature_Glb_Sett_Mgmt(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: Feature File for Merchant Product Management");
	}
}
