package com.ib.cucumber.definition.icore;

import static org.junit.Assert.assertTrue;

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
import com.ib.cucumber.definition.ipay.iPayPHPClient;
import com.ib.cucumber.dto.iadmin.LoginFormDto;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

public class MerchantCommissionCharge {
	
	WebDriver webDriver = null;
	LoginFormDto loginForm = null;
	private WebDriverInitializer webDriverInitializer = null;
	ConfigFileReader configFileReader;
//	public static long authorisationNumberOne=12345678910L;
//	public static long authorisationNumberTwo=12345678910L;
	public static String authorisationNumberOne="";
	public static String authorisationNumberTwo="";
	Logger log = Logger.getLogger("LOG");

	public MerchantCommissionCharge(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
		configFileReader= new ConfigFileReader();
	}
	
	@Given("^I am at Shopping Cart page to \"([^\"]*)\"$")
	public void i_am_at_Shopping_Cart_page_to(String arg1) throws Throwable {
		try {
            log.debug("Verify whether page url is loading");
            webDriver = webDriverInitializer.getDriver();
			WebPageObject page = new WebPageObject(webDriver);
			loginForm = new LoginFormDto(webDriver);
			page.navigateToWebPage(configFileReader.getPHPClientUrl());
            log.debug("Successfully loaded page url");
            WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_Shopping Cart page",
                    Constants.IMAGE_LOCATION, SetElements.setScreenShotPath(arg1)[0]);
        } catch (Exception e) {
            log.error("Error:", e);
            throw (e);
        }
	}

	@Then("^I Click on \"([^\"]*)\" link in Shopping Cart to \"([^\"]*)\"$")
	public void i_Click_on_link_in_Shopping_Cart_to(String arg1, String arg2) throws Throwable {
		try {
            log.debug("Verify click on " + arg1 + " link in Shopping Cart");
            SetElements.clickElementByXpath("//a[contains(text(), '" + arg1 + "')]");
            WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_Click " + arg1 + " link",
                    Constants.IMAGE_LOCATION, SetElements.setScreenShotPath(arg2)[0]);
            log.debug("Successfully clicked on " + arg1 + " link in Shopping Cart");
        } catch (Exception e) {
            log.error("Error:", e);
            throw (e);
        }
	}

	@Then("^I Select the \"([^\"]*)\" Payment Type to \"([^\"]*)\"$")
	public void i_Select_the_Payment_Type_to(String arg1, String arg2) throws Throwable {
		try {
            log.debug("Verify select the " + arg1 + " Payment Type");
            Thread.sleep(5000);
            SetElements.clickElementByXpath("//input[@value='" + arg1 + "']");
            WebPageObject.getScreenShots(webDriver,
                    CommonSteps.iImageCounter() + "_select the " + arg1 + " Payment Type", Constants.IMAGE_LOCATION,
                    SetElements.setScreenShotPath(arg2)[0]);
            log.debug("Successfully selected the " + arg1 + " Payment Type");
        } catch (Exception e) {
            log.error("Error:", e);
            throw (e);
        }
	}

	@Then("^I should see \"([^\"]*)\" transaction status to \"([^\"]*)\"$")
	public void i_should_see_transaction_status_to(String arg1, String arg2) throws Throwable {
		 webDriver.manage().timeouts().implicitlyWait(5,TimeUnit.SECONDS);
	        Boolean trxnStatus;
	        log.debug("Verify Transaction Status");
	        try
	        {
	            iPayPHPClient.MerchantReferenceIDOne= webDriver.findElement(By.xpath("//div[@class='view-cart']/table/tbody/tr[4]/td[3]")).getText();
	            log.debug("MerchantRefarenceIDOne is : " +iPayPHPClient.MerchantReferenceIDOne);
	            trxnStatus= (webDriver.findElement(By.xpath("//div[@class='view-cart']/table/tbody/tr[6]/td[3]")).getText().contains("ACCEPTED")?true:false);
	            Assert.assertTrue(trxnStatus);
	            WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_transaction status",
	                    Constants.IMAGE_LOCATION,SetElements.setScreenShotPath(arg2)[0]);
	            log.debug("Successfully verified Transaction Status");
	        }catch(Exception e)
	        {
	            log.error("Error:", e);
	            throw (e);
	        }
	        catch (AssertionError e) {
	            log.error("Error:", e);
	            Assert.fail();
	        }
	}
	
	@Then("^I veify DB values for Transaction to \"([^\"]*)\"$")
	public void i_veify_DB_values_for_Transaction_to(String arg1) throws Throwable {
		try{
			String transactionType=arg1.toLowerCase();
			String MerchantRefarenceID=null;
			DbManager ver = new DbManager();
			boolean[] pass = new boolean[2];
			boolean isPassed = true;
			String queryOne=null;
			String queryTwo=null;
			String queryThree=null;
			log.debug("Verify DB values for Transaction to merchant commissions");
			switch(transactionType){
			case "merchant commission":
			case "merchant charge":
			case "void":
				MerchantRefarenceID=iPayPHPClient.MerchantReferenceIDOne;
				queryOne="select authorisation_number from ipg_transaction where merchant_reference_id='"+MerchantRefarenceID+"';";
				authorisationNumberOne = ver.geDbValue("IPG", queryOne,"authorisation_number");
				queryTwo="select count(*) from swt_vx_trxs where auth_code='"+authorisationNumberOne+"';";
				pass[0]=ver.verfyDb("ISWITCH", queryTwo,"1");
				queryThree="select count(*) from bkn_dx_trxn where de_38='"+authorisationNumberOne+"' and cust_typ='CUST';";
				pass[1]=ver.verfyDb("ICORE", queryThree,"1");
				break;
			case "refund":
				MerchantRefarenceID=iPayPHPClient.MerchantReferenceIDTwo;
				queryOne="select authorisation_number from ipg_transaction where merchant_reference_id='"+MerchantRefarenceID+"';";
				authorisationNumberTwo = ver.geDbValue("IPG", queryOne,"authorisation_number");
				queryTwo="select count(*) from swt_vx_trxs where auth_code='"+authorisationNumberTwo+"';";
				pass[0]=ver.verfyDb("ISWITCH", queryTwo,"1");
				queryThree="select count(*) from bkn_dx_trxn where de_38='"+authorisationNumberTwo+"' and cust_typ='CUST';";
				pass[1]=ver.verfyDb("ICORE", queryThree,"1");
				break;
			}
			for(int j=0;j<2;j++){
				if(!pass[j]){
					isPassed=pass[j];
					break;
				}
			}
		    assertTrue(isPassed);
			log.debug("Successfully veified DB values for Transaction to merchant commissions");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@Then("^I verify \"([^\"]*)\" record$")
	public void i_verify_record(String arg1) throws Throwable {
		try{
			DbManager ver = new DbManager();
			boolean isPassed = false;
			log.debug("verify commission record");
			String queryOne="select count(*) from bkn_dx_trxn where de_38='"+authorisationNumberOne+"' and cust_typ='CMSN' and de_4='1000';";
			isPassed=ver.verfyDb("ICORE", queryOne,"1");
		    assertTrue(isPassed);
			log.debug("Successfully veified DB values for Transaction to merchant commissions");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
	
	@And("^I close the appication console$")
	public void i_close_the_appication_console() throws Throwable {
		try{
            log.debug("Verify close the appication console");
            Thread.sleep(3000);
            webDriver.quit();
            WebDriverInitializer.initialized=false;
            log.debug("Successfully closed the appication console");
        }catch (Exception e) {
            log.error("Error:", e);
            throw (e);
        }
	}
	
	@Before(value="@verMercCommAndChar")
	public void Feature_Glb_Sett_Mgmt(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Feature: Feature File for verify Merchant Commission and Charge");
	}

}
