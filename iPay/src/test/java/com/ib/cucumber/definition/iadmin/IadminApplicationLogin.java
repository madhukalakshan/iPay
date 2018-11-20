package com.ib.cucumber.definition.iadmin;

import java.util.List;

import org.apache.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.ib.cucumber.common.ConfigFileReader;
import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.dto.iadmin.LoginFormDto;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.DataTable;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class IadminApplicationLogin {

	LoginFormDto loginForm = null;
	private WebDriverInitializer webDriverInitializer;
	ConfigFileReader configFileReader;
	WebDriver webDriver = null;
	int iImageCounter = 1;
	Logger log = Logger.getLogger("LOG");

	public IadminApplicationLogin(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		configFileReader= new ConfigFileReader();
	}
	
	@Given("^I am at \"([^\"]*)\" Login page to \"([^\"]*)\"$")
	public void i_am_at_Login_page_to(String arg1, String arg2) throws Throwable {
		String type = arg1.replaceAll("\\s", "").toLowerCase();
		try {
			log.debug("Verify whether page url is loading");
			webDriver = webDriverInitializer.getDriver();
			WebPageObject page = new WebPageObject(webDriver);
			loginForm = new LoginFormDto(webDriver);
			switch(type){
			case "merchant":
				page.navigateToWebPage(configFileReader.getMerchantPageUrl());
				break;
			case "inapp":
				page.navigateToWebPage(configFileReader.getInAppClientUrl());
				break;
			default:
				page.navigateToWebPage(configFileReader.getLoginPageUrl());
			}
			log.debug("Successfully loaded page url");
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_Login_to_Iadmin", Constants.IMAGE_LOCATION,
					SetElements.setScreenShotPath(arg2)[0]);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@When("^I enter user details$")
	public void i_enter_user_details(DataTable arg1) throws Throwable {
		try {
			log.debug("Verify user details enter");
			List<List<String>> Tableraw = arg1.raw();
			for (int i = 0; i < 3; i++) {
				WebElement amount = webDriver.findElement(By.name(Tableraw.get(i).get(0)));
				amount.clear();
				amount.sendKeys(Tableraw.get(i).get(1));
			}
			log.debug("Successfully entered user details");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}

	}

	@Then("^I enter password$")
	public void i_enter_password(DataTable arg1) throws Throwable {
		try {
			log.debug("Verify password enter");
			List<List<String>> Tableraw = arg1.raw();
			WebElement amount = webDriver.findElement(By.name(Tableraw.get(0).get(0)));
			amount.clear();
			amount.sendKeys(Tableraw.get(0).get(1));
			log.debug("Successfully entered passowrd");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@And("^I click the Login button$")
	public void i_click_the_Login_button() throws Throwable {
		try {
			log.debug("Verify click on the login button");
			webDriver.findElement(By.xpath("//*[@class='frmbtn submit']")).click();
			log.debug("Successfully clicked on the login button");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
		//webDriver.findElement(By.xpath("//*[@class='fmbtn submit']")).click();
	}

	@Then("^Select the top frame in Application page$")
	public void select_the_top_frame_in_Application_page() throws Throwable {
		try {
			log.debug("switch Element By Name for topFrame");
			SetElements.switchElementByName("topFrame");
			log.debug("switch successfully to Element for topFrame");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}
}
