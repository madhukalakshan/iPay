package com.ib.cucumber.dto.ipay;

import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.pageobject.WebPageObject;

public class merchantAllowedLanguageDto extends WebPageObject {

	public merchantAllowedLanguageDto(WebDriver webDriver) {
		super(webDriver);
	}

	private String merchant_id;
	private String language_code;

	public String getMerchant_id() {
		return merchant_id;
	}

	public void setMerchant_id(String merchant_id, String sElementID) {
		this.merchant_id = merchant_id;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.merchant_id, sElementID);
	}

	public String getLanguage_code() {
		return language_code;
	}

	public void setLanguage_code(String language_code, String sElementID) {
		this.language_code = language_code;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.language_code, sElementID);
	}

}
