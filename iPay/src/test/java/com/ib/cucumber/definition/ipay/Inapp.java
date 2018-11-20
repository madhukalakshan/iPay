package com.ib.cucumber.definition.ipay;

import static org.junit.Assert.assertTrue;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Assert;
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
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

public class Inapp {

	WebDriver webDriver;
	private WebDriverInitializer webDriverInitializer = null;
	Logger log = Logger.getLogger("LOG");
	public static String walletID = "7112a195-ee28-4ef4-b4a9-3953e04aee9f";
	public static String transactionRefid="2222222";
	public static String transactionid="3333333";
	public static String cardRefid="02f71987-de1c-4ea9-99ae-ed2e29ec25c2";
	public static String activationCode="1122";
	public static ArrayList<String> saveValue = new ArrayList<String>();

	public Inapp(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	@Given("^I fill \"([^\"]*)\" in \"([^\"]*)\"$")
	public void i_fill_in(String arg1, String arg2, DataTable table) throws Throwable {
		List<List<String>> data = table.raw();
		String merchantValue=arg1.replaceAll("\\s", "").toLowerCase();
		boolean isFound=false;
		try {
			log.debug("Verify fill "+arg1+" in " + arg2);
			if (merchantValue.contains("merchantid")){
				isFound=true;
				if(merchantValue.contains("ipay")){
					log.debug("ipay merchantid is: "+data.get(1).get(1));
					SetElements.setElement(Constants.TYPE_TEXT, data.get(1).get(1), data.get(1).get(0));
				}
				if(merchantValue.contains("inapp")){
					log.debug("ipay merchantid is: "+data.get(1).get(1));
					SetElements.setElement(Constants.TYPE_TEXT, data.get(1).get(1), data.get(1).get(0));
				}
				else{
					log.debug("Onboarding merchantid is: "+data.get(1).get(1));
					SetElements.setElement(Constants.TYPE_TEXT, MerchantOnboardManagement.merchantRefNumber, data.get(1).get(0));
				}
			}
			if(merchantValue.contains("walletid")){
				isFound=true;
				log.debug("walletID is: "+walletID);
				SetElements.setElement(Constants.TYPE_TEXT, walletID, data.get(1).get(0));
			}
			if(merchantValue.contains("merchantreferenceid")){
				isFound=true;
				log.debug("transactionid is: "+transactionRefid);
				SetElements.setElement(Constants.TYPE_TEXT, transactionRefid, data.get(1).get(0));
			}
			if(merchantValue.contains("transactionid")){
				isFound=true;
				log.debug("transactionid is: "+transactionid);
				SetElements.setElement(Constants.TYPE_TEXT, transactionid, data.get(1).get(0));
			}
			if(merchantValue.contains("activationcode")){
				isFound=true;
				log.debug("activationCode is: "+activationCode);
				SetElements.setElement(Constants.TYPE_TEXT, activationCode, data.get(1).get(0));
			}
			else{
				if(!isFound){
					log.debug("cardreferenceid is: "+cardRefid);
					SetElements.setElement(Constants.TYPE_TEXT, cardRefid, data.get(1).get(0));
				}
			}
			log.debug("Successfully verified filled "+arg1+" in " + arg2);
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter++ + "_" + "fill wallet ID",
					Constants.IMAGE_LOCATION, SetElements.setScreenShotPath(arg2)[0]);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I verify \"([^\"]*)\" message for \"([^\"]*)\"$")
	public void i_verify_message_for(String arg1, String arg2, DataTable table) throws Throwable {
		String displyMessage = "";
		String expectMessage = "";
		boolean isDisplay = false;
		List<List<String>> data = table.raw();
		log.debug("Verify " + arg1 + " message for "+arg2);
		try {
			displyMessage = SetElements.getElementTextByXpath(data.get(1).get(0)).replaceAll("\\s", "").toLowerCase();
			expectMessage = arg1.replaceAll("\\s", "").toLowerCase();
			isDisplay = displyMessage.contains(expectMessage);
			log.debug("displyMessage is: " + displyMessage);
			log.debug("expectMessage is:" + expectMessage);
		} catch (Exception e1) {
			log.error("Error:", e1);
		}
		WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter++ + "_message for " + arg2,
				Constants.IMAGE_LOCATION, SetElements.setScreenShotPath(arg2)[0]);
		try {
			assertTrue(arg1 + " Message not shown, No Success Message", isDisplay);
			log.debug("Successfully verified " + arg1 + " message for "+arg2);
		} catch (AssertionError e2) {
			log.error("Error:", e2);
			Assert.fail();
		}
	}

