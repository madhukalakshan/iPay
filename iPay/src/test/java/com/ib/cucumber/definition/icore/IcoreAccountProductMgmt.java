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
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class IcoreAccountProductMgmt {
	String sMessage = "";
	WebDriver webDriver = null;
	private WebDriverInitializer webDriverInitializer = null;
	private String sCreatedProductType = "";
	Logger log = Logger.getLogger("LOG");

	public IcoreAccountProductMgmt(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	@Before
	public void beforeScenario() {
		System.out.println("Starting Account product Mgmt !!");
	}

	@And("^I fill the account product Creation form for Account Type \"([^\"]*)\"$")
	public void i_fill_the_account_product_Creation_form_for_Account_Type(String accountType, DataTable table)
			throws Throwable {

		try {
			List<List<String>> Carddata = table.raw();
			log.debug("Verify fill account product Creation form");
			SetElements.SelectNamedDropDownByValue(Carddata.get(1).get(0),Carddata.get(1).get(1));

			sCreatedProductType = Carddata.get(1).get(1).trim();
			System.out.println("sCreatedProductType : " + sCreatedProductType);
			Thread.sleep(1000);
			SetElements.setElementByName(Constants.TYPE_TEXT,Carddata.get(2).get(1),Carddata.get(2).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT,Carddata.get(3).get(1),Carddata.get(3).get(0));
			SetElements.SelectNamedDropDownByValue(Carddata.get(4).get(0),Carddata.get(4).get(1));
			// above 4 properties are common for all product types

			if (!"CMSN".equals(accountType)) {
				SetElements.SelectNamedDropDownByValue(Carddata.get(5).get(0),Carddata.get(5).get(1));
			}

			if ("CREDIT".equals(accountType)) {
				/*
				 * | StmtPrd 	| MONTHLY 		| 
				 * | StmtDtTyp 	| DATE_SPECIFIC | 
				 * | IntTyp		| REDUCING_BAL 	|
				 * | StmtDt 	| 10 			| 
				 *  #skipping few input fields with default values
				 * | CrdLmt | 100000 			| 
				 * | CshLmt | 50000 			|
				 * #putting blocking details 
				 * | RW11 | DATE_SPECIFIC 		| 
				 * | RW21 | DATE_SPECIFIC 		| 
				 * | RW31 | DATE_SPECIFIC 		| 
				 * | RW41 |DATE_SPECIFIC  		|
				 * | RW51 | DATE_SPECIFIC 		|
				 */
				
				SetElements.SelectNamedDropDownByValue(Carddata.get(6).get(0),Carddata.get(6).get(1));
				SetElements.SelectNamedDropDownByValue(Carddata.get(7).get(0),Carddata.get(7).get(1));
				SetElements.SelectNamedDropDownByValue(Carddata.get(8).get(0),Carddata.get(8).get(1));
				SetElements.setElementByName(Constants.TYPE_TEXT,Carddata.get(9).get(1),Carddata.get(9).get(0));
				SetElements.setElementByName(Constants.TYPE_TEXT,Carddata.get(10).get(1),Carddata.get(10).get(0));
				SetElements.setElementByName(Constants.TYPE_TEXT,Carddata.get(11).get(1),Carddata.get(11).get(0));
				SetElements.setElementByName(Constants.TYPE_TEXT,Carddata.get(12).get(1),Carddata.get(12).get(0));
				SetElements.setElementByName(Constants.TYPE_TEXT,Carddata.get(13).get(1),Carddata.get(13).get(0));
				SetElements.setElementByName(Constants.TYPE_TEXT,Carddata.get(14).get(1),Carddata.get(14).get(0));
				SetElements.setElementByName(Constants.TYPE_TEXT,Carddata.get(15).get(1),Carddata.get(15).get(0));
				SetElements.setElementByName(Constants.TYPE_TEXT,Carddata.get(16).get(1),Carddata.get(16).get(0));

			} else if ("MERC".equals(accountType)) { 
				// StmtPrd MONTHLY
				// StmtDt 10
//				SetElements.SelectNamedDropDownByValue(Carddata.get(6).get(0),Carddata.get(6).get(1));
//				SetElements.setElementByName(Constants.TYPE_TEXT,Carddata.get(7).get(1),Carddata.get(7).get(0));
			}
			// make sure if any new fields are added to product type "CMSN",reduce the index by 1

			log.debug("Successfully filled account product Creation form");

		} catch(Exception e){
			log.error("Error:",e);
			throw(e);
		}
	}

	@When("^I fill Account Product search form$")
	public void i_fill_Account_Product_form(DataTable table) throws Throwable {
		try {
			List<List<String>> Carddata = table.raw();
			log.debug("Verify Approve Account Product form");
			if (Carddata != null && Carddata.size() > 1 && Carddata.get(1).get(0) != null) {
				SetElements.setElementByName(Constants.TYPE_TEXT,Carddata.get(1).get(1),Carddata.get(1).get(0));

			} else if (sCreatedProductType != null && sCreatedProductType.length() > 1) {
				SetElements.setElementByName(Constants.TYPE_TEXT,sCreatedProductType,"ProdTyp");
			} else {
				System.out.println("Producttype  approval done without account number input");
			}
			log.debug("Successfully filled Approve Account Product form");

		} catch(Exception e){
			log.error("Error:",e);
			throw(e);
		}
	}

	@Then("^I fill Account Product edit details$")
	public void i_fill_Account_Product_edit_deatails(DataTable table) throws Throwable {
		try{
			List<List<String>> Carddata = table.raw();
			log.debug("Verify fill Account Product edit deatils");
			SetElements.setElementByName(Constants.TYPE_TEXT,Carddata.get(1).get(1),Carddata.get(1).get(0));
			log.debug("Successfully filled Account Product edit deatils");
		}
		catch(Exception e){
			log.error("Error:",e);
			throw(e);
		}

	}
	
	@Given("^I Click the \"([^\"]*)\" icon to Account Product Management$")
	public void i_Click_the_icon_to_Account_Product_Management(String arg1) throws Throwable {
		String xPath="//label[contains(text(),'"+arg1+"')]";
		try{
			log.debug("Verify click the "+arg1+" icon to Account Product Management");
			SetElements.clickElementByXpath(xPath);
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_"+arg1,
					Constants.IMAGE_LOCATION, "iCore\\Acc_Mgmt\\Acc_Prod_Mgmt\\");
			log.debug("Successfully clicked "+arg1+" icon to Account Product Management");
		}
		catch(Exception e){
			log.error("Error:",e);
			throw(e);
		}
	}

	@Then("^I should see the \"([^\"]*)\" page to Account Product Management$")
	public void i_should_see_the_page_to_Account_Product_Management(String arg1) throws Throwable {
		try{
			log.debug("Verify "+arg1+" page to Account Product Management is loading");
			SetElements.verifyPageLoad("//h1[contains(text(),'"+arg1+"')]");
			WebPageObject.getScreenShots(webDriver,CommonSteps.iImageCounter()+"_"+arg1,
					Constants.IMAGE_LOCATION, "iCore\\Acc_Mgmt\\Acc_Prod_Mgmt\\");
			log.debug("Successfully loaded "+arg1+" page to Account Product Management");
		}
		catch (AssertionError e) {
			log.error("Error:",e);
			Assert.fail();
		}
	}
	
	@Before(value="@MerProduct")
	public void Feature_Merchant_product(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: iCore Account Product Management(Merchant product)");
	}
	
	@Before(value="@CommProduct")
	public void Feature_Commission_product(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: iCore Account Product Management(Merchant Commission product)");
	}

}
