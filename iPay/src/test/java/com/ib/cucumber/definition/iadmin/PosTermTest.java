package com.ib.cucumber.definition.iadmin;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.definition.common.CommonSteps;

import cucumber.api.DataTable;
import cucumber.api.java.Before;
import cucumber.api.java.en.Then;

public class PosTermTest {

	private WebDriverInitializer webDriverInitializer;
    WebDriver webDriver=null;
    Logger log = Logger.getLogger("LOG");
    
	public PosTermTest (WebDriverInitializer webDriverInitializer) {	
    	this.webDriverInitializer = webDriverInitializer;    
    	webDriver=webDriverInitializer.getDriver();	   
    }
	
	@Then("^I fill the Pos Creation form$")
	public void i_fill_the_Pos_Creation_form(DataTable datainformation) throws Throwable {
		try{
			List<List<String>> POSDetails = datainformation.raw();
			
			log.debug("Fill the Pos Creation form");
			SetElements.setElementByName(Constants.TYPE_TEXT, POSDetails.get(1).get(1), POSDetails.get(1).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, POSDetails.get(2).get(1), POSDetails.get(2).get(0));
			SetElements.SelectNamedDropDownByIndex(POSDetails.get(3).get(0), Integer.parseInt(POSDetails.get(3).get(1)));
			SetElements.setElementByName(Constants.TYPE_DROP_DOWN, POSDetails.get(4).get(1), POSDetails.get(4).get(0));
			SetElements.setElementByName(Constants.TYPE_DROP_DOWN, POSDetails.get(5).get(1), POSDetails.get(5).get(0) );
			//SetElements.SelectNamedDropDownByIndex(POSDetails.get(6).get(0), Integer.valueOf(POSDetails.get(6).get(1)));
			SetElements.SelectNamedDropDownByText(POSDetails.get(6).get(0), POSDetails.get(6).get(1));
			SetElements.setElementByName(Constants.TYPE_DROP_DOWN, POSDetails.get(7).get(1), POSDetails.get(7).get(0));
			SetElements.setElementByName(Constants.TYPE_DROP_DOWN, POSDetails.get(8).get(1), POSDetails.get(8).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, POSDetails.get(9).get(1), POSDetails.get(9).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, POSDetails.get(10).get(1), POSDetails.get(10).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, POSDetails.get(11).get(1), POSDetails.get(11).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, POSDetails.get(12).get(1), POSDetails.get(12).get(0));
			DateFormat year = new SimpleDateFormat("yyyy");
			DateFormat month = new SimpleDateFormat("MM");
			DateFormat day = new SimpleDateFormat("dd");
			Date date = new Date();	
			SetElements.SelectNamedDropDownByValue("InsDate",Integer.toString(Integer.parseInt(day.format(date))+1));
			String s=month.format(date);				
			SetElements.SelectNamedDropDownByValue("InsMon",s.replaceFirst("^0+(?!$)", ""));
			SetElements.SelectNamedDropDownByValue("InsYear",year.format(date));
			log.debug("Pos Creation form filled successfully");
		}
		catch(Exception e){
			log.error("Error:",e);
			throw(e);
		}
	}
	
	@Then("^I fill the POS Search form$")
	public void i_fill_the_POS_Search_form(DataTable datainformation) throws Throwable {
		try{
			List<List<String>> POSDetails = datainformation.raw();
			log.debug("Fill the Terminal Id");
			SetElements.setElementByName(Constants.TYPE_TEXT, POSDetails.get(1).get(1), POSDetails.get(1).get(0));
			log.debug("Successfully filled the Terminal Id");
		}
		catch(Exception e){
			log.error("Error:",e);
			throw(e);
		}
		
		
	}
	
	@Then("^I fill the Pos Edit form$")
	public void i_fill_the_Pos_Edit_form(DataTable datainformation) throws Throwable {
		try{
			List<List<String>> POSDetails = datainformation.raw();
			
			log.debug("Fill the Pos Edit form");
			SetElements.setElementByName(Constants.TYPE_TEXT, POSDetails.get(1).get(1), POSDetails.get(1).get(0));
			SetElements.SelectNamedDropDownByIndex(POSDetails.get(2).get(0), Integer.parseInt(POSDetails.get(2).get(1)));
			SetElements.setElementByName(Constants.TYPE_DROP_DOWN, POSDetails.get(3).get(1), POSDetails.get(3).get(0));
			//SetElements.SelectNamedDropDownByIndex(POSDetails.get(4).get(0), Integer.valueOf(POSDetails.get(4).get(1)));
			SetElements.SelectNamedDropDownByText(POSDetails.get(4).get(0), POSDetails.get(4).get(1));
			SetElements.setElementByName(Constants.TYPE_DROP_DOWN, POSDetails.get(5).get(1), POSDetails.get(5).get(0));
			SetElements.setElementByName(Constants.TYPE_DROP_DOWN, POSDetails.get(6).get(1), POSDetails.get(6).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, POSDetails.get(7).get(1), POSDetails.get(7).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, POSDetails.get(8).get(1), POSDetails.get(8).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, POSDetails.get(9).get(1), POSDetails.get(9).get(0));
			SetElements.setElementByName(Constants.TYPE_TEXT, POSDetails.get(10).get(1), POSDetails.get(10).get(0));
			log.debug("Pos Edit form filled successfully");
		}
		catch(Exception e){
			log.error("Error:",e);
			throw(e);
		}	
	}
	
	@Before(value="@POSTerminalMgmt")
	public void Feature_POS_Terminal_Mgmt(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Testing iAdmin POS Terminal Mgmt Functionalites");
	}
}
