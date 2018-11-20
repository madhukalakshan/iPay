package com.ib.cucumber.definition.iadmin;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import com.ib.cucumber.common.Constants;

import cucumber.api.java.Before;

public class WebDriverInitializer {
	
	 	
		public  static boolean initialized = false;
	   	private static WebDriver driver; 
	   	Logger log = Logger.getLogger("LOG");
	  
	   @Before
	   public void setUp() throws Exception {		   
		 
	      if (!initialized) 
	      {    	 
	    	  System.setProperty("webdriver.chrome.driver", Constants.CHROME_DRIVER_PATH);
	    	  // initialize the driver	    	
	         //driver =  new FirefoxDriver();
	    	 driver=new ChromeDriver();
	    	 driver.manage().deleteAllCookies();
	    	 driver.manage().window().maximize();
	    	 driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
	         initialized = true;
	         
	      }
	   }

	   public WebDriver getDriver() {
	      return driver;
	   }

}
