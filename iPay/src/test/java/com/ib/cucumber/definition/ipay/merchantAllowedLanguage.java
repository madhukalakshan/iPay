package com.ib.cucumber.definition.ipay;

import java.util.List;

import org.apache.log4j.Logger;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.dto.ipay.merchantAllowedLanguageDto;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.*;

public class merchantAllowedLanguage {
	
	private WebDriverInitializer webDriverInitializer;
	WebDriver webDriver = null;
	Logger log = Logger.getLogger("LOG");
	
	public merchantAllowedLanguage(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
		webDriver.manage().window().maximize();
	}
	
	@And ("^I fill the Add Merchant Language Form$")
	public void i_fill_the_Add_Merchant_Language_form(DataTable table) throws Throwable {
		log.debug("Verify fill the Add Merchant Language Form");
		merchantAllowedLanguageDto merchlangDto = new merchantAllowedLanguageDto(webDriver);
		try{
			List<List<String>> MerchLangData = table.raw();
			int i = 0;
			merchlangDto.setMerchant_id(MerchLangData.get(++i).get(1), MerchLangData.get(i).get(0));		
			merchlangDto.setLanguage_code(MerchLangData.get(++i).get(1), MerchLangData.get(i).get(0));
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter()+"_Add Merchant Language Form",
					Constants.IMAGE_LOCATION,"iPay\\Mer_Rela\\Mer_All_Lan_Mgmt\\");
			log.debug("Successfully filled the Add Merchant Language Form");
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}	
		
		
	}
	
	@Before(value="@MerAllwdLanMgmt")
	public void Feature_Glb_Sett_Mgmt(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: Feature File for Merchant Language Management");
	}
}
