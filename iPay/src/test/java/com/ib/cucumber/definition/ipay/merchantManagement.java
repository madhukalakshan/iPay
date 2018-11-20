package com.ib.cucumber.definition.ipay;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.*;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.definition.icore.IcoreAccountMgmt;
import com.ib.cucumber.definition.icore.iCoreMerchMgmt;
import com.ib.cucumber.dto.ipay.merchantMangmentDto;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.*;

public class merchantManagement {
	private WebDriverInitializer webDriverInitializer;
	WebDriver webDriver = null;
	Logger log = Logger.getLogger("LOG");

	public merchantManagement(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
		webDriver.manage().window().maximize();
	}

	@Given("^I fill the Add_Merchant form$")
	public void i_fill_the_Add_Merchant_form(DataTable table) throws Throwable {
		log.debug("Verify fill the Add_Merchant form");
		merchantMangmentDto merchManDto = new merchantMangmentDto(webDriver);
		List<List<String>> Prodcutdata = table.raw();
		int i = 0;
		
		try{
			
			merchManDto.setMerchant_id(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setBusiness_type_id(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMerchent_code(iCoreMerchMgmt.merchantID, "merchent_code");
			merchManDto.setUrl(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setDate_of_application_d(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setDate_of_application_m(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setDate_of_application_d(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setAccount_manager(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setSuccess_static_return_link(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setFail_static_return_link(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setDo_credit_pre_auth(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setCustom_payment_screens(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setAuto_settle_txn(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setAllow_sale_transaction_without_pages(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setAllow_mobile_transactions(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setCapture_billing_address(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setShow_captcha(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setInapp_payment(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setTxn_ref_num_uniqueness_period(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setFixed_service_fee_period(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setFixed_service_fee_amount(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setFixed_service_fee_currency(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setFixed_service_fee_account(IcoreAccountMgmt.merchantCommisionAcounNumber, "fixed_service_fee_account");
			merchManDto.setMerchant_multi_purpose_1(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMerchant_multi_purpose_2(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMerchant_multi_purpose_3(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMerchant_multi_purpose_4(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMerchant_multi_purpose_5(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMerchant_multi_purpose_6(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMerchant_multi_purpose_7(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMerchant_multi_purpose_8(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMerchant_multi_purpose_9(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMerchant_multi_purpose_10(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMerchant_multi_purpose_11(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMerchant_multi_purpose_12(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));

			merchManDto.setProduct_code(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			
			merchManDto.setBin_length(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setBin(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setBank_code(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setBank_name(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setIss_country_code(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setCard_no_length(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));

			merchManDto.setCurrency_code(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setProduct_terminal_id(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setGlobal_limit_category(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMerchant_account_number(IcoreAccountMgmt.merchantAcounNumber, "merchant_account_number");

			merchManDto.setPer_sale_txn_limit_alwd(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setPer_sale_txn_limit_value(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setDaily_sale_txn_limit_alwd(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setDaily_sale_txn_limit_value(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMonthly_sale_txn_limit_alwd(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMonthly_sale_txn_limit_value(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setDebit_void_alwd(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setCredit_card_void_alwd(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setDebit_refund_alwd(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setCredit_card_refund_alwd(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setPer_refund_txn_limit_alwd(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setPer_refund_txn_limit_value(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setDaily_refund_txn_limit_alwd(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setDaily_refund_txn_limit_value(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMonthly_refund_txn_limit_alwd(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setMonthly_refund_txn_limit_value(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setOff_us_credit_card_alwd(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setPlain_text_txn_req_alwd(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setVoid_allowed_period_alwd(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setVoid_allowed_period_value(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setRefund_allowed_period_alwd(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setRefund_allowed_period_value(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setClearance_allowed_period_alwd(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			merchManDto.setClearance_allowed_period_value(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));

			merchManDto.setLanguage_code(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			log.debug("Successfully filled the Add_Merchant form");
		}catch(Exception e){
			log.error("Error:", e);
			throw (e);
		}
	}

	@Given("^I fill the Search_Merchant form$")
	public void i_fill_the_Search_Merchant_form(DataTable table) throws Throwable {
		try{
			log.debug("Verify fill the Search_Merchant form");
			merchantMangmentDto merchManDto = new merchantMangmentDto(webDriver);
			List<List<String>> Prodcutdata = table.raw();
			for(int i = 0;i<Prodcutdata.size()-1;i++)
				merchManDto.setMerchant_id(Prodcutdata.get(++i).get(1), Prodcutdata.get(i).get(0));
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter()+"_Search_Merchant forms",
					Constants.IMAGE_LOCATION,"iPay\\Mer_Rela\\Mer_Mgmt\\");
			log.debug("Successfully filled the Search_Merchant form");
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
		
	}
	
	@And("^I Click the \"([^\"]*)\" icon to ipay Merchant Management$")
	public void i_Click_the_icon_to_ipay_Merchant_Management(String arg1) throws Throwable {
		log.debug("Verify click the " + arg1 + " icon");
		String xPath="//label[contains(text(),'" + arg1 + "')]";
		try {
			SetElements.waitElementClickableByXpath(xPath);
			SetElements.clickElementByXpath(xPath);
		} catch (Exception e) {
			try{
				Thread.sleep(2000);
				log.debug("Try to click on icon again");
				SetElements.clickElementByXpath(xPath);
			}catch (Exception e1) {
				log.error("Error:", e1);
				throw (e);
			}
		}
		log.debug("Successfully clicked the " + arg1 + " icon");
		WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_"+arg1,
				Constants.IMAGE_LOCATION, "iPay\\Mer_Rela\\Mer_Mgmt\\");
	}

	@Then("^I should see the \"([^\"]*)\" page to ipay Merchant Management$")
	public void i_should_see_the_page_to_ipay_Merchant_Management(String arg1) throws Throwable {
		try {
			log.debug("Verify " + arg1 + " page is loading");
			SetElements.verifyPageLoad("//h1[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully loaded " + arg1 + " page");
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_"+arg1,
					Constants.IMAGE_LOCATION, "iPay\\Mer_Rela\\Mer_Mgmt\\");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}
	
	@Then("^I Check for Success Message \"([^\"]*)\" in ipay \"([^\"]*)\"$")
	public void i_Check_for_Success_Message_in_ipay(String arg1, String arg2) throws Throwable {
		try {
			log.debug("Verify success message: " +arg1+" in ipay "+ arg2);
			if (!SetElements.extractMessageFromListElement(arg1))
				assertTrue(arg1 + " Message not shown, No Success Message", false);
			log.debug("Successfully verified: " +arg1+" in ipay "+arg2);
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_"+arg2,
					Constants.IMAGE_LOCATION, "iPay\\Mer_Rela\\Mer_Mgmt\\");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@Then("^I click on \"([^\"]*)\" icon to back ipay Merchant Management$")
	public void i_click_on_icon_to_back_ipay_Merchant_Management(String arg1) throws Throwable {
		try {
			log.debug("Verify click on " + arg1 + " icon to back");
			SetElements.clickElementByXpath("//div[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully clicked on " + arg1 + " icon to back");
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter()+"_"+arg1,
					Constants.IMAGE_LOCATION,"iPay\\Mer_Rela\\Mer_Mgmt\\");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Then("^I Enter the Comment \"([^\"]*)\" in \"([^\"]*)\"$")
	public void i_Enter_the_Comment_in_ipay(String arg1, String arg2,DataTable table) throws Throwable {
		try {
			Thread.sleep(1000);
			SetElements.scrolldown();
			List<List<String>> data = table.raw();
			log.debug("Verify enter the Comment in "+arg2);
			for (int i = 1; i < data.size(); i++) {
				String option = data.get(i).get(1).toLowerCase();
				switch (option) {
				case "id":
					SetElements.setElement(Constants.TYPE_TEXT, arg1, data.get(i).get(0));
					break;
				case "name":
					SetElements.setElementByName(Constants.TYPE_TEXT, arg1, data.get(i).get(0));
					break;
				case "xpath":
					SetElements.setElementByXpath(Constants.TYPE_TEXT, arg1, data.get(i).get(0));
					break;
				}
			}
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter()+"_Enter comment in "+arg2,
					Constants.IMAGE_LOCATION, SetElements.setScreenShotPath(arg2)[0]);
			log.debug("Successfully entered the comment in "+ arg1);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Then("^I Click on Button \"([^\"]*)\" in ipay \"([^\"]*)\"$")
	public void i_Click_on_Button_in_ipay(String arg1, String arg2) throws Throwable {
		try {
			SetElements.scrolldown();
			log.debug("Verify click on " + arg1 + " Button in ipay "+arg2);
			SetElements.clickElementById(arg1);
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter()+"_"+arg2,
					Constants.IMAGE_LOCATION,"iPay\\Mer_Rela\\Mer_Mgmt\\");
			log.debug("Successfully clicked on " + arg1 + " Button in pay "+arg2);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Before(value="@iPayMerMgmt")
	public void Feature_Glb_Sett_Mgmt() throws InterruptedException{
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: Feature File for Merchant Management");
	}

}
