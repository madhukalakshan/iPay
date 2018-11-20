package com.ib.cucumber.definition.icore;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Assert;
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
import cucumber.api.java.en.When;

public class iCoreLinkTerminalMgmt {
	String sMessage = "";
	WebDriver webDriver = null;
	private WebDriverInitializer webDriverInitializer = null;
	private String sTerminalLinkID="";
	Logger log = Logger.getLogger("LOG");
	
	public iCoreLinkTerminalMgmt(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}
	
	@Given("^I Click the \"([^\"]*)\" icon to Terminal Management$")
	public void i_Click_the_icon_to_Terminal_Management(String arg1) throws Throwable {
		try{
			log.debug("Verify click the Merchant Management icon to Terminal Management");
			SetElements.clickElementByXpath("//label[contains(text(),'"+arg1+"')]");
			log.debug("Successfully clicked the Merchant Management icon to Terminal Management");
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_"+arg1,
					Constants.IMAGE_LOCATION,"iCore\\Mer_Mgmt\\Term_Mgmt\\" );
		}
		catch(Exception e){
			log.error("Error:",e);
			throw(e);
		}
	}

	@Then("^I should see the \"([^\"]*)\" page to Terminal Management$")
	public void i_should_see_the_page_to_Terminal_Management(String arg1) throws Throwable {
		try{
			log.debug("Verify Merchant Management page to Terminal Management is loading");
			SetElements.verifyPageLoad("//h1[contains(text(),'"+arg1+"')]");
			log.debug("Successfully loaded Merchant Management page to Terminal Management");
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_"+arg1,
					Constants.IMAGE_LOCATION,"iCore\\Mer_Mgmt\\Term_Mgmt\\" );
		}
		catch (AssertionError e) {
			log.error("Error:",e);
			Assert.fail();
		}
	}

	@Then("^I fill Link Terminal search Page$")
	public void i_fill_Link_Terminal_search_Page(DataTable table) throws Throwable {
		try {
			List<List<String>> Carddata = table.raw();
			
			log.debug("Verify fill Link Terminal search Page");
			for(int i=1;i<Carddata.size();i++)
				SetElements.setElementByName(Constants.TYPE_TEXT, Carddata.get(i).get(1), Carddata.get(i).get(0));
			log.debug("Successfully filled Link Terminal search Page");
		} catch (Exception e){
			log.error("Error:",e);
			throw(e);
		}
	}

	@Then("^I should enter Merchant Terminal Details$")
	public void i_should_enter_Merchant_Terminal_Details(DataTable table) throws Throwable {
		List<List<String>> Carddata = table.raw();
		try {
			log.debug("Verify enter Merchant Terminal Details");
			try{
				SetElements.SelectNamedDropDownByValue(Carddata.get(1).get(0), Carddata.get(1).get(1));
			}catch(Exception e){
				SetElements.SelectNamedDropDownByIndex(Carddata.get(1).get(0), 1);
			}
			Thread.sleep(1000);
			SetElements.SelectNamedDropDownByIndex(Carddata.get(2).get(0), Integer.valueOf(Carddata.get(2).get(1)));
			log.debug("Successfully entered Merchant Terminal Details");
		} catch (Exception e1){
			log.error("Error:",e1);
			throw(e1);
		}
	}

	@Then("^I should enter Terminal Reapply Details$")
	public void i_should_enter_Terminal_Reapply_Details(DataTable table) throws Throwable {
		try {
			List<List<String>> Carddata = table.raw();
			log.debug("Verify enter Terminal Reapply Details");
			SetElements.SelectNamedDropDownByIndex(Carddata.get(1).get(0), Integer.valueOf(Carddata.get(1).get(1)));
			log.debug("Terminal Reapply Details entered successfully");
		} catch(Exception e){
			log.error("Error:",e);
			throw(e);
		}
	}

	@Then("^I should enter Terminal Edit Details$")
	public void i_should_enter_Terminal_Edit_Details(DataTable table) throws Throwable {
		try {
			List<List<String>> Carddata = table.raw();
			
			log.debug("Verify enter Terminal Edit Details");
			SetElements.SelectNamedDropDownByIndex(Carddata.get(1).get(0), Integer.valueOf(Carddata.get(1).get(1)));
			log.debug("Successfully entered Terminal Edit Details");
		} catch(Exception e){
			log.error("Error:",e);
			throw(e);
		}
	}

	@When("^I Select terminal suspension reason Icon$")
	public void i_Select_terminal_suspension_reason_Icon(DataTable table) throws Throwable {
		try {
			List<List<String>> Carddata = table.raw();
			
			log.debug("Verify select terminal suspension reason");
			SetElements.SelectNamedDropDownByValue(Carddata.get(1).get(0), Carddata.get(1).get(1));
			log.debug("Successfully selected terminal suspension reason");
		} catch(Exception e){
			log.error("Error:",e);
			throw(e);
		}
	}
	
	@When("^I Select terminal closure reason Icon$")
	public void i_Select_terminal_closure_reason_Icon(DataTable table) throws Throwable {
		try {

			List<List<String>> Carddata = table.raw();
			log.debug("Verify select terminal closure reason");
			//Select dropReasonCode = new Select(webDriver.findElement(By.name(Carddata.get(1).get(0))));
			//dropReasonCode.selectByValue(Carddata.get(1).get(1));	
			SetElements.SelectNamedDropDownByValue(Carddata.get(1).get(0), Carddata.get(1).get(1));
			log.debug("Successfully selected terminal closure reason");
		} catch(Exception e){
			log.error("Error:",e);
			throw(e);
		}
	}
	
	@Then("^I retrive generated TeminalLinkID$")
	public void i_retrive_generated_AccountNo(DataTable table) throws Throwable {
		try {
			List<List<String>> Carddata = table.raw();
			log.debug("Verify retrive generated TeminalLinkID");
			sTerminalLinkID = SetElements.extractValueFromMessageString(Carddata.get(1).get(1), "");
			System.out.println("terminal link generated is : "+sTerminalLinkID);
			log.debug("Successfully verify retrive generated TeminalLinkID");
		} catch(Exception e){
			log.error("Error:",e);
			throw(e);
		}
	}
	
	@Before(value="@iCoreTerMgmt")
	public void Feature_Commission_product(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: iCore Terminal Management");
	}

}
