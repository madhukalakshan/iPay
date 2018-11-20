package com.ib.cucumber.definition.ipay;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

import java.io.*;
import java.util.*;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.ConfigFileReader;
import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.DbManager;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.dto.iadmin.LoginFormDto;
import com.ib.cucumber.pageobject.WebPageObject;

public class iPayPHPClient {
	LoginFormDto loginForm = null;
	private WebDriverInitializer webDriverInitializer;
	ConfigFileReader configFileReader;
	WebDriver webDriver = null;
	public static String MerchantReferenceIDOne = "4661788";
	public static String MerchantReferenceIDTwo = "5839344";
	public static String MerchantReferenceIDThree = "5839344";
	public static String onboardMerchantID = "001080001003818";
	Logger log = Logger.getLogger("LOG");

	public iPayPHPClient(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
		configFileReader= new ConfigFileReader();
	}

	@Given("^I Modify MerchantId for \"([^\"]*)\"$")
	public void i_Modify_MerchantId_for(String arg1, DataTable table) throws Throwable {
		log.debug("Verify modify MerchantId");
		String function = arg1.replaceAll("\\s", "").toLowerCase();
		log.debug("Function is :"+function);
		List<List<String>> Tableraw = table.raw();
		String queryOne = null;
		DbManager ver = new DbManager();
		boolean isUpdated=false;
		try {
			if (function.equals("onboarding")) {
				isUpdated=true;
				queryOne = "SELECT MERCHANT_ID FROM IPG_MERCHANT WHERE MERCHANT_NAME='" + Tableraw.get(1).get(1) + "'";
				log.debug("Query one:"+queryOne);
				File file = new File(Constants.WAMPSERVER_PATH + "www\\"+configFileReader.getOnboardingPHPClient()+"\\ipay-express-checkout\\ipayExpAPI.php");
				onboardMerchantID = ver.geDbValue("IPG", queryOne,"MERCHANT_ID");
				log.debug("Onboard Merchant  id:" + onboardMerchantID);
				CommonSteps.modifyText(Tableraw.get(1).get(0), onboardMerchantID, file);
			} 
			if(function.equals("inapp")){
				isUpdated=true;
				File file = new File(Constants.WAMPSERVER_PATH + "www\\"+configFileReader.getInAppClient()+"\\ipayExpAPI.php");
				CommonSteps.modifyText(Tableraw.get(1).get(0), Tableraw.get(1).get(1), file);
			}
			else {
				if(!isUpdated){
					File file = new File(Constants.WAMPSERVER_PATH + "www\\"+configFileReader.getPHPClient()+"\\ipay-express-checkout\\ipayExpAPI.php");
					CommonSteps.modifyText(Tableraw.get(1).get(0), Tableraw.get(1).get(1), file);
				}
			}
			log.debug("Successfully modified MerchantId");
		} catch (Exception e) {
			try {
				if (function.equals("onboarding")) {
					isUpdated=true;
					queryOne = "SELECT MERCHANT_ID FROM IPG_MERCHANT WHERE MERCHANT_NAME='" + Tableraw.get(1).get(1)+ "'";
					onboardMerchantID = ver.geDbValue("IPG", queryOne,"MERCHANT_ID");
					File file = new File(Constants.WAMPSERVER_PATH64 + "www\\"+configFileReader.getOnboardingPHPClient()+"\\ipay-express-checkout\\ipayExpAPI.php");
					log.debug("Onboard Merchant  id:" + onboardMerchantID);
					CommonSteps.modifyText(Tableraw.get(1).get(0), onboardMerchantID, file);
				} 
				if(function.equals("inapp")){
					isUpdated=true;
					File file = new File(Constants.WAMPSERVER_PATH64 + "www\\"+configFileReader.getInAppClient()+"\\ipayExpAPI.php");
					CommonSteps.modifyText(Tableraw.get(1).get(0), Tableraw.get(1).get(1), file);
				}
				else {
					if(!isUpdated){
						File file = new File(Constants.WAMPSERVER_PATH64 + "www\\"+configFileReader.getPHPClient()+"\\ipay-express-checkout\\ipayExpAPI.php");
						CommonSteps.modifyText(Tableraw.get(1).get(0), Tableraw.get(1).get(1), file);
					}
				}
				log.debug("Successfully modified MerchantId");
			} catch (Exception e1) {
				log.error("Error:", e1);
				throw (e1);
			}
		}
	}

