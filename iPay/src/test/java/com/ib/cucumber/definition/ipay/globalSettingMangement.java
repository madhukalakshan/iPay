package com.ib.cucumber.definition.ipay;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.dto.ipay.globalSettingManagementDto;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.*;

public class globalSettingMangement {
	
	private WebDriverInitializer webDriverInitializer;
	WebDriver webDriver = null;
	Logger log = Logger.getLogger("LOG");
	
	public globalSettingMangement(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
		webDriver.manage().window().maximize();
	}
	
	@Given("^I fill the Add Global Txn.Setting Form$")
	public void i_fill_the_Add_Global_Txn_form(DataTable table) throws Throwable {
		try{
			log.debug("Verify fill the Add Global Txn.Setting Form");
			globalSettingManagementDto globsetDto = new globalSettingManagementDto(webDriver);
			List<List<String>> GlobSettingdata = table.raw();
			int i = 0;
			
			globsetDto.setGlobal_limit_category(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));		
			globsetDto.setCurrency_code(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setGlob_limit_cat_desc(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setPer_sale_txn_limit_value(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setDaily_sale_txn_limit_value(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setMonthly_sale_txn_limit_value(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setDebit_void_alwd(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setCredit_card_void_alwd(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setDebit_refund_alwd(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setCredit_card_refund_alwd(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setDebit_clearance_alwd(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setDcredit_clearance_alwd(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setPer_refund_txn_limit_value(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setDaily_refund_txn_limit_value(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setMonthly_refund_txn_limit_value(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setOff_us_credit_card_alwd(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));		
			globsetDto.setPlain_text_txn_req_alwd(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setVoid_allowed_period_value(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setRefund_allowed_period_value(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			globsetDto.setClearance_allowed_period_value(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			log.debug("Successfully filled the Add Global Txn.Setting Form");
			
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Given("^I fill the Global Setting search form$")
	public void i_fill_the_Global_Setting_search_form(DataTable table) throws Throwable {
		try{
			log.debug("Verify fill the Global Setting search form");
			globalSettingManagementDto globsetDto = new globalSettingManagementDto(webDriver);
			List<List<String>> GlobSettingdata = table.raw();
			for(int i=0;i<GlobSettingdata.size();i++)
				globsetDto.setGlob_txn_id(GlobSettingdata.get(++i).get(1), GlobSettingdata.get(i).get(0));
			log.debug("Successfully filled the Global Setting search form");
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
		
	}
	
	@Given("^I Click the \"([^\"]*)\" icon to Global Setting Managment$")
	public void i_Click_the_icon_to_Global_Setting_Managment(String arg1) throws Throwable {
		try {
			log.debug("Verify click the " + arg1 + " icon");
			SetElements.clickElementByXpath("//label[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully clicked the " + arg1 + " icon");
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_"+arg1,
					Constants.IMAGE_LOCATION, "iPay\\Mer_Rela\\Glb_Sett_Mgmt\\");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I should see the \"([^\"]*)\" page to Global Setting Managment$")
	public void i_should_see_the_page_to_Global_Setting_Managment(String arg1) throws Throwable {
		try {
			log.debug("Verify " + arg1 + " page is loading");
			SetElements.verifyPageLoad("//h1[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully loaded " + arg1 + " page");
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_"+arg1,
					Constants.IMAGE_LOCATION, "iPay\\Mer_Rela\\Glb_Sett_Mgmt\\");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}
	
	@Before(value="@GlbSettMgmt")
	public void Feature_Glb_Sett_Mgmt(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter = 1;
		log.debug("Feature: Feature File for Global Setting Management");
	}
	
	@Before(value="@iPayHomePage")
	public void Feature_iPay_Home_Page(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter = 1;
		log.debug("Feature: iPay Home Page");
	}

}