	@Then("^I verify fields value in \"([^\"]*)\"$")
	public void i_verify_fields_value_in(String arg1, DataTable table) throws Throwable {
		List<List<String>> data = table.raw();
		String expectValue = "";
		String receiveValue = "";
		boolean isEqual = true;
		log.debug("Verify fields value in List Wallet");
		WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter++ + "_fields value in " + arg1,
				Constants.IMAGE_LOCATION, SetElements.setScreenShotPath(arg1)[0]);
		try {
			for (int i = 1; i < data.size(); i++) {
				expectValue = SetElements.getElementTextByXpath(data.get(i).get(0)).replaceAll("\\s", "");
				receiveValue = data.get(i).get(1).replaceAll("\\s", "");
				log.debug("expectValue: " + expectValue);
				log.debug("receiveValue: " + receiveValue);
				isEqual = expectValue.equals(receiveValue);
				if (!isEqual)
					break;
			}
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
		try {
			assertTrue("Display elements and expected elements are defferent", isEqual);
			log.debug("Successfully verified fields value in List Wallet");
		} catch (AssertionError e1) {
			log.error("Error:", e1);
			Assert.fail();
		}
	}

	@And("^I select \"([^\"]*)\" in \"([^\"]*)\"$")
	public void i_select_in(String arg1, String arg2, DataTable table) throws Throwable {
		DateFormat year = new SimpleDateFormat("yyyy");
		Date date = new Date();
		List<List<String>> data = table.raw();
		String yearNumber =Integer.toString((Integer.parseInt(year.format(date)))+3);
		log.debug("Select " + arg1 + " in " + arg2);
		try {
			String option = data.get(1).get(1).toLowerCase();
			switch (option) {
			case "id":
				SetElements.SelectIDDropDownByValue(data.get(1).get(0), yearNumber);
				break;
			case "name":
				SetElements.SelectNamedDropDownByValue(data.get(1).get(0), yearNumber);
				break;
			case "xpath":
				SetElements.SelectXpathDropDownByValue(data.get(1).get(0), yearNumber);
				break;
			}
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter++ + "_select " + arg1,
					Constants.IMAGE_LOCATION, SetElements.setScreenShotPath(arg2)[0]);
			log.debug("Successfully selected " + arg1 + " in " + arg2);

		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I verify \"([^\"]*)\" in \"([^\"]*)\"$")
	public void i_verify_in(String arg1, String arg2, DataTable table) throws Throwable {
		List<List<String>> data = table.raw();
		String receivedValue = "";
		log.debug("Verify " + arg1 + " in " + arg2);
		try {
			String option = data.get(1).get(1).toLowerCase();
			switch (option) {
			case "id":
				receivedValue = SetElements.getElementTextById(data.get(1).get(0));
				break;
			case "name":
				receivedValue = SetElements.getElementTextByName(data.get(1).get(0));
				break;
			case "xpath":
				receivedValue = SetElements.getElementTextByXpath(data.get(1).get(0));
				break;
			}
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter++ + "_verify " + arg1,
					Constants.IMAGE_LOCATION, SetElements.setScreenShotPath(arg2)[0]);
			log.debug("walletID: "+walletID);
			log.debug("receivedToken: "+walletID);
			assertTrue("Display " + arg1 + " and expected " + arg1 + " are defferent", receivedValue.equals(walletID));
			log.debug("Successfully verified " + arg1 + " in " + arg2);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		} catch (AssertionError e1) {
			log.error("Error:", e1);
			Assert.fail();
		}
	}
	
	@Then("^I verify DB values to Add To Wallet$")
	public void i_verify_DB_values_to_Add_To_Wallet() throws Throwable {
		try{
			DbManager ver = new DbManager();
			Boolean dbValue = false;
			String queryOne=null;
			log.debug("Verify DB values to Add To Wallet");
			queryOne="SELECT COUNT(*) FROM BNK_DL_USR WHERE EXT_ID='"+walletID+"'";
			log.debug("queryOne value: "+queryOne);
			dbValue = ver.verfyDb("BNK", queryOne,"1");
			log.debug("dbValue is: "+dbValue);
			assertTrue("DB value and expected values are defferent", dbValue);
			log.debug("Successfully veified DB values to Add To Wallet");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Then("^I got \"([^\"]*)\"$")
	public void i_got(String arg1, DataTable table) throws Throwable {
		log.debug("Verify getting "+arg1);
		List<List<String>> data = table.raw();
		String trxnType=arg1.replaceAll("\\s", "").toLowerCase();
		boolean isFound=false;
		try{
			if(trxnType.equals("transactionrefid")){
				isFound=true;
				transactionRefid=SetElements.getElementTextByXpath(data.get(1).get(0));
				log.debug("transactionRefid: "+transactionRefid);
				log.debug("Successfully got "+arg1);
			}
			if(trxnType.equals("cardreferenceid")){
				isFound=true;
				cardRefid=SetElements.getElementTextByXpath(data.get(1).get(0));
				log.debug("cardRefid: "+cardRefid);
				log.debug("Successfully got "+arg1);
			}
			if(trxnType.equals("walletid")){
				isFound=true;
				walletID=SetElements.getElementTextByXpath(data.get(1).get(0));
				log.debug("walletID: "+walletID);
				log.debug("Successfully got "+arg1);
			}
			else{
				if(!isFound){
					transactionid=SetElements.getElementTextByXpath(data.get(1).get(0));
					log.debug("transactionid: "+transactionid);
					log.debug("Successfully got "+arg1);
				}
			}
			
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Then("^I save all display values in \"([^\"]*)\"$")
	public void i_save_all_display_values_in(String arg1, DataTable table) throws Throwable {
		log.debug("Verify save all display values in "+arg1);
		List<List<String>> data = table.raw();
		try{
			for(int i=0;i<data.size()-1;i++){
				saveValue.add(SetElements.getElementTextByXpath(data.get(i+1).get(0)));
				log.debug("saveValue "+i+": "+saveValue.get(i));
			}
			log.debug("Successfully save all display values in "+arg1);
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Then("^I verify all fields in \"([^\"]*)\"$")
	public void i_verify_all_fields_in(String arg1,DataTable table) throws Throwable {
		log.debug("Verify all fields in "+arg1);
		boolean isEqual=false;
		List<List<String>> data = table.raw();
		WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter++ + "_verify all fields " + arg1,
				Constants.IMAGE_LOCATION, SetElements.setScreenShotPath(arg1)[0]);
		try{
			for(int i=0;i<data.size()-1;i++){
				isEqual =(SetElements.getElementTextByXpath(data.get(i+1).get(0))).equals(saveValue.get(i));
				log.debug("saveValue "+i+": "+saveValue.get(i));
				log.debug("Receve value: "+SetElements.getElementTextByXpath(data.get(i+1).get(0)));
				log.debug("isEqual: "+isEqual);
				if(!isEqual)
					break;
			}
			assertTrue("Received values and expected values are defferent", isEqual);
			log.debug("Successfully verified all fields in "+arg1);
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Given("^I got \"([^\"]*)\" from db$")
	public void i_got_from_db(String arg1) throws Throwable {
		log.debug("I got "+arg1+" from db");
		try{
			DbManager ver = new DbManager();
			String queryOne="SELECT AMOUNT FROM IPG_TRANSACTION WHERE WALLET_ID='"+walletID+"'";
			log.debug("queryOne value: "+queryOne);
			activationCode = ver.geDbValue("IPG", queryOne,"AMOUNT");
			log.debug("dbValue is: "+activationCode);
			log.debug("Successfully got "+arg1+" from db");
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Before(value = "@Inapp")
	public void Feature_Glb_Sett_Mgmt() throws InterruptedException {
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter = 1;
		log.debug("Feature: Feature File for InApp");
	}
	
	@And("^I refresh page$")
	public void i_refresh_page() throws Throwable {
		webDriver.navigate().refresh();
	}

}