	@Given("^I modify Key value for \"([^\"]*)\"$")
	public void i_modify_Key_value_for(String arg1) throws Throwable {
		String function = arg1.replaceAll("\\s", "").toLowerCase();
		boolean isUpdated=false;
		try {
			log.debug("Verify modify Key value");
			if (function.equals("onboarding")) {
				isUpdated=true;
				File file = new File(Constants.WAMPSERVER_PATH + "www\\"+configFileReader.getOnboardingPHPClient()+"\\ipay-express-checkout\\ipayExpAPI.php");
				CommonSteps.modifyText("$Key", AddMerchantAPIDetails.onboardingApiKeyValue, file);
			} 
			if(function.equals("inapp")){
				isUpdated=true;
				File file = new File(Constants.WAMPSERVER_PATH + "www\\"+configFileReader.getInAppClient()+"\\ipayExpAPI.php");
				CommonSteps.modifyText("$Key", AddMerchantAPIDetails.apiKeyValue, file);
			}
			else {
				if(!isUpdated){
					File file = new File(Constants.WAMPSERVER_PATH + "www\\"+configFileReader.getPHPClient()+"\\ipay-express-checkout\\ipayExpAPI.php");
					CommonSteps.modifyText("$Key", AddMerchantAPIDetails.apiKeyValue, file);
				}
			}
			log.debug("Successfully modified Key value for " + arg1);
		} catch (Exception e) {
			try {
				if (function.equals("onboarding")) {
					File file = new File(Constants.WAMPSERVER_PATH64 + "www\\"+configFileReader.getOnboardingPHPClient()+"\\ipay-express-checkout\\ipayExpAPI.php");
					CommonSteps.modifyText("$Key", AddMerchantAPIDetails.onboardingApiKeyValue, file);
				}
				if(function.equals("inapp")){
					isUpdated=true;
					File file = new File(Constants.WAMPSERVER_PATH64 + "www\\"+configFileReader.getInAppClient()+"\\ipayExpAPI.php");
					CommonSteps.modifyText("$Key", AddMerchantAPIDetails.apiKeyValue, file);
				}
				else {
					if(!isUpdated){
						File file = new File(Constants.WAMPSERVER_PATH64 + "www\\"+configFileReader.getPHPClient()+"\\ipay-express-checkout\\ipayExpAPI.php");
						CommonSteps.modifyText("$Key", AddMerchantAPIDetails.apiKeyValue, file);
					}
				}
				log.debug("Successfully modified Key value for " + arg1);
			} catch (Exception e1) {
				log.error("Error:", e1);
				throw (e1);
			}
		}
	}

