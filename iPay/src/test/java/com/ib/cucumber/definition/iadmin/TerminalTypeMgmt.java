package com.ib.cucumber.definition.iadmin;

import org.apache.log4j.Logger;
import org.openqa.selenium.WebDriver;

import com.ib.cucumber.definition.common.CommonSteps;

import cucumber.api.java.Before;

public class TerminalTypeMgmt {
	
	private WebDriverInitializer webDriverInitializer;
    WebDriver webDriver=null;
    Logger log = Logger.getLogger("LOG");
    
	public TerminalTypeMgmt (WebDriverInitializer webDriverInitializer) {	
    	this.webDriverInitializer = webDriverInitializer;    
    	webDriver=webDriverInitializer.getDriver();	   
    }
	
	@Before(value="@TerminalTypeMgmt")
	public void Feature_Terminal_Type_Mgmt(){
		log.debug("---------------------------------------------------------------------------");
		CommonSteps.iImageCounter=1;
		log.debug("Testing iAdmin Terminal Type Management Functionalites");
	}

}
