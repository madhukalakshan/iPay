package com.ib.cucumber.definition.common;

import org.junit.Assert;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.WebElement;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.DataTable;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class CommonSteps {

	private WebDriverInitializer webDriverInitializer;
	WebDriver webDriver = null;
	public static int iImageCounter = 1;
	static int resetiImageCounter = 1;
	static Logger log = Logger.getLogger("LOG");

	public CommonSteps(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	@Given("^I Click the \"([^\"]*)\" icon$")
	public void i_Click_the_icon(String arg1) throws Throwable {
		log.debug("Verify click the " + arg1 + " icon");
		String xPath="//label[contains(text(),'" + arg1 + "')]";
		try {
			//SetElements.visibleByXpath("//label[contains(text(),'" + arg1 + "')]", Constants.TIME_OUT_PERIOD);;
			SetElements.clickElementByXpath(xPath);
		} catch (Exception e) {
			try {
				Thread.sleep(2000);
				log.debug("Try to click on icon again");
				SetElements.clickElementByXpath("//label[contains(text(),'" + arg1 + "')]");
			} catch (Exception e1) {
				log.error("Error:", e1);
				throw (e);
			}

		}
		log.debug("Successfully clicked the " + arg1 + " icon");
		WebPageObject.getScreenShots(webDriver, iImageCounter++ + "_" + arg1, Constants.IMAGE_LOCATION,
				SetElements.setScreenShotPath(arg1)[0]);
	}

	@Then("^I should see the \"([^\"]*)\" page$")
	public void i_should_see_the_page(String arg1) throws Throwable {
		
		try {
			log.debug("Verify " + arg1 + " page is loading");
			SetElements.verifyPageLoad("//h1[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully loaded " + arg1 + " page");
			WebPageObject.getScreenShots(webDriver, iImageCounter++ + "_" + arg1, Constants.IMAGE_LOCATION,
					SetElements.setScreenShotPath(arg1)[0]);
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@Given("^I am at \"([^\"]*)\" Home Page$")
	public void i_am_at_Home_Page(String arg1) throws Throwable {
		try {
			log.debug("Verify click the " + arg1 + " Home Page");
			SetElements.clickElementByXpath("//label[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully clicked the " + arg1 + " Home Page");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I should see \"([^\"]*)\" Home Page$")
	public void i_should_see_Home_Page(String arg1) throws Throwable {
		try {
			String xPath="//h1[contains(text(),'Main Menu')]";
			log.debug("Verify " + arg1 + " Home Page is loading");
			SetElements.waitElementVisibleByXpath(xPath);
			SetElements.verifyPageLoad(xPath);
			log.debug("Successfully loaded " + arg1 + " Home Page");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@Then("^I click on \"([^\"]*)\" icon to back$")
	public void i_click_on_icon_to_back(String arg1) throws Throwable {
		try {
			log.debug("Verify click on " + arg1 + " icon to back");
			Thread.sleep(1000);
			SetElements.clickElementByXpath("//div[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully clicked on " + arg1 + " icon to back");
			WebPageObject.getScreenShots(webDriver, iImageCounter++ + "_" + arg1, Constants.IMAGE_LOCATION,
					SetElements.setScreenShotPath(arg1)[0]);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@And("^I Click on Button \"([^\"]*)\"$")
	public void i_Click_on_Button(String arg1) throws Throwable {
		try {
			Thread.sleep(1000);
			SetElements.scrolldown();
			log.debug("Verify click on " + arg1 + " Button");
			SetElements.clickElementByName(arg1);
			if (SetElements.isAlertPresent()) {
				SetElements.clickAlert();
			}
			log.debug("Successfully clicked on " + arg1 + " Button");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@And("^I click the link \"([^\"]*)\"$")
	public void i_click_the(String arg1) throws Throwable {
		try {
			log.debug("Verify click the link " + arg1);
			SetElements.clickFirstDetailLink(arg1);
			log.debug("Successfully clicked the link " + arg1);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I Check for Success Message \"([^\"]*)\" in \"([^\"]*)\"$")
	public void i_Check_for_Success_Message_in(String arg1, String arg2) throws Throwable {
		String displayMessage = "";
		String message = arg1.replaceAll("\\s", "");
		log.debug("Verify success message: " + arg1 + " in " + arg2);
		log.debug("Message 1:" + arg1);
		try {
			displayMessage = SetElements.messageText();
			log.debug("Message 2:" + displayMessage);
			WebPageObject.getScreenShots(webDriver, iImageCounter++ + "_" + arg2, Constants.IMAGE_LOCATION,
					SetElements.setScreenShotPath(arg2)[0]);
			Assert.assertTrue("Massage comparision are different", displayMessage.contains(message));
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
		log.debug("Successfully verified: " + arg1 + " in " + arg2);
	}

	@Then("^I should see the \"([^\"]*)\" Application Page$")
	public void i_should_see_the_Application_Page(String arg1) throws Throwable {
		try {
			log.debug("Verify " + arg1 + " Application Page is loading");
			SetElements.verifyPageLoad("//h1[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully loaded " + arg1 + " Application Page");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}

	}

	@Then("^I click on square icon  on corner$")
	public void i_click_on_square_icon_on_corner() throws Throwable {
		try {
			log.debug("verify quare icon loaded");
			Thread.sleep(2000);
			SetElements.clickElementById("showLeftPush");
			log.debug("click on quare icon successfully");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@And("^I Click the \"([^\"]*)\" icon on Application Page$")
	public void i_Click_the_icon_on_Application_Page(String arg1) throws Throwable {
		try {
			Thread.sleep(2000);
			log.debug("Verify " + arg1 + " Application Page is loading");
			SetElements.clickElementByXpath("//a[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully loaded " + arg1 + " Application Page");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Given("^page scroll down$")
	public void page_scroll_down() throws Throwable {
		try {
			log.debug("Page scroll down");
			SetElements.scrolldown();
			log.debug("Successfully page scroll down");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Given("^I click on Home Page$")
	public void i_click_on_Home_Page() throws Throwable {
		try {
			log.debug("Click on Home Page");
			SetElements.clickElementByXpath("//div[contains(text(),'Home')]");
			log.debug("Successfully clicked on Home Page");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	public static int iImageCounter() {
		return iImageCounter++;
	}

	@After
	public void screenShot(Scenario scenario) {
		if (scenario.getStatus().equalsIgnoreCase("failed")) {
			try {
				scenario.embed(((TakesScreenshot) webDriver).getScreenshotAs(OutputType.BYTES), "image/png");
				if (Constants.failScenarioMessageAllow) {
					scenario.write(Constants.failScenarioMessageText);
					Constants.failScenarioMessageAllow = false;
				}
			} catch (WebDriverException somePlatformsDontSupportScreenshots) {
				System.err.println(somePlatformsDontSupportScreenshots.getMessage());
			}
		}
	}

	@Before(value = "@iCoreHomePage")
	public void Feature_iCore_Home_Page() {
		log.debug("---------------------------------------------------------------------------");
		log.debug("Feature: iCore Home Page");
	}

	@Given("^I Click the \"([^\"]*)\" icon to \"([^\"]*)\"$")
	public void i_Click_the_icon_to(String arg1, String arg2) throws Throwable {
		String xPath="//label[contains(text(),'" + arg1 + "')]";
		try {
			log.debug("Verify click the " + arg1 + " icon to " + arg2);
			SetElements.clickElementByXpath(xPath);
			log.debug("Successfully clicked the " + arg1 + " icon to " + arg1);
			WebPageObject.getScreenShots(webDriver, iImageCounter++ + "_" + arg2, Constants.IMAGE_LOCATION,
					SetElements.setScreenShotPath(arg2)[0]);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Given("^I Click \"([^\"]*)\" function id icon to \"([^\"]*)\"$")
	public void i_Click_function_id_icon_to(String arg1, String arg2) throws Throwable {
		try {
			log.debug("Verify click the " + arg1 + " icon to " + arg2);
			SetElements.clickElementById(arg1);
			log.debug("Successfully clicked the " + arg1 + " icon to " + arg1);
			WebPageObject.getScreenShots(webDriver, iImageCounter++ + "_" + arg2, Constants.IMAGE_LOCATION,
					SetElements.setScreenShotPath(arg2)[0]);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Given("^I Click the \"([^\"]*)\" icon in \"([^\"]*)\"$")
	public void i_Click_the_icon_in(String arg1, String arg2) throws Throwable {
		try {
			log.debug("Verify click the " + arg1 + " icon in " + arg2);
			SetElements.clickElementByXpath("//div[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully clicked the " + arg1 + " icon in " + arg1);
			WebPageObject.getScreenShots(webDriver, iImageCounter++ + "_" + arg2, Constants.IMAGE_LOCATION,
					SetElements.setScreenShotPath(arg2)[0]);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I should see the \"([^\"]*)\" page to \"([^\"]*)\"$")
	public void i_should_see_the_page_to(String arg1, String arg2) throws Throwable {
		try {
			log.debug("Verify " + arg1 + " page is loading to " + arg2);
			SetElements.verifyPageLoad("//h1[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully loaded " + arg1 + " page to " + arg2);
			WebPageObject.getScreenShots(webDriver, iImageCounter++ + "_" + arg2, Constants.IMAGE_LOCATION,
					SetElements.setScreenShotPath(arg2)[0]);
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@Then("^I \"([^\"]*)\" data criteria of \"([^\"]*)\"$")
	public void i_data_criteria_of(String arg1, String arg2, DataTable table) throws Throwable {
		try {
			List<List<String>> data = table.raw();
			log.debug("Verify fill search criteria of " + arg2);
			for (int i = 1; i < data.size(); i++) {
				String elementType = data.get(i).get(3).toLowerCase();
				String option = data.get(i).get(2).toLowerCase();
				switch (elementType) {
				case "dropdown":
					String[] optionValues = option.split(",");
					String optionValueOne = optionValues[0].toLowerCase();
					String optionValueTwo = optionValues[1].toLowerCase();
					switch (optionValueOne) {
					case "name":
						if (optionValueTwo.equals("index")) {
							SetElements.SelectNamedDropDownByIndex(data.get(i).get(0),
									Integer.parseInt(data.get(i).get(1)));
						}
						if (optionValueTwo.equals("value")) {
							SetElements.SelectNamedDropDownByValue(data.get(i).get(0), (data.get(i).get(1)));
						}
						break;
					case "id":
						if (optionValueTwo.equals("index")) {
							SetElements.SelectDropDownByIndex(data.get(i).get(0), Integer.parseInt(data.get(i).get(1)));
						}
						if (optionValueTwo.equals("value")) {
							SetElements.SelectIDDropDownByValue(data.get(i).get(0), (data.get(i).get(1)));
						}
						break;
					case "xpath":
						if (optionValueTwo.equals("index")) {
							SetElements.SelectXpathDropDownByIndex(data.get(i).get(0), Integer.parseInt(data.get(i).get(1)));
						}
						if (optionValueTwo.equals("value")) {
							SetElements.SelectXpathDropDownByValue(data.get(i).get(0), (data.get(i).get(1)));
						}
						break;
					}
					break;
				case "click":
					switch (option) {
					case "id":
						SetElements.clickElementById(data.get(i).get(0));
						Thread.sleep(1000);
						break;
					case "name":
						SetElements.clickElementByName(data.get(i).get(0));
						Thread.sleep(1000);
						break;
					case "xpath":
						SetElements.clickElementByXpath(data.get(i).get(0));
						Thread.sleep(1000);
						break;
					}
					break;
				case "textbox":
					switch (option) {
					case "id":
						SetElements.setElement(Constants.TYPE_TEXT, data.get(i).get(1), data.get(i).get(0));
						break;
					case "name":
						SetElements.setElementByName(Constants.TYPE_TEXT, data.get(i).get(1), data.get(i).get(0));
						break;
					case "xpath":
						SetElements.setElementByXpath(Constants.TYPE_TEXT, data.get(i).get(1), data.get(i).get(0));
						break;
					}
					break;
				case "calendar":
					if ((data.get(i).get(2).toLowerCase()).equals("date,time")) {
						String[] datetimeValue = data.get(i).get(1).split(",");
						setTimeDateInCalendar(Integer.parseInt(datetimeValue[0]), "00:00:00");
					}
					if ((data.get(i).get(2).toLowerCase()).equals("date")) {
						String dateValue = data.get(i).get(1);
						selectDateInCalendar(dateValue);
					}
					break;
				}
			}
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_fill criteria of " + arg2,
					Constants.IMAGE_LOCATION, SetElements.setScreenShotPath(arg2)[0]);
			log.debug("Successfully filled search criteria of " + arg2);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	// calculate dates and click

	public void selectDateInCalendar(String changeDateCount) throws Exception {
		try {
			DateFormat year = new SimpleDateFormat("yyyy");
			DateFormat month = new SimpleDateFormat("MM");
			DateFormat day = new SimpleDateFormat("dd");
			Date date = new Date();
			String selectDate = null;
			int yearNumber = Integer.parseInt(year.format(date));
			int previousMonth = Integer.parseInt(month.format(date)) - 1;
			// String previousMonthtext = String.format("%02d", previousMonth);
			// String
			// selectDate=String.format("%02d",Integer.parseInt(day.format(date))-1);
			switch (changeDateCount) {
			case "0":
			case "-1":
				selectDate = Integer.toString(Integer.parseInt(day.format(date)) - Integer.parseInt(changeDateCount));
				// String datetext = null;
				if (Integer.parseInt(selectDate) > 0) {
					selectDateInCalender(selectDate, "//table/tbody/tr/td/table/tbody/tr");
					// String
					// monthtext=String.format("%02d",Integer.parseInt(month.format(date)));
					// datetext=selectDate+"-"+monthtext+"-"+yearNumber;
					// SetElements.setElementByName(Constants.TYPE_TEXT,
					// datetext,
					// "REPORT_DATE");
				} else {
					switch (previousMonth) {
					case 1:
					case 3:
					case 5:
					case 7:
					case 8:
					case 10:
						// datetext="31-"+previousMonthtext+"-"+year;
						// SetElements.setElementByName(Constants.TYPE_TEXT,
						// datetext, "REPORT_DATE");
						// break;
					case 12:
						selectMonthDateInCalender("31", "//table/tbody/tr/td/table/tbody/tr");
						// String
						// yeartext=Integer.toString(Integer.parseInt(year.format(date))-1);
						// datetext="31-"+previousMonthtext+"-"+year;
						// SetElements.setElementByName(Constants.TYPE_TEXT,
						// datetext, "REPORT_DATE");
						break;
					case 4:
					case 6:
					case 9:
					case 11:
						selectMonthDateInCalender("30", "//table/tbody/tr/td/table/tbody/tr");
						// datetext="30"+previousMonthtext+"-"+year;
						// SetElements.setElementByName(Constants.TYPE_TEXT,
						// datetext, "REPORT_DATE");
						break;
					case 2:
						if (((yearNumber % 4 == 0) && !(yearNumber % 100 == 0)) || (yearNumber % 400 == 0)) {
							// datetext="29"+previousMonthtext+"-"+year;
							// SetElements.setElementByName(Constants.TYPE_TEXT,
							// datetext, "REPORT_DATE");
							selectMonthDateInCalender("29", "//table/tbody/tr/td/table/tbody/tr");
						} else {
							// datetext="28"+previousMonthtext+"-"+year;
							// SetElements.setElementByName(Constants.TYPE_TEXT,
							// datetext, "REPORT_DATE");
							selectMonthDateInCalender("28", "//table/tbody/tr/td/table/tbody/tr");
						}
						break;
					default:
						log.error("Invalid month.");
						break;

					}
				}
				break;
			case "+1":
				selectDate = Integer.toString(Integer.parseInt(day.format(date)) + Integer.parseInt(changeDateCount));
				int currentMonth = Integer.parseInt(month.format(date));
				// String datetext = null;
				if (Integer.parseInt(selectDate) <= 28) {
					selectDateInCalender(selectDate, "//table/tbody/tr/td/table/tbody/tr");
					// String
					// monthtext=String.format("%02d",Integer.parseInt(month.format(date)));
					// datetext=selectDate+"-"+monthtext+"-"+yearNumber;
					// SetElements.setElementByName(Constants.TYPE_TEXT,
					// datetext,
					// "REPORT_DATE");
				}
				if (Integer.parseInt(selectDate) == 31 && (currentMonth == 1 || currentMonth == 3 || currentMonth == 5
						|| currentMonth == 7 || currentMonth == 8 || currentMonth == 10 || currentMonth == 12)) {
					selectDateInCalender(selectDate, "//table/tbody/tr/td/table/tbody/tr");
				}
				if (Integer.parseInt(selectDate) == 30
						&& (currentMonth == 4 || currentMonth == 6 || currentMonth == 9 || currentMonth == 11)) {
					selectDateInCalender(selectDate, "//table/tbody/tr/td/table/tbody/tr");
				}
				if (Integer.parseInt(selectDate) == 29 && currentMonth == 2
						&& (((yearNumber % 4 == 0) && !(yearNumber % 100 == 0)) || (yearNumber % 400 == 0))) {
					selectDateInCalender(selectDate, "//table/tbody/tr/td/table/tbody/tr");
				} else {
					selectMonthDateInCalender("1", "//table/tbody/tr/td/table/tbody/tr");
				}
				break;
			}

		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}

	}

	// set time,calculate dates and click

	public void setTimeDateInCalendar(int previousDateCount, String time) throws Exception {
		try {
			DateFormat year = new SimpleDateFormat("yyyy");
			DateFormat month = new SimpleDateFormat("MM");
			DateFormat day = new SimpleDateFormat("dd");
			Date date = new Date();
			int yearNumber = Integer.parseInt(year.format(date));
			int previousMonth = Integer.parseInt(month.format(date)) - 1;
			// String previousMonthtext = String.format("%02d", previousMonth);
			// String
			// selectDate=String.format("%02d",Integer.parseInt(day.format(date))-1);
			String selectDate = Integer.toString(Integer.parseInt(day.format(date)) - previousDateCount);
			// String datetext = null;
			if (Integer.parseInt(selectDate) > 0) {
				setTimeDateInCalender(selectDate, "//table/tbody/tr/td/table/tbody/tr", "00:00:01");
				// String
				// monthtext=String.format("%02d",Integer.parseInt(month.format(date)));
				// datetext=selectDate+"-"+monthtext+"-"+yearNumber;
				// SetElements.setElementByName(Constants.TYPE_TEXT, datetext,
				// "REPORT_DATE");
			} else {
				switch (previousMonth) {
				case 1:
				case 3:
				case 5:
				case 7:
				case 8:
				case 10:
					// datetext="31-"+previousMonthtext+"-"+year;
					// SetElements.setElementByName(Constants.TYPE_TEXT,
					// datetext, "REPORT_DATE");
					// break;
				case 12:
					setTimeMonthDateInCalender("31", "//table/tbody/tr/td/table/tbody/tr", "00:00:01");
					// String
					// yeartext=Integer.toString(Integer.parseInt(year.format(date))-1);
					// datetext="31-"+previousMonthtext+"-"+year;
					// SetElements.setElementByName(Constants.TYPE_TEXT,
					// datetext, "REPORT_DATE");
					break;
				case 4:
				case 6:
				case 9:
				case 11:
					setTimeMonthDateInCalender("30", "//table/tbody/tr/td/table/tbody/tr", "00:00:01");
					// datetext="30"+previousMonthtext+"-"+year;
					// SetElements.setElementByName(Constants.TYPE_TEXT,
					// datetext, "REPORT_DATE");
					break;
				case 2:
					if (((yearNumber % 4 == 0) && !(yearNumber % 100 == 0)) || (yearNumber % 400 == 0)) {
						// datetext="29"+previousMonthtext+"-"+year;
						// SetElements.setElementByName(Constants.TYPE_TEXT,
						// datetext, "REPORT_DATE");
						setTimeMonthDateInCalender("29", "//table/tbody/tr/td/table/tbody/tr", "00:00:01");
					} else {
						// datetext="28"+previousMonthtext+"-"+year;
						// SetElements.setElementByName(Constants.TYPE_TEXT,
						// datetext, "REPORT_DATE");
						setTimeMonthDateInCalender("28", "//table/tbody/tr/td/table/tbody/tr", "00:00:01");
					}
					break;
				default:
					log.error("Invalid month.");
					break;

				}
			}
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}

	}

	// Select date from new window calendar
	public void selectDateInCalender(String date, String xPath) throws InterruptedException {

		// Store the current window handle
		String winHandleBefore = webDriver.getWindowHandle();

		// Switch to new window opened
		for (String winHandle : webDriver.getWindowHandles()) {
			webDriver.switchTo().window(winHandle);
		}

		// Perform the actions on new window
		clickDateInCalendar(date, xPath);

		// Switch back to original browser (first window)
		webDriver.switchTo().window(winHandleBefore);
		webDriver.switchTo().frame("topFrame");

	}

	// Select month and date from new window calendar
	public void selectMonthDateInCalender(String date, String xPath) throws InterruptedException {
		// Store the current window handle
		String winHandleBefore = webDriver.getWindowHandle();

		// Switch to new window opened
		for (String winHandle : webDriver.getWindowHandles()) {
			webDriver.switchTo().window(winHandle);
		}

		// Perform the actions on new window

		SetElements.clickElementByXpath("//table/tbody/tr/td/table/tbody/tr/td/a[2]");

		clickDateInCalendar(date, xPath);

		// Switch back to original browser (first window)
		webDriver.switchTo().window(winHandleBefore);
		webDriver.switchTo().frame("topFrame");
	}

	/**
	 * Click date in Calendar
	 *
	 */
	public void clickDateInCalendar(String sMatchString, String xPath) throws InterruptedException {

		List<WebElement> tr_collection = webDriver.findElements(By.xpath(xPath));
		int row_num = 0;
		boolean isFound = false;
		int i = 0;
		WebElement trElement = null;
		while (!isFound) {
			trElement = tr_collection.get(i);
			List<WebElement> td_collection = trElement.findElements(By.xpath("td"));
			int col_num = 1;
			for (WebElement tdElement : td_collection) {
				if (tdElement.getText().equals(sMatchString)) {
					isFound = true;
					SetElements.clickElementByXpath("//table/tbody/tr[" + row_num + "]/td[" + col_num + "]/a");
					break;
				}
				col_num++;
			}
			i++;
			row_num++;
		}
	}

	// set time and date from new window calendar
	public void setTimeDateInCalender(String date, String xPath, String time) throws InterruptedException {

		// Store the current window handle
		String winHandleBefore = webDriver.getWindowHandle();

		// Switch to new window opened
		for (String winHandle : webDriver.getWindowHandles()) {
			webDriver.switchTo().window(winHandle);
		}

		// Perform the actions on new window
		Thread.sleep(1000);
		SetElements.setElementByXpath(Constants.TYPE_TEXT, time, "//table/tbody/tr/td/table/tbody/tr[8]/td/font/input");
		clickDateInCalendar(date, xPath);

		// Switch back to original browser (first window)
		webDriver.switchTo().window(winHandleBefore);
		webDriver.switchTo().frame("topFrame");

	}

	// Set time,month and date from new window calendar
	public void setTimeMonthDateInCalender(String date, String xPath, String time) throws InterruptedException {
		// Store the current window handle
		String winHandleBefore = webDriver.getWindowHandle();

		// Switch to new window opened
		for (String winHandle : webDriver.getWindowHandles()) {
			webDriver.switchTo().window(winHandle);
		}

		// Perform the actions on new window
		Thread.sleep(1000);
		SetElements.setElementByXpath(Constants.TYPE_TEXT, time, "//table/tbody/tr/td/table/tbody/tr[8]/td/font/input");
		SetElements.clickElementByXpath("//table/tbody/tr/td/table/tbody/tr/td/a[2]");
		clickDateInCalendar(date, xPath);

		// Switch back to original browser (first window)
		webDriver.switchTo().window(winHandleBefore);
		webDriver.switchTo().frame("topFrame");
	}

	@Then("^navigate to previous page$")
	public void navigate_to_previous_page() throws Throwable {
		try {
			log.debug("Verify navigate to previous page");
			Thread.sleep(10000);
			SetElements.navigateToBack();
			log.debug("Successfully navigated to previous page");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I click on \"([^\"]*)\" button in \"([^\"]*)\"$")
	public void i_click_on_button_in(String arg1, String arg2, DataTable table) throws Throwable {
		try {
			List<List<String>> data = table.raw();
			Thread.sleep(1000);
			log.debug("Verify click " + arg1 + " button in " + arg2);
			for (int i = 1; i < data.size(); i++) {
				String option = data.get(i).get(1).toLowerCase();
				switch (option) {
				case "id":
					SetElements.clickElementById(data.get(i).get(0));
					break;
				case "name":
					SetElements.clickElementByName(data.get(i).get(0));
					break;
				case "xpath":
					SetElements.clickElementByXpath(data.get(i).get(0));
					break;
				}
			}
			if (SetElements.isAlertPresent()) {
				SetElements.clickAlert();
			}
			log.debug("Successfully clicked " + arg1 + " button in " + arg2);
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@And("^I close the console$")
	public void i_close_the_console() throws Throwable {
		try {
			log.debug("Verify close the console");
			Thread.sleep(3000);
			webDriver.quit();
			WebDriverInitializer.initialized = false;
			log.debug("Successfully closed the console");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Given("^I verify \"([^\"]*)\" title in \"([^\"]*)\"$")
	public void i_verify_title_in(String arg1, String arg2) throws Throwable {
		String title = SetElements.getTitle();
		log.debug("Verify " + arg1 + " title in " + arg2);
		try {
			if (!title.equals(arg1)) {
				Assert.assertTrue("Page title is mismatched", false);
			}
			log.debug("Successfully verified " + arg1 + " title in " + arg2);
		} catch (AssertionError e) {
			log.error("Error:", e);
		}
		WebPageObject.getScreenShots(webDriver, iImageCounter++ + "_Verify title", Constants.IMAGE_LOCATION,
				SetElements.setScreenShotPath(arg2)[0]);
	}

	@Given("^I upload file in \"([^\"]*)\"$")
	public void i_upload_file_in(String arg1, DataTable table) throws Throwable {
		List<List<String>> data = table.raw();
		String projectPath=System.getProperty("user.dir");
		log.debug("Project path: "+projectPath);
		log.debug("Verify upload file in "+arg1);
		try {
			for (int i = 1; i < data.size(); i++) {
				String option = data.get(i).get(2).toLowerCase();
				switch (option) {
				case "id":
					SetElements.setElement(Constants.TYPE_TEXT, projectPath+data.get(i).get(1), data.get(i).get(0));
					break;
				case "name":
					SetElements.setElementByName(Constants.TYPE_TEXT, projectPath+data.get(i).get(1), data.get(i).get(0));
					break;
				case "xpath":
					SetElements.setElementByXpath(Constants.TYPE_TEXT, projectPath+data.get(i).get(1), data.get(i).get(0));
					break;
				}
			}
			log.debug("Successfully Verified upload file in "+arg1);
		} catch (Exception e) {
			log.error("Error:", e);
		}
	}

	public static void modifyText(String updateID, String updateText, File path) {
		ArrayList<String> writeToFile = new ArrayList<String>();

		try (BufferedReader BR = new BufferedReader(new FileReader(path))) {
			String readLine = "";

			while ((readLine = BR.readLine()) != null) {

				// Processing the Strings with "$MerchantId"
				if (readLine.contains(updateID)) {
					int begin = readLine.indexOf("'");
					int end = readLine.lastIndexOf("'");

					String change = readLine.substring(begin + 1, end);
					readLine = readLine.replace(change, updateText);
				}
				writeToFile.add(readLine);
			}
		} catch (IOException ex) {
			log.error(ex);
		}

		try (FileWriter fw = new FileWriter(path); BufferedWriter bw = new BufferedWriter(fw)) {

			for (String s : writeToFile) {
				fw.write(s + "\n");
			}
			fw.flush();
			bw.flush();
			// Clear the arraylist which contains the current file data to store
			// new file data.
			writeToFile.clear();
			log.debug("Successfully verified modify MerchantId");
		} catch (IOException ex) {
			log.error(ex);
		}

	}

}