	@Given("^I am at Shopping Cart page for \"([^\"]*)\"$")
	public void i_am_at_Shopping_Cart_page_for(String arg1) throws Throwable {
		String function = arg1.replaceAll("\\s", "").toLowerCase();
		try {
			log.debug("Verify whether page url is loading");
			webDriver = webDriverInitializer.getDriver();
			WebPageObject page = new WebPageObject(webDriver);
			loginForm = new LoginFormDto(webDriver);
			if (function.equals("onboarding")) {
				page.navigateToWebPage(configFileReader.getOnboardingPHPClientUrl());
			} else {
				page.navigateToWebPage(configFileReader.getPHPClientUrl());
			}
			log.debug("Successfully loaded page url");
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_Shopping Cart page",
					Constants.IMAGE_LOCATION, "iPay\\PHP_Client\\");

		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Given("^I Click on \"([^\"]*)\" link in Shopping Cart$")
	public void i_Click_on_link_in_Shopping_Cart(String arg1) throws Throwable {
		try {
			log.debug("Verify click on " + arg1 + " link in Shopping Cart");
			SetElements.clickElementByXpath("//a[contains(text(), '" + arg1 + "')]");
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_Click " + arg1 + " link",
					Constants.IMAGE_LOCATION, "iPay\\PHP_Client\\");
			log.debug("Successfully clicked on " + arg1 + " link in Shopping Cart");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I Select the \"([^\"]*)\" Payment Type$")
	public void i_Select_the_Payment_Type(String arg1) throws Throwable {
		try {
			log.debug("Verify select the " + arg1 + " Payment Type");
			Thread.sleep(5000);
			SetElements.clickElementByXpath("//input[@value='" + arg1 + "']");
			WebPageObject.getScreenShots(webDriver,
					CommonSteps.iImageCounter() + "_select the " + arg1 + " Payment Type", Constants.IMAGE_LOCATION,
					"iPay\\PHP_Client\\");
			log.debug("Successfully selected the " + arg1 + " Payment Type");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}

	}

	@Then("^I should see \"([^\"]*)\" transaction status to void$")
	public void i_should_see_transaction_status_to_void(String arg1) throws Throwable {
		webDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
		Boolean trxnStatus;
		String trxnStatusText = "";
		log.debug("Verify Transaction Status");
		try {
			MerchantReferenceIDOne = webDriver
					.findElement(By.xpath("//div[@class='view-cart']/table/tbody/tr[4]/td[3]")).getText();
			log.debug("MerchantRefarenceIDOne is : " + MerchantReferenceIDOne);
			trxnStatusText = webDriver.findElement(By.xpath("//div[@class='view-cart']/table/tbody/tr[6]/td[3]"))
					.getText();
			log.debug("trxnStatusText: " + trxnStatusText);
			trxnStatus = (trxnStatusText.contains("ACCEPTED") ? true : false);
			log.debug("trxnStatus: " + trxnStatus);
			Assert.assertTrue(trxnStatus);
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_transaction status",
					Constants.IMAGE_LOCATION, "iPay\\PHP_Client\\");
			log.debug("Successfully verified Transaction Status");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@Then("^I should see \"([^\"]*)\" transaction status to refund$")
	public void i_should_see_transaction_status_to_refund(String arg1) throws Throwable {
		webDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
		Boolean trxnStatus;
		String trxnStatusText = "";
		log.debug("Verify Transaction Status");
		try {
			MerchantReferenceIDTwo = webDriver
					.findElement(By.xpath("//div[@class='view-cart']/table/tbody/tr[4]/td[3]")).getText();
			trxnStatusText = webDriver.findElement(By.xpath("//div[@class='view-cart']/table/tbody/tr[6]/td[3]"))
					.getText();
			log.debug("trxnStatusText: " + trxnStatusText);
			trxnStatus = (trxnStatusText.contains("ACCEPTED") ? true : false);
			log.debug("trxnStatus: " + trxnStatus);
			Assert.assertTrue(trxnStatus);
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_transaction status",
					Constants.IMAGE_LOCATION, "iPay\\PHP_Client\\");
			log.debug("Successfully verified Transaction Status");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@Then("^I should see \"([^\"]*)\" transaction status to clear$")
	public void i_should_see_transaction_status_to_clear(String arg1) throws Throwable {
		webDriver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
		Boolean trxnStatus;
		String trxnStatusText = "";
		log.debug("Verify Transaction Status");
		try {
			MerchantReferenceIDThree = webDriver
					.findElement(By.xpath("//div[@class='view-cart']/table/tbody/tr[4]/td[3]")).getText();
			trxnStatusText = webDriver.findElement(By.xpath("//div[@class='view-cart']/table/tbody/tr[6]/td[3]"))
					.getText();
			log.debug("trxnStatusText: " + trxnStatusText);
			trxnStatus = (trxnStatusText.contains("ACCEPTED") ? true : false);
			log.debug("trxnStatus: " + trxnStatus);
			Assert.assertTrue(trxnStatus);
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_transaction status",
					Constants.IMAGE_LOCATION, "iPay\\PHP_Client\\");
			log.debug("Successfully verified Transaction Status");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@Then("^I close the Shopping Cart page$")
	public void i_close_the_Shopping_Cart_page() throws Throwable {
		try {
			log.debug("Verify close the Shopping Cart page");
			webDriver.quit();
			WebDriverInitializer.initialized = false;
			log.debug("Successfully closed the Shopping Cart page");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Before(value = "@PHPClient")
	public void FeaturePHPClient() {
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter = 1;
		log.debug("Feature: Feature File for iPay PHP Client");
	}
	
	@Before(value = "@PHPClientOnboarding")
	public void FeaturePHPClientOnboarding() {
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter = 50;
		log.debug("Feature: Feature File for PHP Client to Onboarding");
	}

}