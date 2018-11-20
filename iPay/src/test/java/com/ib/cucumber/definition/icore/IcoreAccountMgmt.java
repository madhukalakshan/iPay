package com.ib.cucumber.definition.icore;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.DbManager;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class IcoreAccountMgmt {

	WebDriver webDriver = null;
	private WebDriverInitializer webDriverInitializer = null;
	public static String merchantAcounNumber="0000036035240000057278";
	public static String merchantCommisionAcounNumber="0000036045240000057284";
	Logger log = Logger.getLogger("LOG");

	public IcoreAccountMgmt(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	@And("^I fill the account Creation form for Account Type \"([^\"]*)\"$")
	public void i_fill_the_account_Creation_form_for_Account_Type(String accountType, DataTable table)
			throws Throwable {
		List<List<String>> Carddata = table.raw();
		try {
			log.debug("Verify fill account Creation form");
			if ("MERC".equals(accountType)) {
				Thread.sleep(1000);
				try{
					log.debug("Select from dropdown: "+Carddata.get(1).get(1));
					SetElements.SelectNamedDropDownByValue(Carddata.get(1).get(0), Carddata.get(1).get(1));
				}catch(Exception e){
					log.debug("Select from dropdown from Index");
					SetElements.SelectNamedDropDownByIndex(Carddata.get(1).get(0), 1);
				}
				Thread.sleep(2000);
				SetElements.SelectNamedDropDownByValue(Carddata.get(2).get(0), Carddata.get(2).get(1));
				SetElements.SelectNamedDropDownByValue(Carddata.get(3).get(0), Carddata.get(3).get(1));
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(4).get(1), Carddata.get(4).get(0));
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(5).get(1), Carddata.get(5).get(0));
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(6).get(1), Carddata.get(6).get(0));
				SetElements.SelectNamedDropDownByValue(Carddata.get(7).get(0), Carddata.get(7).get(1));
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(8).get(1), Carddata.get(8).get(0));
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(9).get(1), Carddata.get(9).get(0));
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(10).get(1), Carddata.get(10).get(0));
				SetElements.SelectNamedDropDownByValue(Carddata.get(11).get(0), Carddata.get(11).get(1));
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(12).get(1), Carddata.get(12).get(0));

			} else {
				Thread.sleep(1000);
				try{
					log.debug("Select from dropdown: "+Carddata.get(1).get(1));
					SetElements.SelectNamedDropDownByValue(Carddata.get(1).get(0), Carddata.get(1).get(1));
				}catch(Exception e){
					log.debug("Select from dropdown from Index");
					SetElements.SelectNamedDropDownByIndex(Carddata.get(1).get(0), 1);
				}
				Thread.sleep(1000);
				SetElements.SelectNamedDropDownByValue(Carddata.get(2).get(0), Carddata.get(2).get(1));
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(3).get(1), Carddata.get(3).get(0));
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(4).get(1), Carddata.get(4).get(0));
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(5).get(1), Carddata.get(5).get(0));
				SetElements.SelectNamedDropDownByValue(Carddata.get(6).get(0), Carddata.get(6).get(1));
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(7).get(1), Carddata.get(7).get(0));
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(8).get(1), Carddata.get(8).get(0));
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(9).get(1), Carddata.get(9).get(0));
				SetElements.SelectNamedDropDownByValue(Carddata.get(10).get(0), Carddata.get(10).get(1));
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(11).get(1), Carddata.get(11).get(0));
			}
			log.debug("Successfully filled account Creation form");

		} catch (Exception e1) {
			log.error("Error:", e1);
			throw (e1);
		}

	}

	@Then("^I should see the Success message as \"([^\"]*)\" for Merchant Account Added$")
	public void i_should_see_the_Success_message_as_for_Merchant_Account_Added(String arg1) throws Throwable {
		try {
			log.debug("Verify success message: " + arg1);
			merchantAcounNumber = SetElements.getID();
			log.debug("merchantAcounNumber is:"+merchantAcounNumber);
			if (!SetElements.extractMessageFromListElement(arg1))
				assertTrue(arg1 + " Message not shown, No Success Message", false);
			log.debug("Successfully verified: " + arg1);
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_Merchant Account",
					Constants.IMAGE_LOCATION, "iCore\\Acc_Mgmt\\Acc_Mgmt\\");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}
	
	@Then("^I should see the Success message as \"([^\"]*)\" for Merchant Commission Account Added$")
	public void i_should_see_the_Success_message_as_for_Merchant_Commission_Account_Added(String arg1) throws Throwable {
		try {
			log.debug("Verify success message: " + arg1);
			merchantCommisionAcounNumber = SetElements.getID();
			log.debug("merchantCommisionAcounNumber is:"+merchantCommisionAcounNumber);
			if (!SetElements.extractMessageFromListElement(arg1))
				assertTrue(arg1 + " Message not shown, No Success Message", false);
			log.debug("Successfully verified: " + arg1);
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_Merchant Commission Account",
					Constants.IMAGE_LOCATION, "iCore\\Acc_Mgmt\\Acc_Mgmt\\");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@When("^I fill Merchant Account to Account Number TextBox$")
	public void i_fill_Merchant_Account_to_Account_Number_TextBox() throws Throwable {
		try {
			log.debug("Verify fill Merchant Account Number");
			if (merchantAcounNumber != null && merchantAcounNumber.length() > 1) {
				webDriver.findElement(By.name("AcctNo")).sendKeys(merchantAcounNumber);
				log.debug("Successfully filled Merchant Account Number");
			} else {
				log.debug("Account approvel done without merchant account number input");
			}

		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}

	}

	@When("^I fill Merchant Commission Account to Account Number TextBox$")
	public void i_fill_Merchant_Commission_Account_to_Account_Number_TextBox() throws Throwable {
		try {
			log.debug("Verify fill Merchant Commision Account Number");
			if (merchantCommisionAcounNumber != null && merchantCommisionAcounNumber.length() > 1) {
				webDriver.findElement(By.name("AcctNo")).sendKeys(merchantCommisionAcounNumber);
				log.debug("Successfully filled Merchant Commision Account Number");
			} else {
				log.debug("Account approvel done without merchant commision account number input");
			}

		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}

	}

	// - Reapply account

	@Then("^I fill ReApply Account  edit form$")
	public void i_fill_ReApply_Account_edit_form(DataTable table) throws Throwable {

		try {
			List<List<String>> Carddata = table.raw();
			log.debug("Verify fill ReApply Account  edit form");
			if (Carddata != null && Carddata.size() > 1 && Carddata.get(1).get(0) != null) {
				log.debug("Expecting this to be currency set option for loyalty accounts");
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(1).get(1), Carddata.get(1).get(0));
				log.debug("Successfully filled ReApply Account  edit form");
			} else {
				log.debug("Not changing any data in account reapply");
			}

		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Then("^I verify \"([^\"]*)\" status \"([^\"]*)\"$")
	public void i_verify_status(String arg1,String arg2) throws Throwable {
		try{
			DbManager ver = new DbManager();
			boolean isPassed = false;
			log.debug("Verify DB validation method");
			String query="";
			switch(arg1){
			case "Merchant Account":
				query="SELECT COUNT(*) FROM BKN_DM_ACCT WHERE ACCOUNT_TYPE='MERC' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE='"+arg2+"' and account_number='"+merchantAcounNumber+"'";
			    break;
			case "Commission Account":
				query="SELECT COUNT(*) FROM BKN_DM_ACCT WHERE ACCOUNT_TYPE='CMSN' AND ADDED_BY='MADHUKA' AND BANK_CODE='0001' AND STATUS_CODE='"+arg2+"' and account_number='"+merchantCommisionAcounNumber+"'";
			    break;
			}
			isPassed = ver.verfyDb("ICORE", query,"1");
			assertTrue("Query Result Does Not Matched to Expected Count.",isPassed);
			log.debug("Successfully verified DB validation method");
		}catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}
	
	@Before(value="@MerAcc")
	public void Feature_Merchant_Account(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: iCore Account Management(Merchant Account)");
	}
	
	@Before(value="@CommAcc")
	public void Feature_Commission_Account(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: iCore Account Management(Commission Account)");
	}


}
