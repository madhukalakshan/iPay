package com.ib.cucumber.common;

import static org.junit.Assert.assertTrue;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.NoAlertPresentException;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.UnhandledAlertException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.ib.cucumber.pageobject.WebPageObject;

public class SetElements extends WebPageObject {

	static Logger log = Logger.getLogger("LOG");
	public static boolean exit=true;

	public SetElements(WebDriver driver) {
		super(driver);

	}

	public static void setElement(String sType, String sText, String sId) {

		if (!sType.equalsIgnoreCase("C")) {

			if (!Validation.isEmpty(sText)) {

				if (Constants.TYPE_TEXT.equalsIgnoreCase(sType)) {
					SetElements.waitElementVisibleById(sId, Constants.TIME_OUT_PERIOD);
					driver.findElement(By.id(sId)).clear();
					driver.findElement(By.id(sId)).sendKeys(sText);
				}

				if (Constants.TYPE_DROP_DOWN.equalsIgnoreCase(sType)) {
					SetElements.waitElementVisibleById(sId, Constants.TIME_OUT_PERIOD);
					Select DropDown = new Select(driver.findElement(By.id(sId))); // 2
					DropDown.selectByValue(sText);
				}

				if (Constants.TYPE_RADIO_BOX.equalsIgnoreCase(sType)) {
					List<WebElement> rdBtn = driver.findElements(By.id(sId));
					int iSize = rdBtn.size();
					System.out.println("rdBtn.size() ================ " + iSize);
					// Start the loop from first Check Box to last Check Boxe
					for (int i = 0; i < iSize; i++) {
						// Store the Check Box name to the string variable,
						// using 'Value' attribute
						String sValue = rdBtn.get(i).getAttribute("value");
						System.out.println("sValue " + sValue);
						System.out.println("sText " + sText);
						// Select the Check Box it the value of the Check Box is
						// same what you are looking for
						if (sValue.equalsIgnoreCase(sText)) {
							rdBtn.get(i).click();
							break;
						}
					}
				}

			}

		} else if (Constants.TYPE_CHECK_BOX.equalsIgnoreCase(sType))

		{

			SetElements.waitElementVisibleById(sId, Constants.TIME_OUT_PERIOD);
			driver.findElement(By.id(sId)).click();
		} else if (Constants.TYPE_RADIO_BOX.equalsIgnoreCase(sType)) {
			List<WebElement> rdBtn = driver.findElements(By.id(sId));
			int iSize = rdBtn.size();

			// Start the loop from first Check Box to last Check Boxe
			for (int i = 0; i < iSize; i++) {
				// Store the Check Box name to the string variable, using
				// 'Value' attribute
				String sValue = rdBtn.get(i).getAttribute("value");
				// Select the Check Box it the value of the Check Box is same
				// what you are looking for
				if (sValue.equalsIgnoreCase(sText)) {
					rdBtn.get(i).click();
					break;
				}
			}
			//
		}

	}

	public static void setElementByName(String sType, String sText, String sName) {

		if (!sType.equalsIgnoreCase("C")) {

			if (!Validation.isEmpty(sText)) {

				if (Constants.TYPE_TEXT.equalsIgnoreCase(sType)) {
					SetElements.waitElementVisibleByName(sName, Constants.TIME_OUT_PERIOD);
					driver.findElement(By.name(sName)).clear();
					driver.findElement(By.name(sName)).sendKeys(sText);
				}

				if (Constants.TYPE_DROP_DOWN.equalsIgnoreCase(sType)) {
					SetElements.waitElementVisibleByName(sName, Constants.TIME_OUT_PERIOD);
					Select DropDown = new Select(driver.findElement(By.name(sName))); // 2
					DropDown.selectByValue(sText);
				}

				if (Constants.TYPE_RADIO_BOX.equalsIgnoreCase(sType)) {
					List<WebElement> rdBtn = driver.findElements(By.name(sName));
					int iSize = rdBtn.size();
					System.out.println("rdBtn.size() ================ " + iSize);
					// Start the loop from first Check Box to last Check Boxe
					for (int i = 0; i < iSize; i++) {
						// Store the Check Box name to the string variable,
						// using 'Value' attribute
						String sValue = rdBtn.get(i).getAttribute("value");
						System.out.println("sValue " + sValue);
						System.out.println("sText " + sText);
						// Select the Check Box it the value of the Check Box is
						// same what you are looking for
						if (sValue.equalsIgnoreCase(sText)) {
							rdBtn.get(i).click();
							break;
						}
					}
				}

			}

		} else if (Constants.TYPE_CHECK_BOX.equalsIgnoreCase(sType))

		{

			SetElements.waitElementVisibleByName(sName, Constants.TIME_OUT_PERIOD);
			driver.findElement(By.name(sName)).click();
		} else if (Constants.TYPE_RADIO_BOX.equalsIgnoreCase(sType)) {
			List<WebElement> rdBtn = driver.findElements(By.name(sName));
			int iSize = rdBtn.size();
			System.out.println("rdBtn.size() ================ " + iSize);
			// Start the loop from first Check Box to last Check Boxe
			for (int i = 0; i < iSize; i++) {
				// Store the Check Box name to the string variable, using
				// 'Value' attribute
				String sValue = rdBtn.get(i).getAttribute("value");
				System.out.println("sValue " + sValue);
				System.out.println("sText " + sText);
				// Select the Check Box it the value of the Check Box is same
				// what you are looking for
				if (sValue.equalsIgnoreCase(sText)) {
					rdBtn.get(i).click();
					break;
				}
			}
			//
		}

	}

	public static void setElementByXpath(String sType, String sText, String sXpath) {

		if (!sType.equalsIgnoreCase("C")) {

			if (!Validation.isEmpty(sText)) {

				if (Constants.TYPE_TEXT.equalsIgnoreCase(sType)) {
					SetElements.waitElementVisibleByXpath(sXpath);
					driver.findElement(By.xpath(sXpath)).clear();
					driver.findElement(By.xpath(sXpath)).sendKeys(sText);
				}

				if (Constants.TYPE_DROP_DOWN.equalsIgnoreCase(sType)) {
					SetElements.waitElementVisibleByXpath(sXpath);
					Select DropDown = new Select(driver.findElement(By.xpath(sXpath))); // 2
					DropDown.selectByValue(sText);
				}

				if (Constants.TYPE_RADIO_BOX.equalsIgnoreCase(sType)) {
					List<WebElement> rdBtn = driver.findElements(By.xpath(sXpath));
					int iSize = rdBtn.size();
					System.out.println("rdBtn.size() ================ " + iSize);
					// Start the loop from first Check Box to last Check Boxe
					for (int i = 0; i < iSize; i++) {
						// Store the Check Box name to the string variable,
						// using 'Value' attribute
						String sValue = rdBtn.get(i).getAttribute("value");
						System.out.println("sValue " + sValue);
						System.out.println("sText " + sText);
						// Select the Check Box it the value of the Check Box is
						// same what you are looking for
						if (sValue.equalsIgnoreCase(sText)) {
							rdBtn.get(i).click();
							break;
						}
					}
				}

			}

		} else if (Constants.TYPE_CHECK_BOX.equalsIgnoreCase(sType))

		{

			SetElements.waitElementVisibleByXpath(sXpath);
			driver.findElement(By.xpath(sXpath)).click();
		} else if (Constants.TYPE_RADIO_BOX.equalsIgnoreCase(sType)) {
			List<WebElement> rdBtn = driver.findElements(By.xpath(sXpath));
			int iSize = rdBtn.size();
			System.out.println("rdBtn.size() ================ " + iSize);
			// Start the loop from first Check Box to last Check Boxe
			for (int i = 0; i < iSize; i++) {
				// Store the Check Box name to the string variable, using
				// 'Value' attribute
				String sValue = rdBtn.get(i).getAttribute("value");
				System.out.println("sValue " + sValue);
				System.out.println("sText " + sText);
				// Select the Check Box it the value of the Check Box is same
				// what you are looking for
				if (sValue.equalsIgnoreCase(sText)) {
					rdBtn.get(i).click();
					break;
				}
			}
			//
		}

	}

