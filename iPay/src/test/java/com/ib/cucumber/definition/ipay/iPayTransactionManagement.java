package com.ib.cucumber.definition.ipay;

import static org.junit.Assert.assertTrue;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.DbManager;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;
import com.ib.cucumber.definition.iadmin.WebDriverInitializer;
import com.ib.cucumber.definition.icore.MerchantCommissionCharge;
import com.ib.cucumber.pageobject.WebPageObject;

import cucumber.api.java.Before;
import cucumber.api.java.en.Then;

public class iPayTransactionManagement {

	WebDriver webDriver;
	private WebDriverInitializer webDriverInitializer = null;
	Logger log = Logger.getLogger("LOG");
	public static String batchNumber = "32468";

	public iPayTransactionManagement(WebDriverInitializer webDriverInitializer) {
		this.webDriverInitializer = webDriverInitializer;
		webDriver = webDriverInitializer.getDriver();
	}

	@Then("^I fill the Transaction Date period$")
	public void i_fill_the_Transaction_Date_period() throws Throwable {
		try {
			log.debug("Verify fill the Transaction Date period");
			SetElements.clickElementByXpath("//a[@href='javascript: calendar1.show()']");

			DateFormat year = new SimpleDateFormat("yyyy");
			DateFormat month = new SimpleDateFormat("MM");
			DateFormat day = new SimpleDateFormat("dd");
			Date date = new Date();
			if (Integer.parseInt(day.format(date)) > 1)
				SetElements.clickElementByLinkText(
						Integer.toString(Integer.parseInt(day.format(date)) - 1).replaceFirst("^0+(?!$)", ""));
			else {
				SetElements.clickElementByLinkText("28");
				if ((Integer.parseInt(month.format(date)) - 1) > 0)
					SetElements.SelectNamedDropDownByValue("months",
							Integer.toString(Integer.parseInt(month.format(date)) - 1));
				else {
					SetElements.SelectNamedDropDownByValue("months", "12");
					SetElements.SelectNamedDropDownByValue("years",
							Integer.toString(Integer.parseInt(year.format(date)) - 1));
				}
			}
			SetElements.clickElementByXpath("//a[@href='javascript: calendar2.show()']");
			if ((Integer.parseInt(month.format(date)) + 1) < 12) {
				SetElements.SelectXpathDropDownByValue(
						"//div[@id='dynCalendar_layer_1']/table/tbody/tr[1]/td[2]/select[@name='months']",
						Integer.toString(Integer.parseInt(month.format(date)) + 1));
				SetElements.clickElementByLinkText(day.format(date).replaceFirst("^0+(?!$)", ""));
			} else {
				SetElements.SelectXpathDropDownByValue(
						"//div[@id='dynCalendar_layer_0']/table/tbody/tr[1]/td[2]/select[@name='months']",
						Integer.toString(Integer.parseInt(month.format(date))));
				SetElements.SelectXpathDropDownByValue(
						"//div[@id='dynCalendar_layer_1']/table/tbody/tr[1]/td[2]/select[@name='years']",
						Integer.toString(Integer.parseInt(year.format(date)) + 1));
				SetElements.clickElementByLinkText(day.format(date).replaceFirst("^0+(?!$)", ""));
			}

			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_fill transaction date period",
					Constants.IMAGE_LOCATION, "iPay\\Tran_Mgmt\\");
			log.debug("Successfully filled the Transaction Date period");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I click Merchant Ref ID to \"([^\"]*)\"$")
	public void i_click_Merchant_Ref_ID_to(String arg1) throws Throwable {
		boolean isFound = true;
		while (isFound) {
			try {
				log.debug("Verify click on merhant Ref ID to " + arg1);
				String function = arg1.replaceAll("\\s", "").toLowerCase();
				log.debug("Function:" + function);
				switch (function) {
				case "preauthtosale":
				case "marksuspisioustxn":
				case "unmarksuspisioustxn":
				case "refundtransaction":
					SetElements.clickElementByLinkText(iPayPHPClient.MerchantReferenceIDTwo);
					isFound = false;
					log.debug("Successfully clicked on merhant Ref ID : " + iPayPHPClient.MerchantReferenceIDTwo
							+ " to " + arg1);
					break;
				case "virtualterminal":
					log.debug("VirtualTerminal.merchantReferenceIdVT" + VirtualTerminal.merchantReferenceIdVT);
					SetElements.clickElementByLinkText(VirtualTerminal.merchantReferenceIdVT);
					isFound = false;
					log.debug("Successfully clicked on merhant Ref ID : " + VirtualTerminal.merchantReferenceIdVT
							+ " to " + arg1);
					break;
				case "cleartransaction":
					SetElements.clickElementByLinkText(iPayPHPClient.MerchantReferenceIDThree);
					isFound = false;
					log.debug("Successfully clicked on merhant Ref ID : " + iPayPHPClient.MerchantReferenceIDThree
							+ " to " + arg1);
					break;
				default:
					SetElements.clickElementByLinkText(iPayPHPClient.MerchantReferenceIDOne);
					isFound = false;
					log.debug("Successfully clicked on merhant Ref ID : " + iPayPHPClient.MerchantReferenceIDOne
							+ " to " + arg1);
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
		WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_click Merchant Ref ID to " + arg1,
				Constants.IMAGE_LOCATION, "iPay\\Tran_Mgmt\\");
	}

	@Then("^I should see the Success message in \"([^\"]*)\"$")
	public void i_should_see_the_Success_message_in(String arg1) throws Throwable {
		try {
			log.debug("Verify the Success message in " + arg1);
			Thread.sleep(2000);
			SetElements.verifyPageLoad("//h1[contains(text(),'" + arg1 + "')]");
			log.debug("Successfully verified the Success message in " + arg1);
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter++ + "_Success message in" + arg1,
					Constants.IMAGE_LOCATION, SetElements.setScreenShotPath(arg1)[0]);
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@Then("^I select Reason$")
	public void i_select_Reason() throws Throwable {
		try {
			log.debug("Verify select Reason");
			SetElements.SelectDropDownByIndex("void_reason", 1);
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_select Reason",
					Constants.IMAGE_LOCATION, "iPay\\Tran_Mgmt\\");
			log.debug("Successfully selected Reason");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}

	}

	@Then("^I should see the Success message as \"([^\"]*)\" for Batch Transactions$")
	public void i_should_see_the_Success_message_as_for_Batch_Transactions(String arg1) throws Throwable {
		try {
			batchNumber = SetElements.getID();
			log.debug("Verify success message: " + arg1 + " with batch number " + batchNumber);
			if (!SetElements.extractMessageFromListElement(arg1))
				assertTrue(arg1 + " Message not shown, No Success Message", false);
			log.debug("Successfully success message: " + arg1 + " with batch number " + batchNumber);
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_Batch Transactions",
					Constants.IMAGE_LOCATION, "iPay\\Tran_Mgmt\\");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}
	}

	@Then("^I tick the checkbox$")
	public void i_tick_the_checkbox() throws Throwable {
		try {
			log.debug("Verify tick the checkbox");
			SetElements.clickTextTable(batchNumber, 1, 3);
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_tick checkbox",
					Constants.IMAGE_LOCATION, "iPay\\Tran_Mgmt\\");
			log.debug("Successfully verified tick the checkbox");
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I should see the Success message as \"([^\"]*)\" for Settle Transactions$")
	public void i_should_see_the_Success_message_as_for_Settle_Transactions(String arg1) throws Throwable {
		try {
			Boolean trxnStatus;
			String status;
			boolean isVisible = true;
			log.debug("Verify Settle Transactions Status");
			while (isVisible) {
				try {
					Thread.sleep(5000);
					webDriver.findElement(By.xpath("//body/div[2]/table[1]/tbody/tr/td/div/img")).isDisplayed();
				} catch (Exception e) {
					isVisible = false;
				}
			}
			status = SetElements.getElementTextByXpath("//table/tbody/tr/td[6]");
			log.debug("status :" + status);
			trxnStatus = status.contains(arg1) ? true : false;
			WebPageObject.getScreenShots(webDriver, CommonSteps.iImageCounter() + "_Settle Transactions",
					Constants.IMAGE_LOCATION, "iPay\\Tran_Mgmt\\");
			Assert.assertTrue(trxnStatus);
			log.debug("Successfully verified Settle Transactions Status");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		}

	}

	@Then("^I veify DB values to \"([^\"]*)\" Void Transaction which did from \"([^\"]*)\"$")
	public void i_veify_DB_values_to_Void_Transaction_which_did_from(String arg1, String arg2) throws Throwable {
		try {
			DbManager ver = new DbManager();
			boolean isPassed = true;
			log.debug("Veify DB values to " + arg1 + " Void Transaction which did from " + arg2);
			String query = "";
			String methodType = arg2.replaceAll("\\s", "").toLowerCase();
			if (methodType.equals("virtualterminal")) {
				query = "select count(*) from ipg_transaction where merchant_reference_id='"
						+ VirtualTerminal.merchantReferenceIdVT + "' and status_code='21'";
				log.debug("Executed query in virtualterminal :" + query);
			} else {
				query = "select count(*) from ipg_transaction where merchant_reference_id='"
						+ iPayPHPClient.MerchantReferenceIDOne + "' and status_code='21'";
				log.debug("Executed query in other :" + query);
			}
			log.debug("Query in Void Transaction " + query);
			isPassed = ver.verfyDb("IPG", query, "1");
			assertTrue(isPassed);
			log.debug("Successfully veified DB values for Void Transaction");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I veify DB values for PreAuth To Sale Transaction$")
	public void i_veify_DB_values_for_PreAuth_To_Sale_Transaction() throws Throwable {
		try {
			DbManager ver = new DbManager();
			boolean isPassed = true;
			log.debug("Veify DB values for PreAuth To Sale Transaction");
			String query = "";
			query = "select count(*) from ipg_transaction where merchant_reference_id='"
					+ iPayPHPClient.MerchantReferenceIDTwo + "' and status_code='19'";
			log.debug("Query in PreAuth To Sale Transaction " + query);
			isPassed = ver.verfyDb("IPG", query, "1");
			assertTrue(isPassed);
			log.debug("Successfully veified DB values for PreAuth To Sale Transaction");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I veify DB values to \"([^\"]*)\" Clear Transaction which did from \"([^\"]*)\"$")
	public void i_veify_DB_values_to_Clear_Transaction_which_did_from(String arg1, String arg2) throws Throwable {
		try {
			DbManager ver = new DbManager();
			boolean isPassed = true;
			log.debug("Veify DB values for Clear Transaction");
			String query = "";
			String methodType = arg2.replaceAll("\\s", "").toLowerCase();
			if (methodType.equals("virtualterminal")) {
				query = "select count(*) from ipg_transaction where merchant_reference_id='"
						+ VirtualTerminal.merchantReferenceIdVT + "' and status_code='54'";
				log.debug("Executed query in virtualterminal :" + query);
			} else {
				query = "select count(*) from ipg_transaction where merchant_reference_id='"
						+ iPayPHPClient.MerchantReferenceIDThree + "' and status_code='54'";
				log.debug("Executed query in other :" + query);
			}
			log.debug("Query in Clear Transaction " + query);
			isPassed = ver.verfyDb("IPG", query, "1");
			assertTrue(isPassed);
			log.debug("Successfully veified DB values for Clear Transaction");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I veify DB values to \"([^\"]*)\" Mark Suspisious Transaction which did from \"([^\"]*)\"$")
	public void i_veify_DB_values_to_Mark_Suspisious_Transaction_which_did_from(String arg1, String arg2)
			throws Throwable {
		try {
			DbManager ver = new DbManager();
			boolean isPassed = true;
			log.debug("Veify DB values for Mark Suspisious Transaction");
			String query = "";
			String methodType = arg2.replaceAll("\\s", "").toLowerCase();
			if (methodType.equals("virtualterminal")) {
				query = "select count(*) from ipg_transaction where merchant_reference_id='"
						+ VirtualTerminal.merchantReferenceIdVT + "' and status_code='81'";
				log.debug("Executed query in virtualterminal :" + query);
			} else {
				query = "select count(*) from ipg_transaction where merchant_reference_id='"
						+ iPayPHPClient.MerchantReferenceIDTwo + "' and status_code='81'";
				log.debug("Executed query in other :" + query);
			}
			log.debug("Query in Mark Suspisious Transaction " + query);
			isPassed = ver.verfyDb("IPG", query, "1");
			assertTrue(isPassed);
			log.debug("Successfully veified DB values for Mark Suspisious Transaction");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I veify DB values to \"([^\"]*)\" Unmark Suspisious Transaction which did from \"([^\"]*)\"$")
	public void i_veify_DB_values_to_Unmark_Suspisious_Transaction_which_did_from(String arg1, String arg2)
			throws Throwable {
		try {
			DbManager ver = new DbManager();
			boolean isPassed = true;
			log.debug("Veify DB values for Unmark Suspisious Transaction");
			String query = "";
			String methodType = arg2.replaceAll("\\s", "").toLowerCase();
			if (methodType.equals("virtualterminal")) {
				query = "select count(*) from ipg_transaction where merchant_reference_id='"
						+ VirtualTerminal.merchantReferenceIdVT + "' and status_code='84'";
				log.debug("Executed query in virtualterminal :" + query);
			} else {
				query = "select count(*) from ipg_transaction where merchant_reference_id='"
						+ iPayPHPClient.MerchantReferenceIDTwo + "' and status_code='84'";
				log.debug("Executed query in other :" + query);
			}
			log.debug("Query in Unmark Suspisious Transaction " + query);
			isPassed = ver.verfyDb("IPG", query, "1");
			assertTrue(isPassed);
			log.debug("Successfully veified DB values for Unmark Suspisious Transaction");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I veify DB values to \"([^\"]*)\" Batch Transaction which did from \"([^\"]*)\"$")
	public void i_veify_DB_values_to_Batch_Transaction_which_did_from(String arg1, String arg2) throws Throwable {
		try {
			DbManager ver = new DbManager();
			boolean isPassed = true;
			log.debug("Veify DB values for Batch Transaction");
			String query = "";
			String methodType = arg2.replaceAll("\\s", "").toLowerCase();
			if (methodType.equals("virtualterminal")) {
				query = "select count(*) from ipg_transaction where merchant_reference_id='"
						+ VirtualTerminal.merchantReferenceIdVT + "' and status_code='27' and batch_number='"
						+ batchNumber + "'";
				log.debug("Executed query in virtualterminal :" + query);
			} else {
				query = "select count(*) from ipg_transaction where merchant_reference_id='"
						+ iPayPHPClient.MerchantReferenceIDTwo + "' and status_code='27' and batch_number='"
						+ batchNumber + "'";
				log.debug("Executed query in other :" + query);
			}
			log.debug("Query in Batch Transaction " + query);
			isPassed = ver.verfyDb("IPG", query, "1");
			assertTrue(isPassed);
			log.debug("Successfully veified DB values for Batch Transaction");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I veify DB values for Settle Transaction$")
	public void i_veify_DB_values_for_Settle_Transaction() throws Throwable {
		try {
			DbManager ver = new DbManager();
			boolean isPassed = true;
			List<String> query = new ArrayList<String>();
			boolean[] pass = new boolean[4];
			log.debug("Veify DB values for Settle Transaction");
			query.add(0, "select count(*) from ipg_transaction where merchant_reference_id = '"
					+ iPayPHPClient.MerchantReferenceIDTwo + "' AND status_code = '91';");
			log.debug("Query 1 in Settle Transaction " + query.get(1));
			query.add(1,
					"select count(*) from bkn_dx_trxn where de_38='" + MerchantCommissionCharge.authorisationNumberOne
							+ "' and cust_typ='CUST' and ipm_flag='1' " + "and trx_status='22';");
			log.debug("Query 2 in Settle Transaction " + query.get(2));
			query.add(2,
					"select count(*) from bkn_dx_trxn where de_38='" + MerchantCommissionCharge.authorisationNumberTwo
							+ "' and cust_typ='CUST' and ipm_flag='1' " + "and trx_status='22';");
			log.debug("Query 3 in Settle Transaction " + query.get(3));
			pass[0] = ver.verfyDb("IPG", query.get(0), "1");
			for (int i = 1; i < query.size(); i++) {
				pass[i] = ver.verfyDb("ICORE", query.get(i), "1");
			}
			for (int j = 0; j < 4; j++) {
				if (!pass[j]) {
					isPassed = pass[j];
					break;
				}
			}
			assertTrue(isPassed);
			log.debug("Successfully veified DB values for Settle Transaction");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Then("^I veify DB values for Refund Transaction$")
	public void i_veify_DB_values_for_Refund_Transaction() throws Throwable {
		try {
			DbManager ver = new DbManager();
			boolean isPassed = true;
			List<String> query = new ArrayList<String>();
			boolean[] pass = new boolean[3];
			log.debug("verify commission record");
			query.add(0, "select count(*) from ipg_transaction where status_code = '25' AND merchant_reference_id = '"
					+ iPayPHPClient.MerchantReferenceIDTwo + "' and transaction_type='4';");
			log.debug("Query 1 in Refund Transaction " + query.get(0));
			query.add(1, "select count(*) from swt_vx_trxs where auth_code='"
					+ MerchantCommissionCharge.authorisationNumberTwo + "' and trxn_typ='118' and stat_code='20'");
			log.debug("Query 2 in Refund Transaction " + query.get(1));
			query.add(2, "select count(*) from swt_vx_trxs where auth_code='"
					+ MerchantCommissionCharge.authorisationNumberTwo + "' and trxn_typ='124' and stat_code='1'");
			log.debug("Query 3 in Refund Transaction " + query.get(2));
			pass[0] = ver.verfyDb("IPG", query.get(0), "1");
			for (int i = 1; i < 3; i++) {
				pass[i] = ver.verfyDb("ISWITCH", query.get(i), "1");
			}
			for (int j = 0; j < 3; j++) {
				if (!pass[j]) {
					isPassed = pass[j];
					break;
				}
			}
			assertTrue(isPassed);
			log.debug("Successfully veified DB values for Transaction to merchant commissions");
		} catch (AssertionError e) {
			log.error("Error:", e);
			Assert.fail();
		} catch (Exception e) {
			log.error("Error:", e);
			throw (e);
		}
	}

	@Before(value = "@iPayTrxnMgmt")
	public void FeatureiPayTrxnMgmt() {
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter = 1;
		log.debug("Feature: Feature File for iPay Transaction Management");
	}

	@Before(value = "@OnboardTrxnMgmt")
	public void FeatureOnboardTrxnMgmt() {
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter = 100;
		log.debug("Feature: Feature File for iPay Transaction Management to onboarding");
	}
}
