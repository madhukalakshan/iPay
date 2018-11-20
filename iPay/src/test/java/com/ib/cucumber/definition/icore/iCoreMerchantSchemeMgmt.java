package com.ib.cucumber.definition.icore;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

public class iCoreMerchantSchemeMgmt {
	String sMessage = "";
	WebDriver webDriver = null;
	private WebDriverInitializer webDriverInitializer = null;
	Logger log = Logger.getLogger("LOG");

	public iCoreMerchantSchemeMgmt(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	@Given("^I should fill Scheme Details$")
	public void i_should_fill_Scheme_Details(DataTable table) throws Throwable {

		try {
			log.debug("Verify fill Scheme Details");
			List<List<String>> Carddata = table.raw();

			SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(1).get(1), Carddata.get(1).get(0));
			DateFormat year = new SimpleDateFormat("yyyy");
			DateFormat month = new SimpleDateFormat("MM");
			DateFormat day = new SimpleDateFormat("dd");
			Date date = new Date();
			SetElements.SelectNamedDropDownByValue("FromDate",Integer.toString(Integer.parseInt(day.format(date))));
			//SetElements.SelectNamedDropDownByValue("FromMon", Integer.toString(Integer.parseInt(month.format(date))));
			if ((Integer.parseInt(month.format(date)) + 1) <= 12)
				SetElements.SelectNamedDropDownByValue("FromMon",Integer.toString(Integer.parseInt(month.format(date)) + 1));
			else
				SetElements.SelectNamedDropDownByValue("FromMon", "1");
			SetElements.SelectNamedDropDownByValue("FromYear", year.format(date));
			if((Integer.parseInt(day.format(date)) + 1)<=28)
				SetElements.SelectNamedDropDownByValue("ToDate", Integer.toString(Integer.parseInt(day.format(date)) + 1));
			else
				SetElements.SelectNamedDropDownByValue("ToDate","25");
			if ((Integer.parseInt(month.format(date)) + 1) <= 12)
				SetElements.SelectNamedDropDownByValue("ToMon",Integer.toString(Integer.parseInt(month.format(date)) + 1));
			else
				SetElements.SelectNamedDropDownByValue("ToMon", "1");
			SetElements.SelectNamedDropDownByValue("ToYear", Integer.toString(Integer.parseInt(year.format(date)) + 1));
			SetElements.SelectIDDropDownByValue(Carddata.get(8).get(0), Carddata.get(8).get(1));
			SetElements.SelectIDDropDownByValue(Carddata.get(9).get(0), Carddata.get(9).get(1));
			SetElements.SelectIDDropDownByValue(Carddata.get(10).get(0), Carddata.get(10).get(1));
			//SetElements.setElement(Constants.TYPE_TEXT, Carddata.get(11).get(1), Carddata.get(11).get(0));
			//SetElements.SelectIDDropDownByValue(Carddata.get(11).get(0), Carddata.get(11).get(1));
			SetElements.SelectIDDropDownByValue(Carddata.get(11).get(0), Carddata.get(11).get(1));
			SetElements.setElement(Constants.TYPE_TEXT, Carddata.get(12).get(1), Carddata.get(12).get(0));
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_fill Scheme Details", Constants.IMAGE_LOCATION,
					"iCore\\Mer_Mgmt\\Mer_Sch_Mgmt\\");
			log.debug("Successfully filled Scheme Details");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I Click on \"([^\"]*)\" Button in Merchant Scheme$")
	public void i_Click_on_Button_in_Merchant_Scheme(String arg1) throws Throwable {
		try {
			log.debug("Verify click on " + arg1 + " Button in Merchant Scheme");
			SetElements.scrolldown();
			SetElements.clickElementByXpath("//*[@value='Add']");
			log.debug("Successfully clicked on " + arg1 + " Button in Merchant Scheme");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}

	}

	@Then("^I Click on \"([^\"]*)\" Button in Edit Merchant Scheme$")
	public void i_Click_on_Button_in_Edit_Merchant_Scheme(String arg1) throws Throwable {
		try {
			log.debug("Verify click on " + arg1 + " Button in Edit Merchant Scheme");
			JavascriptExecutor jse = (JavascriptExecutor) webDriver;
			jse.executeScript("window.scrollBy(0,300)", "");
			SetElements.clickElementByXpath("//*[@value='Add']");
			log.debug("Successfully verified click on " + arg1 + " Button in Edit Merchant Scheme");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}

	}

	@Then("^I should enter merchant \"([^\"]*)\" Details$")
	public void i_should_enter_merchant_Details(String arg1, DataTable table) throws Throwable {
		try {
			log.debug("Verify enter merchant " + arg1 + " Details");
			List<List<String>> Carddata = table.raw();
			// adding charge
			SetElements.SelectIDDropDownByValue(Carddata.get(1).get(0), Carddata.get(1).get(1));
			SetElements.SelectIDDropDownByValue(Carddata.get(2).get(0), Carddata.get(2).get(1));
			SetElements.SelectIDDropDownByValue(Carddata.get(3).get(0), Carddata.get(3).get(1));
			//SetElements.setElement(Constants.TYPE_TEXT, Carddata.get(4).get(1), Carddata.get(4).get(0));
			//SetElements.SelectIDDropDownByValue(Carddata.get(4).get(0), Carddata.get(4).get(1));
			SetElements.SelectIDDropDownByValue(Carddata.get(4).get(0), Carddata.get(4).get(1));
			SetElements.setElement(Constants.TYPE_TEXT, Carddata.get(5).get(1), Carddata.get(5).get(0));
			log.debug("Successfully entered merchant " + arg1 + " Details");

		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Given("^I Click the \"([^\"]*)\" icon to Merchant Scheme Management$")
	public void i_Click_the_icon_to_Merchant_Scheme_Management(String arg1) throws Throwable {
		try {
			log.debug("Verify click the " + arg1 + " icon");
			SetElements.clickElementByXpath("//label[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully clicked the " + arg1 + " icon");
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_" + arg1, Constants.IMAGE_LOCATION,
					"iCore\\Mer_Mgmt\\Mer_Sch_Mgmt\\");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I should see the \"([^\"]*)\" page to Merchant Scheme Management$")
	public void i_should_see_the_page_to_Merchant_Scheme_Management(String arg1) throws Throwable {
		try {
			log.debug("Verify " + arg1 + " page is loading");
			SetElements.verifyPageLoad("//h1[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully loaded " + arg1 + " page");
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_" + arg1, Constants.IMAGE_LOCATION,
					"iCore\\Mer_Mgmt\\Mer_Sch_Mgmt\\");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}
	
	@Before(value="@MerSch")
	public void Feature_Commission_product(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: iCore Merchant Scheme Management");
	}
}
