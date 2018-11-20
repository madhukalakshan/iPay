package com.ib.cucumber.definition.icore;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class iCoreMerchMgmt {
	String sMessage = "";
	WebDriver webDriver = null;
	private WebDriverInitializer webDriverInitializer = null;
	private static String sCreatedMerchantID = null;
	private static boolean bAddMerchantCreated = false;
	private static boolean bCloseMerchantCreated = false;
	private static boolean bDeleteMerchantCreated = false;
	public static String merchantID = "001410000003401";
	Logger log = Logger.getLogger("LOG");

	public iCoreMerchMgmt(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	// --add merchant

	@Then("^I should enter merchant details in \"([^\"]*)\"$")
	public void i_should_enter_merchant_details_in(String arg1, DataTable table) throws Throwable {
		List<List<String>> Carddata = table.raw();
		log.debug("Verify enter merchant details");
		int i = 0;
		while (i < 2) {
			try {
				SetElements.SelectNamedDropDownByValue(Carddata.get(1).get(0), Carddata.get(1).get(1));
				SetElements.SelectNamedDropDownByValue(Carddata.get(2).get(0), Carddata.get(2).get(1));
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(3).get(1), Carddata.get(3).get(0));
				Thread.sleep(2000);
				// SetElements.SelectNamedDropDownByValue(Carddata.get(4).get(0),
				// Carddata.get(4).get(1));
				// Thread.sleep(2000);
				SetElements.clickElementByName("MercAcctOpt");
				Thread.sleep(1000);
				try {
					SetElements.selectByPartOfVisibleText("MercAcctNo", IcoreAccountMgmt.merchantAcounNumber);
				} catch (Exception e) {
					SetElements.SelectNamedDropDownByIndex("MercAcctNo", 1);
				}
				try {
					SetElements.selectByPartOfVisibleText("CommAcctNo", IcoreAccountMgmt.merchantCommisionAcounNumber);
				} catch (Exception e) {
					SetElements.SelectNamedDropDownByIndex("CommAcctNo", 1);
				}
				try {
					SetElements.selectByPartOfVisibleText("ChrgAcctNo", IcoreAccountMgmt.merchantCommisionAcounNumber);
				} catch (Exception e) {
					SetElements.SelectNamedDropDownByIndex("ChrgAcctNo", 1);
				}
				i = i + 2;
				log.debug("Successfully entered merchant details");

			} catch (Exception e1) {
				i++;
				log.debug("Try to enter merchant details again in " + arg1);
				log.error("Error:", e1);
				if (i == 2)
					throw (e1);
			}
		}
		WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter++ + "_" + arg1, Constants.IMAGE_LOCATION,
				SetElements.setScreenShotPath(arg1)[0]);
	}

	@And("^I Click on Add Account Button$")
	public void i_Click_on_Add_Account_Button() throws Throwable {
		try {
			log.debug("Verify click on Add Account Button");
			JavascriptExecutor jse = (JavascriptExecutor) webDriver;
			jse.executeScript("window.scrollBy(0,300)", "");
			WebElement e = webDriver.findElement(By.xpath("//input[@value='Add']"));
			Thread.sleep(2000);
			e.click();
			log.debug("Successfully click on Add Account Button");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I modify merchant contact details for \"([^\"]*)\"$")
	public void i_modify_merchant_contact_details_for(String arg1, DataTable table) throws Throwable {
		try {
			log.debug("Verify modify merchant contact details");
			List<List<String>> Carddata = table.raw();
			String function = arg1.replaceAll("\\s", "").toLowerCase();
			if (function.equals("onbording")) {
				try {
					SetElements.selectByPartOfVisibleText("MercAcctNo", IcoreAccountMgmt.merchantAcounNumber);
				} catch (Exception e) {
					SetElements.SelectNamedDropDownByIndex("MercAcctNo", 1);
				}
				try {
					SetElements.selectByPartOfVisibleText("CommAcctNo", IcoreAccountMgmt.merchantCommisionAcounNumber);
				} catch (Exception e) {
					SetElements.SelectNamedDropDownByIndex("CommAcctNo", 1);
				}
				try {
					SetElements.selectByPartOfVisibleText("ChrgAcctNo", IcoreAccountMgmt.merchantCommisionAcounNumber);
				} catch (Exception e) {
					SetElements.SelectNamedDropDownByIndex("ChrgAcctNo", 1);
				}
			}

			SetElements.SelectNamedDropDownByValue(Carddata.get(1).get(0), Carddata.get(1).get(1));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(2).get(1), Carddata.get(2).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(3).get(1), Carddata.get(3).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(4).get(1), Carddata.get(4).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(5).get(1), Carddata.get(5).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(6).get(1), Carddata.get(6).get(0));
			SetElements.SelectNamedDropDownByValue(Carddata.get(7).get(0), Carddata.get(7).get(1));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(8).get(1), Carddata.get(8).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(9).get(1), Carddata.get(9).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(10).get(1), Carddata.get(10).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(11).get(1), Carddata.get(11).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(12).get(1), Carddata.get(12).get(0));
			SetElements.SelectNamedDropDownByValue(Carddata.get(13).get(0), Carddata.get(13).get(1));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(14).get(1), Carddata.get(14).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(15).get(1), Carddata.get(15).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(16).get(1), Carddata.get(16).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(17).get(1), Carddata.get(17).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(18).get(1), Carddata.get(18).get(0));
			SetElements.SelectNamedDropDownByValue(Carddata.get(19).get(0), Carddata.get(19).get(1));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(20).get(1), Carddata.get(20).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(21).get(1), Carddata.get(21).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(22).get(1), Carddata.get(22).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(23).get(1), Carddata.get(23).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(24).get(1), Carddata.get(24).get(0));

			log.debug("Successfully modified merchant contact details");

		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	// --reject merchant

	@When("^I fill the Merchant Details")
	public void i_fill_the_Merchant_Details(DataTable table) throws Throwable {

		try {
			log.debug("Verify fill the Merchant Details");
			List<List<String>> Carddata = table.raw();
			log.debug("Carddata.size()"+Carddata.size());
			for (int i = 1; i < Carddata.size(); i++) {
				if (Carddata != null && Carddata.size() > 1 && Carddata.get(i).get(0) != null) {
					SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(i).get(1), Carddata.get(i).get(0));
					log.debug("Successfully verified fill the Merchant Details");
				} else if (sCreatedMerchantID != null && sCreatedMerchantID.length() > 1) {
					SetElements.setElementByName(Constants.TYPE_TEXT, sCreatedMerchantID, "MercId");
				} else {
					log.debug("Merchant Creation or User input invaild ");
					assertTrue("Merchant Creation or User input invaild,Unable complete the request", false);
				}
			}
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I Check if Merchant exists$")
	public void i_Check_if_MCG_exists() throws Throwable {
		try {
			log.debug("Verify merchant is exist");
			if (SetElements.extractMessageFromTable("No Records Found"))
				assertTrue("Merchant not Found,Unable complete the request", false);
			log.debug("Successfully verified merchant is exist");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@And("^I retrive generated merchant id for \"([^\"]*)\"$")
	public void i_retrive_generated_merchant_id_for(String sMode, DataTable table) throws Throwable {
		try {

			log.debug("Verify retrive generated merchant id");
			List<List<String>> Carddata = table.raw();
			sCreatedMerchantID = SetElements.extractValueFromMessageString(Carddata.get(1).get(1), "");
			log.debug("Retrieved Merchant ID from Merchant creation : " + sCreatedMerchantID);

			if ("ADD".equals(sMode)) {
				bAddMerchantCreated = true;
				log.debug("Merchant added for deletion ");
			} else if ("CLOSE".equals(sMode)) {
				bCloseMerchantCreated = true;
				log.debug("Merchant added for testing close function ");
			} else {
				bDeleteMerchantCreated = true;
				log.debug("Merchant added for testing other functions");
			}
			log.debug("Successfully Verified retrive generated merchant id");

		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I Click the \"([^\"]*)\" icon in Merchant Management$")
	public void i_Click_the_icon_in_Merchant_Management(String arg1) throws Throwable {
		try {
			log.debug("Verify click the " + arg1 + " icon");
			SetElements.clickElementByXpath("//label[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully clicked the " + arg1 + " icon");
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_" + arg1, Constants.IMAGE_LOCATION,
					"iCore\\Mer_Mgmt\\Mer_Mgmt\\");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I should see the \"([^\"]*)\" page in Merchant Management$")
	public void i_should_see_the_page_in_Merchant_Management(String arg1) throws Throwable {
		try {
			log.debug("Verify " + arg1 + " page is loading");
			SetElements.verifyPageLoad("//h1[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully loaded " + arg1 + " page");
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_" + arg1, Constants.IMAGE_LOCATION,
					"iCore\\Mer_Mgmt\\Mer_Mgmt\\");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@Before(value = "@Mer")
	public void Feature_Commission_product() {
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter = 1;
		log.debug("Feature: iCore Merchant Maintenance");
	}

	@Before(value = "@OnboardingMerMgmt")
	public void FeatureOnboardingMerMgmt() {
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter = 100;
		log.debug("Feature: iCore Merchant Management for created merchant by Onboarding");
	}

	@Then("^I should see the Success message as \"([^\"]*)\" for Merchant Added$")
	public void i_should_see_the_Success_message_as_for_Merchant_Added(String arg1) throws Throwable {
		try {
			log.debug("Verify success message: " + arg1);
			merchantID = SetElements.getID();
			log.debug("Merchan ID: " + merchantID);
			if (!SetElements.extractMessageFromListElement(arg1))
				assertTrue(arg1 + " Message not shown, No Success Message", false);
			log.debug("Successfully verified: " + arg1);
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_Merchant Account",
					Constants.IMAGE_LOCATION, "iCore\\Mer_Mgmt\\Mer_Mgmt\\");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}
}
