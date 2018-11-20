package com.ib.cucumber.definition.ipay;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.definition.icore.IcoreAccountMgmt;
import com.ib.cucumber.dto.ipay.merchantCurrencyManagementDto;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

public class merchantCurrencyManagement {

	private WebDriverInitializer webDriverInitializer;
	WebDriver webDriver = null;
	Logger log = Logger.getLogger("LOG");

	public merchantCurrencyManagement(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
		webDriver.manage().window().maximize();
	}

	@And("^I fill the Add Merchant Currency Form$")
	public void i_fill_the_Add_Merchant_Currency_form(DataTable table) throws Throwable {
		try {
			log.debug("Verify fill the Add Merchant Currency Form");
			merchantCurrencyManagementDto currManDto = new merchantCurrencyManagementDto(webDriver);
			List<List<String>> MerchCurrData = table.raw();
			int i = 0;

			currManDto.setMerchant_id(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setCurrency_code(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setTerminal_id(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setGlobal_limit_category(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setMerchant_account_number(IcoreAccountMgmt.merchantAcounNumber, "merchant_account_number");
			currManDto.setPer_sale_txn_limit_alwd(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setPer_sale_txn_limit_value(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setDaily_sale_txn_limit_alwd(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setDaily_sale_txn_limit_value(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setMonthly_sale_txn_limit_alwd(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setMonthly_sale_txn_limit_value(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setDebit_void_alwd(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setCredit_card_void_alwd(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setDebit_refund_alwd(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setCredit_card_refund_alwd(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setDebit_clearance_alwd(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setCredit_clearance_alwd(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setPer_refund_txn_limit_alwd(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setPer_refund_txn_limit_value(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setDaily_refund_txn_limit_alwd(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setDaily_refund_txn_limit_value(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setMonthly_refund_txn_limit_alwd(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setMonthly_refund_txn_limit_value(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setOff_us_credit_card_alwd(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setPlain_text_txn_req_alwd(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_Search Merchant Currency Form", Constants.IMAGE_LOCATION,
					"iPay\\Mer_Rela\\Mer_Curr_Mgmt\\");
			log.debug("Successfully filled the Add Merchant Currency Form");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}

	}

	@And("^I fill the Search Merchant Currency Form$")
	public void i_fill_the_Search_Merchant_Currency_form(DataTable table) throws Throwable {
		try{
			log.debug("Verify fill the Search Merchant Currency Form");
			merchantCurrencyManagementDto currManDto = new merchantCurrencyManagementDto(webDriver);
			List<List<String>> MerchCurrData = table.raw();
			int i = 0;
			currManDto.setMerchant_id_input(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			currManDto.setCurrency_code(MerchCurrData.get(++i).get(1), MerchCurrData.get(i).get(0));
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_Search Merchant Currency Form", Constants.IMAGE_LOCATION,
					"iPay\\Mer_Rela\\Mer_Curr_Mgmt\\");
			log.debug("Successfully filled the Search Merchant Currency Form");
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
		
	}

	@Given("^I Click the \"([^\"]*)\" icon to Merchant Currency Management$")
	public void i_Click_the_icon_to_Merchant_Currency_Management(String arg1) throws Throwable {
		try {
			log.debug("Verify click the " + arg1 + " icon");
			SetElements.clickElementByXpath("//label[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully clicked the " + arg1 + " icon");
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_" + arg1, Constants.IMAGE_LOCATION,
					"iPay\\Mer_Rela\\Mer_Curr_Mgmt\\");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I should see the \"([^\"]*)\" page to Merchant Currency Management$")
	public void i_should_see_the_page_to_Merchant_Currency_Management(String arg1) throws Throwable {
		try {
			log.debug("Verify " + arg1 + " page is loading");
			SetElements.verifyPageLoad("//h1[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully loaded " + arg1 + " page");
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_" + arg1, Constants.IMAGE_LOCATION,
					"iPay\\Mer_Rela\\Mer_Curr_Mgmt\\");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}
	
	@Before(value="@MerCurrMgmt")
	public void Feature_Glb_Sett_Mgmt() throws InterruptedException{
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: Feature File for Merchant Currency Management");
	}

}
