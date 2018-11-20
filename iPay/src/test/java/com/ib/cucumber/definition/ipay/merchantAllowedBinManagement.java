package com.ib.cucumber.definition.ipay;

import java.util.List;

import org.apache.log4j.Logger;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.dto.ipay.merchantAllowedBinDto;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.*;

public class merchantAllowedBinManagement {

	private WebDriverInitializer webDriverInitializer;
	WebDriver webDriver = null;
	Logger log = Logger.getLogger("LOG");
	
	public merchantAllowedBinManagement(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
		webDriver.manage().window().maximize();
	}
	
	@And ("^I fill the Add Merchant Allowed Bin Form$")
	public void i_fill_the_add_merchant_allowed_bin_form(DataTable table) throws Throwable {
		try{
			log.debug("Verify fill the Add Merchant Allowed Bin Form");
			merchantAllowedBinDto binManDto = new merchantAllowedBinDto(webDriver);
			List<List<String>> MerchBinData = table.raw();
			int i = 0;
			
			binManDto.setProduct_code(MerchBinData.get(++i).get(1), MerchBinData.get(i).get(0));
			binManDto.setMerchant_id(MerchBinData.get(++i).get(1), MerchBinData.get(i).get(0));
			binManDto.setBin_length(MerchBinData.get(++i).get(1), MerchBinData.get(i).get(0));
			binManDto.setBin(MerchBinData.get(++i).get(1), MerchBinData.get(i).get(0));
			binManDto.setBank_code(MerchBinData.get(++i).get(1), MerchBinData.get(i).get(0));
			binManDto.setBank_name(MerchBinData.get(++i).get(1), MerchBinData.get(i).get(0));
			binManDto.setCountry_code(MerchBinData.get(++i).get(1), MerchBinData.get(i).get(0));
			binManDto.setCard_no_length(MerchBinData.get(++i).get(1), MerchBinData.get(i).get(0));
			binManDto.setInclude_exclude(MerchBinData.get(++i).get(1), MerchBinData.get(i).get(0));	
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter()+"_Add Merchant Allowed Bin Form",
					Constants.IMAGE_LOCATION,"iPay\\Mer_Rela\\Mer_All_BIN_Mgmt\\");
			log.debug("Successfully filled the Add Merchant Allowed Bin Form");
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}		
	}
	
	@And ("^I fill the Search Merchant Allowed Bin \"([^\"]*)\" Form$")
	public void i_fill_the_Search_merchant_allowed_bin_form(String sAction,DataTable table) throws Throwable {
		try{
			log.debug("Verify fill the Search Merchant Allowed Bin "+sAction+" Form");
			merchantAllowedBinDto binManDto = new merchantAllowedBinDto(webDriver);
			List<List<String>> MerchBinData = table.raw();
			int i = 0;	
			binManDto.setProduct_code(MerchBinData.get(++i).get(1), MerchBinData.get(i).get(0));
			binManDto.setMerchant_id(MerchBinData.get(++i).get(1), MerchBinData.get(i).get(0));	
			binManDto.setBin(MerchBinData.get(++i).get(1), MerchBinData.get(i).get(0));
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter()+"_Search Merchant Allowed Bin "+sAction+" Form",
					Constants.IMAGE_LOCATION,"iPay\\Mer_Rela\\Mer_All_BIN_Mgmt\\");
			log.debug("Successfully filled the Search Merchant Allowed Bin "+sAction+" Form");
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}			
	}
	
	@Before(value="@MerAllwdBinMgmt")
	public void Feature_Glb_Sett_Mgmt(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: Feature File for Merchant Allowed Bin Management");
	}
}