	public static boolean visibleByXpath(String xPath, long TimeOutSeconds) {
		try {
			WebDriverWait wait = new WebDriverWait(driver, TimeOutSeconds);
			if (driver.findElement(By.xpath(xPath)).isDisplayed()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e1) {
			log.error("Error:", e1);
			return false;
		}
	}

	public static void waitElementVisibleById(String sId, long TimeOutSeconds) {
		WebDriverWait wait = new WebDriverWait(driver, TimeOutSeconds);
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.id(sId)));
	}

	public static void waitElementVisibleByName(String sName, long TimeOutSeconds) {
		WebDriverWait wait = new WebDriverWait(driver, TimeOutSeconds);
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.name(sName)));
	}

	public static void waitElementVisibleByLinkText(String sLinkText, long TimeOutSeconds) {
		WebDriverWait wait = new WebDriverWait(driver, TimeOutSeconds);
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.linkText(sLinkText)));
	}

	public static void waitElementVisibleByCssSelector(String sCssSelector, long TimeOutSeconds) {
		WebDriverWait wait = new WebDriverWait(driver, TimeOutSeconds);
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(sCssSelector)));
	}

	public static void waitElementVisibleByXpath(String xPath) {
		WebDriverWait wait = new WebDriverWait(driver, Constants.TIME_OUT_PERIOD);
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(xPath)));
	}

	public static void waitElementVisibleByTagName(String sTagName, long TimeOutSeconds) {
		WebDriverWait wait = new WebDriverWait(driver, TimeOutSeconds);
		wait.until(ExpectedConditions.visibilityOfElementLocated(By.tagName(sTagName)));
	}
	
	public static void waitElementPresenceByXpath(String xPath) {
		WebDriverWait wait = new WebDriverWait(driver, Constants.TIME_OUT_PERIOD);
		wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath(xPath)));
	}
	
	public static void waitElementClickableByXpath(String xPath) {
		WebDriverWait wait = new WebDriverWait(driver, Constants.TIME_OUT_PERIOD);
		wait.until(ExpectedConditions.elementToBeClickable(By.xpath(xPath)));
	}
	
	public static void waitElementClickableByName(String sName, long TimeOutSeconds) {
		WebDriverWait wait = new WebDriverWait(driver, TimeOutSeconds);
		wait.until(ExpectedConditions.elementToBeClickable(By.name(sName)));
	}

	public static void waitElementClickableById(String sId, long TimeOutSeconds) {
		WebDriverWait wait = new WebDriverWait(driver, TimeOutSeconds);
		wait.until(ExpectedConditions.elementToBeClickable(By.id(sId)));
	}
	
	public static void clickElementByName(String sName) {
		SetElements.waitElementClickableByName(sName, Constants.TIME_OUT_PERIOD);
		driver.findElement(By.name(sName)).click();
	}

	public static void clickElementById(String sId) {
		SetElements.waitElementClickableById(sId, Constants.TIME_OUT_PERIOD);
		driver.findElement(By.id(sId)).click();
	}

	public static void clickElementByLinkText(String sLinkText) {
		SetElements.waitElementVisibleByLinkText(sLinkText, Constants.TIME_OUT_PERIOD);
		driver.findElement(By.linkText(sLinkText)).click();
	}

	public static void clickElementByXpath(String xPath) {
		int i = 0;
		while (i < 2) {
			try {
				SetElements.waitElementPresenceByXpath(xPath);
				SetElements.waitElementVisibleByXpath(xPath);
				SetElements.waitElementClickableByXpath(xPath);
				driver.findElement(By.xpath(xPath)).click();
				log.debug("Successfully clicked on " + xPath);
				i = i + 2;
			} catch (Exception e) {
				try {
					Thread.sleep(2000);
					log.debug(i + " click failed");
					driver.findElement(By.xpath(xPath)).click();
					log.error("Error: " + e);
					i = i + 2;
				} catch (Exception e1) {
					log.debug(i + " click failed again");
					i++;
					exit=true;
					log.error("Error: " + e1);
				}
			}
		}
	}

	public static void clickElementTageName(String sTagName) {
		SetElements.waitElementVisibleByTagName(sTagName, Constants.TIME_OUT_PERIOD);
		driver.findElement(By.tagName(sTagName)).click();
	}

	public static void switchElementByName(String name) {
		SetElements.waitElementVisibleByName(name, Constants.TIME_OUT_PERIOD);
		driver.switchTo().frame(driver.findElement(By.name(name)));
	}

	public static String getElementTextById(String id) {
		SetElements.waitElementVisibleById(id, Constants.TIME_OUT_PERIOD);
		return driver.findElement(By.id(id)).getText();
	}
	
	public static String getElementTextByName(String name) {
		SetElements.waitElementVisibleByName(name, Constants.TIME_OUT_PERIOD);
		return driver.findElement(By.name(name)).getText();
	}

	public static String getElementTextByXpath(String xPath) {
		SetElements.waitElementVisibleByXpath(xPath);
		return driver.findElement(By.xpath(xPath)).getText();

	}

	public static String getElementTextByTagName(String sTagName) {
		SetElements.waitElementVisibleByTagName(sTagName, Constants.TIME_OUT_PERIOD);
		return driver.findElement(By.tagName(sTagName)).getText();

	}

	public static String getAttributeValueById(String id) {
		SetElements.waitElementVisibleById(id, Constants.TIME_OUT_PERIOD);
		return driver.findElement(By.id(id)).getAttribute("value");

	}

	public static void delayWebDriver(long Seconds) {
		driver.manage().timeouts().implicitlyWait(Seconds, TimeUnit.SECONDS);
	}

	public static boolean isCheckBoxSelected(String sId) {
		boolean bCheck = false;

		SetElements.waitElementVisibleById(sId, Constants.TIME_OUT_PERIOD);
		WebElement checkBox1 = driver.findElement(By.id(sId));
		if (checkBox1.isSelected()) {
			bCheck = true;
		}

		return bCheck;
	}

	public static void SelectDropDownByIndex(String sId, int iIndex) {
		SetElements.waitElementVisibleById(sId, Constants.TIME_OUT_PERIOD);
		Select DropDown = new Select(driver.findElement(By.id(sId))); // 2
		DropDown.selectByIndex(iIndex);
	}

	/**
	 * Click first check box element out of check box list
	 */
	public static void clickFirstCheckBoxElement() {
		List<WebElement> checkboxes = driver.findElements(By.cssSelector("input[type='checkbox']"));
		if (!checkboxes.get(0).isSelected()) {
			checkboxes.get(0).click();
		}
	}

	/**
	 * Click first Redio element out of check box list
	 */
	public static void clickFirstRedioElement() {
		List<WebElement> radio = driver.findElements(By.cssSelector("input[type='radio']"));
		radio.get(0).click();
	}

	/**
	 * Click first Detail link element out of detail link list
	 */
	public static void clickFirstDetailLink() {
		List<WebElement> links = driver.findElements(By.tagName("a"));

		for (WebElement link : links) {
			if (link.getText().equals("Details")) {
				link.click();
				break;
			}
		}
	}

	/**
	 * Click Detail link by parameter value out of detail link list :
	 * <a href="javascript://" onclick="submitformCard('2207')">Details</a>
	 */
	public static void clickDetailLinkByParam(String param) {
		driver.findElement(By.cssSelector("a[onclick*='submitformCard'][onclick*='" + param + "']")).click();
	}

	/**
	 * check for blank page
	 */
	public static void checkBlankPage() {

		try {
			WebDriverWait wait = new WebDriverWait(driver, Constants.TIME_OUT_PERIOD);
			WebElement element = wait.until(ExpectedConditions.visibilityOfElementLocated(By.tagName("div")));
		} catch (Exception e) {
			log.debug("Error :" + e);
			JavascriptExecutor jse = (JavascriptExecutor) driver;
			if (jse instanceof WebDriver) {
				jse.executeScript("window.history.go(-1)");
			} else {
				throw new IllegalStateException("This driver does not support JavaScript!");
			}
			assertTrue("Blank page", false);
		}
	}

	// --iCore
	// functions----------------------------------------------------------------------------------
	/**
	 * Click first element of List box
	 * 
	 */

	/*
	 * public static boolean clickSelectBoxItems(String tableName,String
	 * sTextToMatch ) { boolean bClicked=false; try { List<WebElement> listItems
	 * = driver.findElements(By.cssSelector("select[name='"+tableName+"']"));
	 * if(listItems.size()>0) {
	 * 
	 * SetElements.waitElementVisibleByName(sId, Constants.TIME_OUT_PERIOD);
	 * Select DropDown = new Select(driver.findElement(By.name(sId)));
	 * DropDown.selectByIndex(iIndex);
	 * 
	 * WebElement anchorlink = link.findElement(By.tagName("td"));
	 * sTemResult=anchorlink.getText(); if(sTemResult!=null &&
	 * sTemResult.contains(sMatchString.trim())) { bFound=true; break; }
	 * 
	 * for (int i = 0; i < listItems.size(); i++) //////////////// {
	 * 
	 * WebElement link = listItems.get(i);
	 * System.out.println("link.getText()"+link.getText());
	 * if(link.getText().contains(sTextToMatch)) { link.click(); bClicked=true;
	 * break; } } }else { bClicked=false; } }catch(Exception e){
	 * log.debug("Error :"+ e); } return bClicked; }
	 */

	/**
	 * Click first tree element link matching the given link-text
	 * 
	 */
	public static void clickFirstTreeItem(String sLinkText) {
		waitElementVisibleByLinkText(sLinkText, Constants.TIME_OUT_PERIOD * 2);
		List<WebElement> listItems = driver.findElements(By.cssSelector("li[role='treeitem']"));

		for (WebElement link : listItems) {
			WebElement anchorlink = link.findElement(By.tagName("a"));
			if (anchorlink != null && sLinkText.equals(anchorlink.getText())) {
				anchorlink.click();
				break;
			}
		}
	}

	/**
	 * Click first link matching the given link-text
	 * 
	 */
	public static void clickFirstDetailLink(String sLinkType) {
		boolean i = true;
		while (i) {
			try {
				log.debug("clickFirstDetailLink starting");
				waitElementVisibleByLinkText(sLinkType, Constants.TIME_OUT_PERIOD);
				List<WebElement> links = driver.findElements(By.tagName("a"));
				log.debug("links size" + links.size());
				for (WebElement link : links) {
					log.debug("link.getText():" + link.getText());
					if (link.getText().equals(sLinkType)) {
						link.click();
						log.debug("link.click()");
						i = false;
						break;
					}
				}
			} catch (Exception e) {
				try {
					SetElements.clickElementByXpath("//input[@value='Next']");
					if(exit){
						i=false;
						exit=false;
					}
					else
					    i = true;
					log.debug("Click on next button in Exception");
				} catch (Exception e1) {
					i = false;
					log.debug("Error :" + e1);
				}
			}

		}

	}

	/**
	 * Verify first link matching the given link-text
	 * 
	 */
	public static boolean verifyDetailLink(String sLinkType) {
		waitElementVisibleByLinkText(sLinkType, Constants.TIME_OUT_PERIOD * 2);
		List<WebElement> links = driver.findElements(By.tagName("a"));
		boolean i = true;

		for (WebElement link : links) {
			if (link.getText().equals(sLinkType)) {
				i = true;
				break;
			} else
				i = false;
		}
		return i;
	}

	/**
	 * Click all links matching the given link-text
	 * 
	 */
	public static void clickAllDetailLinks(String sLinkType) {
		try {
			waitElementVisibleByLinkText(sLinkType, Constants.TIME_OUT_PERIOD);

			boolean isException = true;

			while (isException) {
				Thread.sleep(1000);
				List<WebElement> links = driver.findElements(By.tagName("a"));

				log.debug("Size of links List" + links.size());

				for (WebElement link : links) {
					isException = false;

					log.debug("link GetText() " + link.getText());

					if (link.getText().equals(sLinkType)) {
						isException = true;
						link.click();
						break;
					}
				}
			}

		} catch (Exception e) {
			log.error("Error:" + e);
		}
	}

	/**
	 * Click item from an drop down from index by selecting select element by name
	 * 
	 */
	public static void SelectNamedDropDownByIndex(String sName, int iIndex) {
		SetElements.waitElementVisibleByName(sName, Constants.TIME_OUT_PERIOD);
		Select DropDown = new Select(driver.findElement(By.name(sName)));
		DropDown.selectByIndex(iIndex);

	}
	
	/**
	 * Click item from an drop down from index by selecting select element by name
	 * 
	 */
	public static void SelectXpathDropDownByIndex(String sXpath, int iIndex) {
		SetElements.waitElementVisibleByXpath(sXpath);
		Select DropDown = new Select(driver.findElement(By.xpath(sXpath)));
		DropDown.selectByIndex(iIndex);

	}

	/**
	 * Click item from an drop down from  by selecting select element by name
	 * 
	 */
	public static void clickSelectBoxItems(String sSelectBoxName, String sItemName) {
		SetElements.waitElementVisibleByName(sSelectBoxName, Constants.TIME_OUT_PERIOD);
		Select DropDown = new Select(driver.findElement(By.name(sSelectBoxName)));
		DropDown.selectByVisibleText(sItemName);

	}

	/**
	 * Click item from an drop down from value by selecting name to select an element
	 * 
	 */
	public static void SelectNamedDropDownByValue(String sName, String sValue) {
		SetElements.waitElementVisibleByName(sName, Constants.TIME_OUT_PERIOD);
		Select DropDown = new Select(driver.findElement(By.name(sName)));
		DropDown.selectByValue(sValue);

	}

	/**
	 * Click item from an drop down by selecting xpath to select an element
	 * 
	 */
	public static void SelectXpathDropDownByValue(String sXpath, String sValue) {
		SetElements.waitElementVisibleByXpath(sXpath);
		Select DropDown = new Select(driver.findElement(By.xpath(sXpath)));
		DropDown.selectByValue(sValue);

	}

	/**
	 * Click item from an drop down by selecting id to select an element
	 * 
	 */
	public static void SelectIDDropDownByValue(String sId, String sValue) {
		SetElements.waitElementVisibleById(sId, Constants.TIME_OUT_PERIOD);
		Select DropDown = new Select(driver.findElement(By.id(sId)));
		DropDown.selectByValue(sValue);
	}

	/**
	 * Click item from an drop down by selecting select element by text
	 * 
	 */
	public static void SelectNamedDropDownByText(String sName, String sText) {
		SetElements.waitElementVisibleByName(sName, Constants.TIME_OUT_PERIOD);
		Select DropDown = new Select(driver.findElement(By.name(sName)));
		DropDown.selectByVisibleText(sText);

	}

	public static void selectByPartOfVisibleText(String sName, String value) {
		String fullValue = "";
		try {
			SetElements.waitElementVisibleByTagName("option", Constants.TIME_OUT_PERIOD);
			List<WebElement> optionElements = driver.findElements(By.tagName("option"));
			SetElements.waitElementVisibleByName(sName, Constants.TIME_OUT_PERIOD);
			for (WebElement optionElement : optionElements) {
				if (optionElement.getText().contains(value)) {
					fullValue = optionElement.getText();
					break;
				}
			}
			Select DropDown = new Select(driver.findElement(By.name(sName)));
			DropDown.selectByVisibleText(fullValue);
		} catch (Exception e) {
			log.error("Error :" + e);
		}

	}

	/**
	 * Extract a displayed output from web page(table) by matching the preceding
	 * text.
	 * 
	 */
	public static String extractValueFromMessageString(String sMatchString, String sLinkText) {
		delayWebDriver(5);
		String sResult = "";
		String sTemResult = "";
		try {
			List<WebElement> listItems = driver.findElements(By.cssSelector("ol[class='msg_list']"));

			for (WebElement link : listItems) {
				WebElement anchorlink = link.findElement(By.tagName("li"));
				sTemResult = anchorlink.getText();
				if (sTemResult != null && sTemResult.contains(sMatchString.trim())) {
					sResult = sTemResult.split(sMatchString)[1].trim();
					break;
				}
			}
		} catch (Exception e) {
			log.debug("Error :" + e);
		}
		return sResult;
	}

	/**
	 * Check if a specific text is present in a table cell .
	 * 
	 */
	public static boolean extractMessageFromTable(String sMatchString) {
		delayWebDriver(10);
		boolean bFound = false;
		String sTemResult = "";
		try {
			Thread.sleep(2000);
			List<WebElement> listItems = driver.findElements(By.cssSelector("div[class='main_content']"));
			log.debug("listItems size " + listItems.size());
			for (WebElement link : listItems) {
				Thread.sleep(1000);
				WebElement anchorlink = null;
				try {
					anchorlink = link.findElement(By.tagName("td"));
					log.debug("anchorlink " + anchorlink);
					sTemResult = anchorlink.getText();
					log.debug("sTemResult " + sTemResult);
					if (sTemResult != null && sTemResult.contains(sMatchString.trim())) {
						bFound = true;
						break;
					}
				} catch (StaleElementReferenceException e1) {
					Thread.sleep(3000);
					try {
						anchorlink = link.findElement(By.tagName("td"));
						log.debug("anchorlink in StaleElementReferenceException " + anchorlink);
						sTemResult = anchorlink.getText();
						log.debug("sTemResult in StaleElementReferenceException " + sTemResult);
						if (sTemResult != null && sTemResult.contains(sMatchString.trim())) {
							bFound = true;
							break;
						}
					} catch (Exception e2) {
						log.debug("Not found " + sMatchString);
						log.error("Error: " + e2);
					}

				}

			}
		} catch (Exception e) {
			log.debug("Error :" + e);
		}
		return bFound;
	}

	/**
	 * Click on selected column cell if a specific text is present in a table
	 * cell .
	 *
	 */
	public static void clickTextTable(String sMatchString, int clickColumn, int selectColumn)
			throws InterruptedException {

		List<WebElement> tr_collection = driver.findElements(By.xpath("//table/tbody/tr"));

		boolean isFound = false;

		while (!isFound) {
			try {
				int row_num = 1;
				for (WebElement trElement : tr_collection) {
					List<WebElement> td_collection = trElement.findElements(By.xpath("td"));
					if (td_collection.get(selectColumn - 1).getText().contains(sMatchString)) {
						isFound = true;
						SetElements
								.clickElementByXpath("//table/tbody/tr[" + row_num + "]/td[" + clickColumn + "]/input");
						break;
					}
					row_num++;
				}
				if (!isFound) {
					try {
						SetElements.clickElementByXpath("//input[@value='Next']");
					} catch (Exception e1) {
						log.error("Error:", e1);
						isFound = true;
						throw (e1);
					}
				}
			} catch (Exception e) {
				try {
					SetElements.clickElementByXpath("//input[@value='Next']");
				} catch (Exception e1) {
					log.error("Error:", e1);
					isFound = false;
					throw (e);
				}
			}
		}
	}

	/**
	 * If specific text is present in cell,click on cell
	 *
	 */
	public static void clickSpecifiedTextTable(String sMatchString, String finalElement) throws InterruptedException {

		List<WebElement> tr_collection = driver.findElements(By.xpath("//div[@class='main_content']/table/tbody/tr"));

		int row_num = 1;
		boolean isFound = false;
		int i = 0;
		WebElement trElement = null;
		while (!isFound) {
			trElement = tr_collection.get(i);
			List<WebElement> td_collection = trElement.findElements(By.xpath("td"));
			int col_num = 1;
			for (WebElement tdElement : td_collection) {
				if (tdElement.getText().contains(sMatchString)) {
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

	/**
	 * Extract a displayed output from web page(list) by matching the preceding
	 * text.
	 * 
	 */
	public static boolean extractMessageFromListElement(String sMatchString) {
		//delayWebDriver(5);
		String sTemResult = "";
		String sCssSelector = "ol[class='msg_list']";
		boolean bFound = false;
		try {
			waitElementVisibleByCssSelector(sCssSelector, Constants.TIME_OUT_PERIOD);
			List<WebElement> listItems = driver.findElements(By.cssSelector(sCssSelector));

			for (WebElement link : listItems) {
				WebElement anchorlink = link.findElement(By.tagName("li"));
				sTemResult = anchorlink.getText();
				log.debug("Message1 " + sMatchString);
				log.debug("Message2 " + anchorlink);
				if (sTemResult != null && sTemResult.contains(sMatchString.trim())) {
					bFound = true;
					break;
				}
			}

		} catch (Exception e) {
			log.debug("Error :" + e);
		}
		return bFound;

	}

	// Get Message Text
	public static String messageText() {
		// delayWebDriver(10);
		String sTemResult = "";
		String sCssSelector = "ol[class='msg_list']";
		log.debug("Starting to get message text");
		try {
			// Thread.sleep(1000);
			waitElementVisibleByCssSelector(sCssSelector, 3 * Constants.TIME_OUT_PERIOD);
			List<WebElement> listItems = driver.findElements(By.cssSelector(sCssSelector));
			log.debug("List Items are :" + listItems);
			for (WebElement link : listItems) {
				WebElement anchorlink = link.findElement(By.tagName("li"));
				sTemResult = anchorlink.getText();
				log.debug("Message text in page:" + sTemResult);
			}
		} catch (UnhandledAlertException f) {
			try {
				log.debug("Starting hamdle pop up message");
				SetElements.clickAlert();
				log.debug("Successfully handled pop up message");
				List<WebElement> listItems = driver.findElements(By.cssSelector("ol[class='msg_list']"));

				for (WebElement link : listItems) {
					WebElement anchorlink = link.findElement(By.tagName("li"));
					sTemResult = anchorlink.getText();
					log.debug("Message text in page:" + sTemResult);
				}
			} catch (Exception e) {
				log.error("Error:", e);
			}
		} catch (Exception e) {
			log.debug("Getting error");
			log.debug("Error :" + e);
		}
		return sTemResult.replaceAll("\\s", "");

	}

	// --End of iCore
	// functions----------------------------------------------------------------------------------

	/*
	 * Get ID from Success Message
	 * 
	 */

	public static String getID() {
		delayWebDriver(5);
		String sTemResult = "";
		String id = "";
		try {
			List<WebElement> listItems = driver.findElements(By.cssSelector("ol[class='msg_list']"));
			for (WebElement link : listItems) {
				WebElement anchorlink = link.findElement(By.tagName("li"));
				sTemResult = anchorlink.getText();
				if (sTemResult != null) {
					id = sTemResult.replaceAll("[^0-9]", "");
				}
			}

		} catch (Exception e) {
			log.debug("Error :" + e);
		}
		return id;

	}

	/*
	 * Verify page is loaded from page heading
	 * 
	 */
	public static void verifyPageLoad(String xpath) {
		boolean accManaPagePresent = false;
		int i = 0;
		while (i < 2) {
			try {
				SetElements.waitElementPresenceByXpath(xpath);
				SetElements.waitElementVisibleByXpath(xpath);
				accManaPagePresent = driver.findElement(By.xpath(xpath)).isDisplayed();
				i = i + 2;
			} catch (Exception e) {
				log.debug("Got exception "+i+" time");
				i++;
				log.error("Error:", e);
			}
		}

		try {
			Assert.assertTrue(accManaPagePresent);
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	public static void scrolldown() {
		JavascriptExecutor jse = (JavascriptExecutor) driver;
		jse.executeScript("window.scrollBy(0,10000)", "");
	}

	// Check alert present

	public static boolean isAlertPresent() {
		try {
			driver.switchTo().alert();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// Check alert present

	public static String getTitle() {
		String title = "";
		try {
			title = driver.getTitle();
		} catch (Exception e) {
			log.error("Error: " + e);
		}
		return title;
	}

	// To click on the 'OK' button of the alert

	public static void clickAlert() {
		try {

			Alert alert = driver.switchTo().alert();
			String alertText = alert.getText();
			log.debug("Alert data: " + alertText);
			alert.accept();
		} catch (NoAlertPresentException e) {
			log.error("Error: " + e);
		}
	}

	// Navigate to back

	public static void navigateToBack() {
		driver.navigate().back();
	}

	public static String[] setScreenShotPath(String function) {
		String[] screenShot = new String[3];
		switch (function) {
		case "iAdmin Login":
			screenShot[0] = "Login\\";
			break;
		case "Maintainance":
			screenShot[0] = "iAdmin\\Main\\POS_Term_Mgmt\\";
			break;
		case "POS Terminal Management":
			screenShot[0] = "iAdmin\\Main\\POS_Term_Mgmt\\";
			break;
		case "Add POS Terminal":
			screenShot[0] = "iAdmin\\Main\\POS_Term_Mgmt\\";
			break;
		case "Approve POS Terminal":
			screenShot[0] = "iAdmin\\Main\\POS_Term_Mgmt\\";
			break;
		case "Reapply POS Terminal":
			screenShot[0] = "iAdmin\\Main\\POS_Term_Mgmt\\";
			break;
		case "Edit POS Terminal":
			screenShot[0] = "iAdmin\\Main\\POS_Term_Mgmt\\";
			break;
		case "Suspend POS Terminal":
			screenShot[0] = "iAdmin\\Main\\POS_Term_Mgmt\\";
			break;
		case "Revoke POS Terminal":
			screenShot[0] = "iAdmin\\Main\\POS_Term_Mgmt\\";
			break;
		case "Delete POS Terminal":
			screenShot[0] = "iAdmin\\Main\\POS_Term_Mgmt\\";
			break;
		case "View POS Terminal":
			screenShot[0] = "iAdmin\\Main\\POS_Term_Mgmt\\";
			break;
		case "Terminal Management":
			screenShot[0] = "iCore\\Mer_Mgmt\\Term_Mgmt\\";
			break;
		case "Link Merchant Terminal":
			screenShot[0] = "iCore\\Mer_Mgmt\\Term_Mgmt\\";
			break;
		case "Approve Merchant Terminal":
			screenShot[0] = "iCore\\Mer_Mgmt\\Term_Mgmt\\";
			break;
		case "Reapply Merchant Terminal":
			screenShot[0] = "iCore\\Mer_Mgmt\\Term_Mgmt\\";
			break;
		case "Modify Merchant Terminal":
			screenShot[0] = "iCore\\Mer_Mgmt\\Term_Mgmt\\";
			break;
		case "Suspend Merchant Terminal":
			screenShot[0] = "iCore\\Mer_Mgmt\\Term_Mgmt\\";
			break;
		case "Revoke Merchant Terminal":
			screenShot[0] = "iCore\\Mer_Mgmt\\Term_Mgmt\\";
			break;
		case "Close Merchant Terminal":
			screenShot[0] = "iCore\\Mer_Mgmt\\Term_Mgmt\\";
			break;
		case "View Merchant Terminal":
			screenShot[0] = "iCore\\Mer_Mgmt\\Term_Mgmt\\";
			break;
		case "Delete Merchant Terminal":
			screenShot[0] = "iCore\\Mer_Mgmt\\Term_Mgmt\\";
			break;
		case "Account Product Management":
			screenShot[0] = "iCore\\Acc_Mgmt\\Acc_Prod_Mgmt\\";
			break;
		case "Add Account Product":
			screenShot[0] = "iCore\\Acc_Mgmt\\Acc_Prod_Mgmt\\";
			break;
		case "Approve Account Product":
			screenShot[0] = "iCore\\Acc_Mgmt\\Acc_Prod_Mgmt\\";
			break;
		case "Reapply Account Product":
			screenShot[0] = "iCore\\Acc_Mgmt\\Acc_Prod_Mgmt\\";
			break;
		case "Edit Account Product":
			screenShot[0] = "iCore\\Acc_Mgmt\\Acc_Prod_Mgmt\\";
			break;
		case "Suspend Account Product":
			screenShot[0] = "iCore\\Acc_Mgmt\\Acc_Prod_Mgmt\\";
			break;
		case "Revoke Account Product":
			screenShot[0] = "iCore\\Acc_Mgmt\\Acc_Prod_Mgmt\\";
			break;
		case "View Account Product":
			screenShot[0] = "iCore\\Acc_Mgmt\\Acc_Prod_Mgmt\\";
			break;
		case "Account Management":
			screenShot[0] = "iCore\\Acc_Mgmt\\Acc_Mgmt\\";
			break;
		case "Add Account":
			screenShot[0] = "iCore\\Acc_Mgmt\\Acc_Mgmt\\";
			break;
		case "Approve Account":
			screenShot[0] = "iCore\\Acc_Mgmt\\Acc_Mgmt\\";
			break;
		case "Reapply Account":
			screenShot[0] = "iCore\\Acc_Mgmt\\Acc_Mgmt\\";
			break;
		case "Edit Account":
			screenShot[0] = "iCore\\Acc_Mgmt\\Acc_Mgmt\\";
			break;
		case "Suspend Account":
			screenShot[0] = "iCore\\Acc_Mgmt\\Acc_Mgmt\\";
			break;
		case "Revoke Account":
			screenShot[0] = "iCore\\Acc_Mgmt\\Acc_Mgmt\\";
			break;
		case "View Account":
			screenShot[0] = "iCore\\Acc_Mgmt\\Acc_Mgmt\\";
			break;
		case "Merchant Group Management":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Group_Mgmt\\";
			break;
		case "Add Merchant Group":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Group_Mgmt\\";
			break;
		case "Approve Merchant Group":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Group_Mgmt\\";
			break;
		case "Reapply Merchant Group":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Group_Mgmt\\";
			break;
		case "Modify Merchant Group":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Group_Mgmt\\";
			break;
		case "Suspend Merchant Group":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Group_Mgmt\\";
			break;
		case "Revoke Merchant Group":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Group_Mgmt\\";
			break;
		case "Assign Merchant Cat. Group":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Group_Mgmt\\";
			break;
		case "View Merchant Group":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Group_Mgmt\\";
			break;
		case "Close Merchant Group":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Group_Mgmt\\";
			break;
		case "Delete Merchant Group":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Group_Mgmt\\";
			break;
		case "Login to Merchant Management":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Mgmt\\";
			break;
		case "Merchant Management":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Mgmt\\";
			break;
		case "Add Merchant":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Mgmt\\";
			break;
		case "Approve Merchant":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Mgmt\\";
			break;
		case "Reapply Merchant":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Mgmt\\";
			break;
		case "Edit Merchant":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Mgmt\\";
			break;
		case "Suspend Merchant":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Mgmt\\";
			break;
		case "Revoke Merchant":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Mgmt\\";
			break;
		case "Assign Merchant Scheme":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Mgmt\\";
			break;
		case "View Merchant":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Mgmt\\";
			break;
		case "Close Merchant":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Mgmt\\";
			break;
		case "Delete Merchant":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Mgmt\\";
			break;
		case "Merchant Cat. Group Maintenance":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Cat_Main\\Mer_Cat_Grp_Main\\";
			break;
		case "Add Merchant Cat. Group":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Cat_Main\\Mer_Cat_Grp_Main\\";
			break;
		case "Manage Merchant Cat. Group":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Cat_Main\\Mer_Cat_Grp_Main\\";
			break;
		case "Merchant Cat. Code Maintenance":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Cat_Main\\Mer_Cat_Cde_Main\\";
			break;
		case "Add Merchant Cat. Code":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Cat_Main\\Mer_Cat_Cde_Main\\";
			break;
		case "Manage Merchant Cat. Code":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Cat_Main\\Mer_Cat_Cde_Main\\";
			break;
		case "Merchant Scheme Management":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Sch_Mgmt\\";
			break;
		case "Add Merchant Scheme":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Sch_Mgmt\\";
			break;
		case "Approve Merchant Scheme":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Sch_Mgmt\\";
			break;
		case "Reapply Merchant Scheme":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Sch_Mgmt\\";
			break;
		case "Edit Merchant Scheme":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Sch_Mgmt\\";
			break;
		case "Suspend Merchant Scheme":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Sch_Mgmt\\";
			break;
		case "Revoke Merchant Scheme":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Sch_Mgmt\\";
			break;
		case "View Merchant Scheme":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Sch_Mgmt\\";
			break;
		case "Delete Merchant Scheme":
			screenShot[0] = "iCore\\Mer_Mgmt\\Mer_Sch_Mgmt\\";
			break;
		case "Global Setting Mgmt":
			screenShot[0] = "iPay\\Mer_Rela\\Glb_Sett_Mgmt\\";
			break;
		case "Add Global Txn. Setting":
			screenShot[0] = "iPay\\Mer_Rela\\Glb_Sett_Mgmt\\";
			break;
		case "Approve Glob. Txn. Setting":
			screenShot[0] = "iPay\\Mer_Rela\\Glb_Sett_Mgmt\\";
			break;
		case "Reapply Glob. Txn. Setting":
			screenShot[0] = "iPay\\Mer_Rela\\Glb_Sett_Mgmt\\";
			break;
		case "Edit Glob. Txn. Setting":
			screenShot[0] = "iPay\\Mer_Rela\\Glb_Sett_Mgmt\\";
			break;
		case "Suspend Glob. Txn. Setting":
			screenShot[0] = "iPay\\Mer_Rela\\Glb_Sett_Mgmt\\";
			break;
		case "Revoke Glob. Txn. Setting":
			screenShot[0] = "iPay\\Mer_Rela\\Glb_Sett_Mgmt\\";
			break;
		case "View Glob. Txn. Setting":
			screenShot[0] = "iPay\\Mer_Rela\\Glb_Sett_Mgmt\\";
			break;
		case "Delete Glob. Txn. Setting":
			screenShot[0] = "iPay\\Mer_Rela\\Glb_Sett_Mgmt\\";
			break;
		case "Merchant Product Management":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Pro_Mgmt\\";
			break;
		case "Add Merchant Product":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Pro_Mgmt\\";
			break;
		case "Approve Merchant Product":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Pro_Mgmt\\";
			break;
		case "Reapply Merchant Product":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Pro_Mgmt\\";
			break;
		case "Suspend Merchant Product":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Pro_Mgmt\\";
			break;
		case "Delete Merchant Product":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Pro_Mgmt\\";
			break;
		case "Revoke Merchant Product":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Pro_Mgmt\\";
			break;
		case "View Merchant Product":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Pro_Mgmt\\";
			break;
		case "Edit Merchant Product":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Pro_Mgmt\\";
			break;
		case "Merchant Currency Management":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Curr_Mgmt\\";
			break;
		case "Add Merchant Currency":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Curr_Mgmt\\";
			break;
		case "Approve Merchant Currency":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Curr_Mgmt\\";
			break;
		case "Reapply Merchant Currency":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Curr_Mgmt\\";
			break;
		case "Suspend Merchant Currency":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Curr_Mgmt\\";
			break;
		case "Delete Merchant Currency":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Curr_Mgmt\\";
			break;
		case "Revoke Merchant Currency":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Curr_Mgmt\\";
			break;
		case "View Merchant Currency":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Curr_Mgmt\\";
			break;
		case "Edit Merchant Currency":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Curr_Mgmt\\";
			break;
		case "Merch. Allwd. Language Mgmt.":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_All_Lan_Mgmt\\";
			break;
		case "Add Merch. Allwd. Language":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_All_Lan_Mgmt\\";
			break;
		case "Approve Merch. Allwd. Language":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_All_Lan_Mgmt\\";
			break;
		case "Delete Merch. Allwd. Language":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_All_Lan_Mgmt\\";
			break;
		case "View Merch. Allwd. Language":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_All_Lan_Mgmt\\";
			break;
		case "Merch. Allwd. BIN Mgmt.":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_All_BIN_Mgmt\\";
			break;
		case "Add Merch. Allwd. BIN":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_All_BIN_Mgmt\\";
			break;
		case "Delete Merch. Allwd. BIN":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_All_BIN_Mgmt\\";
			break;
		case "Approve Merch. Allwd. BIN":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_All_BIN_Mgmt\\";
			break;
		case "Reapply Merch. Allwd. BIN":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_All_BIN_Mgmt\\";
			break;
		case "Edit Merch. Allwd. BIN":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_All_BIN_Mgmt\\";
			break;
		case "Suspend Merch. Allwd. BIN":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_All_BIN_Mgmt\\";
			break;
		case "Revoke Merch. Allwd. BIN":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_All_BIN_Mgmt\\";
			break;
		case "View Merch. Allwd. BIN":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_All_BIN_Mgmt\\";
			break;
		case "Merchant Category Mgmt.":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Cat_Mgmt\\";
			break;
		case "Add Merchant Category":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Cat_Mgmt\\";
			break;
		case "Edit Merchant Category":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Cat_Mgmt\\";
			break;
		case "View Merchant Category":
			screenShot[0] = "iPay\\Mer_Rela\\Mer_Cat_Mgmt\\";
			break;
		case "Business Type Mgmt":
			screenShot[0] = "iPay\\Mer_Rela\\Bus_Type_Mgmt\\";
			break;
		case "Add Business Type":
			screenShot[0] = "iPay\\Mer_Rela\\Bus_Type_Mgmt\\";
			break;
		case "Approve Business Type":
			screenShot[0] = "iPay\\Mer_Rela\\Bus_Type_Mgmt\\";
			break;
		case "Reapply Business Type":
			screenShot[0] = "iPay\\Mer_Rela\\Bus_Type_Mgmt\\";
			break;
		case "Edit Business Type":
			screenShot[0] = "iPay\\Mer_Rela\\Bus_Type_Mgmt\\";
			break;
		case "Suspend Business Type":
			screenShot[0] = "iPay\\Mer_Rela\\Bus_Type_Mgmt\\";
			break;
		case "Revoke Business Type":
			screenShot[0] = "iPay\\Mer_Rela\\Bus_Type_Mgmt\\";
			break;
		case "Delete Business Type":
			screenShot[0] = "iPay\\Mer_Rela\\Bus_Type_Mgmt\\";
			break;
		case "View Business Type":
			screenShot[0] = "iPay\\Mer_Rela\\Bus_Type_Mgmt\\";
			break;
		case "Blacklisted Card Management":
			screenShot[0] = "iPay\\Maintenance\\BlaLis_Card_Mgmt\\";
			break;
		case "Add Blacklisted Card":
			screenShot[0] = "iPay\\Maintenance\\BlaLis_Card_Mgmt\\";
			break;
		case "Edit Blacklisted Card":
			screenShot[0] = "iPay\\Maintenance\\BlaLis_Card_Mgmt\\";
			break;
		case "Delete Blacklisted Card":
			screenShot[0] = "iPay\\Maintenance\\BlaLis_Card_Mgmt\\";
			break;
		case "View Blacklisted Card":
			screenShot[0] = "iPay\\Maintenance\\BlaLis_Card_Mgmt\\";
			break;
		case "View Cart":
			screenShot[0] = "iPay\\PHP_Client\\";
			break;
		case "Products":
			screenShot[0] = "iPay\\PHP_Client\\";
			break;
		case "Transaction Management":
			screenShot[0] = "iPay\\Tran_Mgmt\\";
			break;
		case "Login to Transaction Management":
			screenShot[0] = "iPay\\Tran_Mgmt\\";
			break;
		case "Void Transaction":
			screenShot[0] = "iPay\\Tran_Mgmt\\";
			break;
		case "Batch Transactions":
			screenShot[0] = "iPay\\Tran_Mgmt\\";
			break;
		case "PreAuth To Sale":
			screenShot[0] = "iPay\\Tran_Mgmt\\";
			break;
		case "Clear Transaction":
			screenShot[0] = "iPay\\Tran_Mgmt\\";
			break;
		case "Mark Suspisious Txn":
			screenShot[0] = "iPay\\Tran_Mgmt\\";
			break;
		case "Unmark Suspisious Txn":
			screenShot[0] = "iPay\\Tran_Mgmt\\";
			break;
		case "Settle Transactions":
			screenShot[0] = "iPay\\Tran_Mgmt\\";
			break;
		case "Refund Transaction":
			screenShot[0] = "iPay\\Tran_Mgmt\\";
			break;
		case "New Merchant User Registration":
			screenShot[0] = "iPay\\NewMerchUsrRegis\\";
			break;
		case "Merchant User Registration":
			screenShot[0] = "iAdmin\\Adminstration\\UsrMgmt\\MercUsrMgmt\\";
			break;
		case "Login to Merchant User Management":
			screenShot[0] = "iAdmin\\Adminstration\\UsrMgmt\\MercUsrMgmt\\";
			break;
		case "Merchant User Management":
			screenShot[0] = "iAdmin\\Adminstration\\UsrMgmt\\MercUsrMgmt\\";
			break;
		case "Add Merchant User":
			screenShot[0] = "iAdmin\\Adminstration\\UsrMgmt\\MercUsrMgmt\\";
			break;
		case "Approve Merchant User":
			screenShot[0] = "iAdmin\\Adminstration\\UsrMgmt\\MercUsrMgmt\\";
			break;
		case "Edit Merchant User":
			screenShot[0] = "iAdmin\\Adminstration\\UsrMgmt\\MercUsrMgmt\\";
			break;
		case "Reapply Merchant User":
			screenShot[0] = "iAdmin\\Adminstration\\UsrMgmt\\MercUsrMgmt\\";
			break;
		case "Suspend Merchant User":
			screenShot[0] = "iAdmin\\Adminstration\\UsrMgmt\\MercUsrMgmt\\";
			break;
		case "Revoke Merchant User":
			screenShot[0] = "iAdmin\\Adminstration\\UsrMgmt\\MercUsrMgmt\\";
			break;
		case "Assign Roles to Merchant User":
			screenShot[0] = "iAdmin\\Adminstration\\UsrMgmt\\MercUsrMgmt\\";
			break;
		case "Approve Roles Assigned Merchant User":
			screenShot[0] = "iAdmin\\Adminstration\\UsrMgmt\\MercUsrMgmt\\";
			break;
		case "View Merchant User":
			screenShot[0] = "iAdmin\\Adminstration\\UsrMgmt\\MercUsrMgmt\\";
			break;
		case "Add Merchant API Details":
			screenShot[0] = "iPay\\Add_Merc_API_Detls\\";
			break;
		case "Login to Add Merchant API Details":
			screenShot[0] = "iPay\\Add_Merc_API_Detls\\";
			break;
		case "PHP Client":
			screenShot[0] = "iPay\\PHP_Client\\";
			break;
		case "Merchant Commission":
			screenShot[0] = "iPay\\Mer_Comm_Char\\";
			break;
		case "Merchant Charge":
			screenShot[0] = "iPay\\Mer_Comm_Char\\";
			break;
		case "iPay Home Page":
			screenShot[0] = "iPay\\iPay_Home_Page\\";
			break;
		case "Terminal Type Management":
			screenShot[0] = "iAdmin\\Term_Type_Mgmt\\";
			break;
		case "Add Terminal Type":
			screenShot[0] = "iAdmin\\Term_Type_Mgmt\\";
			break;
		case "Reject Terminal Type":
			screenShot[0] = "iAdmin\\Term_Type_Mgmt\\";
			break;
		case "Reapply Terminal Type":
			screenShot[0] = "iAdmin\\Term_Type_Mgmt\\";
			break;
		case "Edit Terminal Type":
			screenShot[0] = "iAdmin\\Term_Type_Mgmt\\";
			break;
		case "View Terminal Type":
			screenShot[0] = "iAdmin\\Term_Type_Mgmt\\";
			break;
		case "Delete Terminal Type":
			screenShot[0] = "iAdmin\\Term_Type_Mgmt\\";
			break;
		case "Approve Delete Terminal Type":
			screenShot[0] = "iAdmin\\Term_Type_Mgmt\\";
			break;
		case "Merchant On Boad":
			screenShot[0] = "iPay\\On_Board_usr_reg\\";
			break;
		case "On Bord Register new user":
			screenShot[0] = "iPay\\On_Board_usr_reg\\";
			break;
		case "Merchant Onboarding Management":
			screenShot[0] = "iPay\\On_Board_Mgmt\\";
			break;
		case "Login to Merchant Onboarding Management":
			screenShot[0] = "iPay\\On_Board_Mgmt\\";
			break;
		case "Add Online Merchant Request":
			screenShot[0] = "iPay\\On_Board_Mgmt\\";
			break;
		case "Approve Online Merchant":
			screenShot[0] = "iPay\\On_Board_Mgmt\\";
			break;
		case "Edit Online Merchant":
			screenShot[0] = "iPay\\On_Board_Mgmt\\";
			break;
		case "Virtual Terminal":
			screenShot[0] = "iPay\\Virtual_Term\\";
			break;
		case "Reapply Online Merchant":
			screenShot[0] = "iPay\\On_Board_Mgmt\\";
			break;
		case "ipay inapp":
			screenShot[0] = "iPay\\inapp_ipay\\";
			break;
		case "Add To Wallet":
			screenShot[0] = "iPay\\inapp_ipay\\";
			break;
		case "List Wallet":
			screenShot[0] = "iPay\\inapp_ipay\\";
			break;
		case "Edit Wallet":
			screenShot[0] = "iPay\\inapp_ipay\\";
			break;
		case "Add Card To Wallet":
			screenShot[0] = "iPay\\inapp_ipay\\";
			break;
		case "List Card":
			screenShot[0] = "iPay\\inapp_ipay\\";
			break;
		case "Edit Card":
			screenShot[0] = "iPay\\inapp_ipay\\";
			break;
		case "Active Card":
			screenShot[0] = "iPay\\inapp_ipay\\";
			break;
		case "Delete Card":
			screenShot[0] = "iPay\\inapp_ipay\\";
			break;	
		case "Sale Wallet Transaction":
			screenShot[0] = "iPay\\inapp_ipay\\";
			break;
		case "Transaction Status Inquiry":
			screenShot[0] = "iPay\\inapp_ipay\\";
			break;
		case "PreAuth Wallet Transaction":
			screenShot[0] = "iPay\\inapp_ipay\\";
			break;
		case "Sale Completion":
			screenShot[0] = "iPay\\inapp_ipay\\";
			break;
		case "Sale Transaction Reversal":
			screenShot[0] = "iPay\\inapp_ipay\\";
			break;
		case "Sale Transaction Timeout Reversal":
			screenShot[0] = "iPay\\inapp_ipay\\";
			break;				
		}
		return screenShot;
	}

}
