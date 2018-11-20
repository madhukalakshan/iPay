package com.ib.cucumber.definition.icore;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.DbManager;
import com.ib.cucumber.common.ElementValidation;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;

import cucumber.api.DataTable;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class IcoreCommonSteps {

	private WebDriverInitializer webDriverInitializer;
	WebDriver webDriver = null;
	Logger log = Logger.getLogger("LOG");

	public IcoreCommonSteps(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	@Then("^I Click the Reject Button$")
	public void i_Click_the_Reject_Button() throws Throwable {
		SetElements.clickElementById("Reject");
	}

	@Given("^I am at Main  Menu page \"([^\"]*)\"$")
	public void i_am_at_Main_Menu_page(String sPage) throws Throwable {
	}

	@Then("^I Quit the browser$")
	public void i_Quit_the_browser() throws Throwable {
		webDriver.quit();
	}

	@Then("^I navigate to Application Menu page \"([^\"]*)\"$")
	public void i_navigate_to_Application_Menu_page(String sPage) throws Throwable {

		SetElements.clickElementById("showLeftPush");
		SetElements.clickElementById("cbp-spmenu-s1");
	}

	@Then("^I click the detail button$")
	public void i_click_the_detail_button() throws Throwable {

		SetElements.waitElementVisibleByXpath("/html/body/div[2]/div[3]/form[2]/table/tbody/tr[1]/td[7]/a");
		SetElements.clickElementByXpath("/html/body/div[2]/div[3]/form[2]/table/tbody/tr[1]/td[7]/a");
	}

	@When("^I click the Icard icon \"([^\"]*)\"$")
	public void i_click_the_Icard_icon(String sId) throws Throwable {
		webDriver.switchTo().frame("topFrame");
		SetElements.clickElementById(sId);
	}

	@Then("^I Click the LogOut Button$")
	public void i_Click_the_LogOut_Button() throws Throwable {
		SetElements.clickElementById("log_out");
	}

	@Then("^I Click the OK Button$")
	public void i_Click_the_OK_Button() throws Throwable {
		SetElements.clickElementById("Ok");
	}

	@Then("^I Click the Button \"([^\"]*)\"$")
	public void i_Click_the_Button(String sButtonId) throws Throwable {
		SetElements.clickElementById(sButtonId);
	}

	// Moving to Application menu

	@Then("^I Click the Application Link \"([^\"]*)\"$")
	public void i_Click_the_Application_Link(String sLink) throws Throwable {
		SetElements.clickElementByLinkText(sLink);
	}

	@Then("^I Check For No Records Found Message$")
	public void i_Check_For_No_Records_Found_Message() throws Throwable {
		try{
			if (ElementValidation.isMessage(webDriver, "Error")) {
				assertTrue("No Records Found Message", false);
			}
		}catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@Then("^I click the butt \"([^\"]*)\"$")
	public void i_click_the_butt(String arg1) throws Throwable {
		SetElements.clickElementById("showLeftPush");
		SetElements.clickElementById("cbp-spmenu-s1");
	}

	@Then("^I Click on the tree item link \"([^\"]*)\"$")
	public void i_click_on_Merchant_icon(String arg1) throws Throwable {
		try {
			log.debug("Verify click on the tree item link: " + arg1);
			SetElements.clickFirstTreeItem(arg1);
			log.debug("Successfully click on the tree item link: " + arg1);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I select item \"([^\"]*)\"  of selectBox \"([^\"]*)\"$")
	public void i_select_item_of_selectBox(String sItemName, String sSelectBoxName) throws Throwable {
		try {
			log.debug("Verify select item " + sItemName + " of selectBox");
			SetElements.clickSelectBoxItems(sSelectBoxName, sItemName);
			log.debug("Successfully selected item " + sItemName + " of selectBox");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}

	}

	@Then("^I Click on all links with \"([^\"]*)\"$")
	public void i_click_on_all_links_with(String arg1) throws Throwable {
		try {
			log.debug("Verify click on all links with " + arg1);
			Thread.sleep(1000);
			SetElements.clickAllDetailLinks(arg1);
			log.debug("Successfully clicked on all links with " + arg1);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}

	}

	@Then("^I Check for Error \"([^\"]*)\"$")
	public void i_Check_for_Error(String arg1) throws Throwable {
		log.debug("Verify error message: " + arg1);
		try {
			if (SetElements.extractMessageFromListElement(arg1)){
				assertTrue(arg1 + " ,Unable complete the request", false);
				log.debug("Got error message: " + arg1);
			}
			else{
				log.debug("Didn't get error message: " + arg1);
			}
			
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@Then("^I check whether No Records Found$")
	public void i_check_whether_no_records_found() throws Throwable {
		log.debug("Verify records are found");
		try {
			if (SetElements.extractMessageFromTable("No Records Found"))
				assertTrue("No Records Found,Unable complete the request", false);
			log.debug("Successfully verified records are found");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@Then("^I call verify method$")
	public void i_call_verify_method(DataTable table) throws Throwable {
		try{
			List<List<String>> SqlLine = table.raw();
			DbManager ver = new DbManager();
			boolean isPassed = false;
			log.debug("Verify DB validation method");
			Thread.sleep(1000);
			for (int i = 1; i < SqlLine.size(); i++) {
				isPassed = ver.verfyDb(SqlLine.get(i).get(0), SqlLine.get(i).get(1), SqlLine.get(i).get(2));
				if (!isPassed)
					break;
			}
			log.debug("Successfully verified DB validation method");
			if (!isPassed) {
				assertTrue("Query Result Does Not Matched to Expected Count.", false);
				log.debug("Query Result Does Not Matched to Expected Count.");
			}
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
		
	}

	@Given("^page down$")
	public void page_down() throws Throwable {
		SetElements.scrolldown();
	}
}