package com.ib.cucumber.dto.iadmin;

import org.openqa.selenium.WebDriver;
import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.pageobject.WebPageObject;


public class LoginFormDto extends WebPageObject{
	
	
	private String UserName="";
	private String Passoword="";
	private String BranchCode="";	

	public LoginFormDto(WebDriver webDriver) {
		super(webDriver);		
	}
	
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName,String sId) {
		this.UserName = userName;
		SetElements.setElement(Constants.TYPE_TEXT, userName, sId);
		
	}
	public String getPassoword() {
		return Passoword;
	}
	public void setPassoword(String passoword,String sId) {
		this.Passoword = passoword;	
		SetElements.setElement(Constants.TYPE_TEXT, passoword, sId);
		
	}
	
	public String getBranchCode() {
		return BranchCode;
	}

	public void setBranchCode(String branchCode,String sId) {
		BranchCode = branchCode;		
		SetElements.setElement(Constants.TYPE_TEXT, branchCode, sId);
	}
	
}
