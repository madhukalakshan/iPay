package com.ib.cucumber.common;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.PropertyConfigurator;
import org.junit.runner.JUnitCore;
import org.junit.runner.RunWith;

import com.github.mkolisnyk.cucumber.runner.AfterSuite;
import com.github.mkolisnyk.cucumber.runner.BeforeSuite;
import com.github.mkolisnyk.cucumber.runner.ExtendedCucumberOptions;

import cucumber.api.CucumberOptions;


 
/**
 * @author IBGUEST
 *
 */
/**
 * @author IBGUEST
 *
 */
@RunWith(ExtraExtendedCucumber.class)

/*@ExtendedCucumberOptions(
		 jsonReport = "reports/cucumber-json/cucumber.json",
	     jsonUsageReport = "reports/cucumber-json/usage.json",
	     overviewReport = true,
	     detailedReport = true,
	     toPDF = true,
         outputFolder = "reports/"
)*/

//@RunWith(Cucumber.class)
//@RunWith(ExtendedCucumber.class)

@ExtendedCucumberOptions(
		 jsonReport = "reports/cucumber-json/cucumber.json",
	     jsonUsageReport = "reports/cucumber-json/usage.json",
	     usageReport = true,
	     coverageReport = true,
	     detailedReport = true,
	     overviewReport = true,
	     toPDF = true,
         outputFolder = "reports/",
         screenShotLocation = "screenshots/",
         screenShotSize = "700px",
         retryCount = 0
)

@CucumberOptions(
        features = { Constants.FEATURE_FILE_LOCATION },
        /*features = "features",*/
        		 glue = {"com.ib.cucumber.pageobject"
        				 ,"com.ib.cucumber.definition.iadmin"
        	        		,"com.ib.cucumber.definition.icore"
        	        		,"com.ib.cucumber.definition.common"
        	        		,"com.ib.cucumber.definition.ipay"},
        dryRun = false,
        plugin = {
        		  "html:reports/cucumber-html",
                  "json:reports/cucumber-json/cucumber.json",
                  "usage:reports/cucumber-json/usage.json"
                }
        )



public class RunnerTest {
	
	public static void main(String ar[])
	{	
		JUnitCore.main(RunnerTest.class.getName());
	}

	
	   @BeforeSuite
	    public static void start() {
		   PropertyConfigurator.configure("config\\log4j.properties");
		   DateFormat dateFormat = new SimpleDateFormat(Constants.DATE_FORMAT);
		   System.out.println("-----SERVICE START UP TIME :-----------"+dateFormat.format(new Date()));
		   PropertyConfigurator.configure(Constants.LOG_PROPERTY_FILE_PATH);
	    }

	    @AfterSuite
	    public static void complete() {
	    	DateFormat dateFormat = new SimpleDateFormat(Constants.DATE_FORMAT);
	    	System.out.println("-----SERVICE END TIME :-----------"+dateFormat.format(new Date()));
	    }	    

}