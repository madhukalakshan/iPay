package com.ib.cucumber.common;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class ElementValidation {
	
	public static boolean isElementExsists(WebDriver driver,String sId,long Time_seconds)
	{
		
		boolean present=false;		
		driver.manage().timeouts().implicitlyWait(Time_seconds, TimeUnit.SECONDS);
		
		List<WebElement> findText=driver.findElements(By.id(sId));
        
		 if(findText.size()>0)
		 {
			 present=true;
		 }
		
		return present;
	}

	
	public static boolean isMessage(WebDriver driver,String sTextToFind)
	{
		boolean bCheck=false;
		
		//String sMessage=driver.findElement(By.xpath("/html/body/div[4]/div[3]/div/fieldset/h2")).getText();
		
		 List<WebElement> findText=null;
		//System.out.println("sTextToFind.equals(\"message\") or con >>"+(sTextToFind.equals("message") || sTextToFind.equals("Information")));
		 if(sTextToFind.equals("message") || sTextToFind.equals("Information"))
		 {
			 findText=driver.findElements(By.xpath("/html/body/div[2]/div[3]/div/fieldset/h2[contains(text(), '"+sTextToFind+"')]"));
		 }else{
			 findText=driver.findElements(By.xpath("/html/body/div[4]/div[3]/div/fieldset/h2[contains(text(), '"+sTextToFind+"')]"));
		 }
		                                                         
		 if(findText.size()>0)
		 {
			 bCheck=true;
		 }
		 return bCheck;
	}
	
	public static boolean isError(WebDriver driver,String sTextToFind)
	{
		boolean bCheck=false;
		
		//String sMessage=driver.findElement(By.xpath("/html/body/div[4]/div[3]/div/fieldset/h2")).getText();
		
		 List<WebElement> findText=null;
		 findText=driver.findElements(By.xpath("/html/body/div[4]/div[3]/div/fieldset/h2[contains(text(), '"+sTextToFind+"')]"));
												//html/body/div[4]/div[3]/div/fieldset/h2
		 if(findText.size()>0)
		 {
			 bCheck=true;
		 
		 }
	
		 return bCheck;
		 
	}
	
	public static boolean isCError(WebDriver driver,String sTextToFind)
	{
		boolean bCheck=false;
		
		//String sMessage=driver.findElement(By.xpath("/html/body/div[4]/div[3]/div/fieldset/h2")).getText();
		
		 List<WebElement> findText=null;
		 findText=driver.findElements(By.xpath("/html/body/div[2]/div[3]/div/fieldset/h2[contains(text(), '"+sTextToFind+"')]"));

		 if(findText.size()>0)
		 {
			 bCheck=true;
		 }
		 return bCheck;
	}
	
	public static boolean isWarrningMessage(WebDriver driver,String sTextToFind)
	{
		boolean bCheck=false;
		
		 List<WebElement> findText=driver.findElements(By.xpath("/html/body/div[2]/div[3]/div/fieldset/h2[contains(text(), '"+sTextToFind+"')]"));
		                                                         
		 if(findText.size()>0)
		 {
			 bCheck=true;
		 }
		 return bCheck;
	}
	
	
	
	
}

