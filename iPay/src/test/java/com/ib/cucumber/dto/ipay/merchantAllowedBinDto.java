package com.ib.cucumber.dto.ipay;

import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.pageobject.WebPageObject;

public class merchantAllowedBinDto extends WebPageObject {
	
	public merchantAllowedBinDto(WebDriver webDriver) 
	{
		super(webDriver);
	}
	private String product_code;
	private String merchant_id;
	private String bin_length;
	private String bin;
	private String bank_code;
	private String bank_name;
	private String country_code;
	private String card_no_length;
	private String include_exclude;
	
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code, String sElementID) {
		this.product_code = product_code;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.product_code, sElementID);
	}
	public String getMerchant_id() {
		return merchant_id;
	}
	public void setMerchant_id(String merchant_id, String sElementID) {
		this.merchant_id = merchant_id;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.merchant_id, sElementID);
	}
	public String getBin_length() {
		return bin_length;
	}
	public void setBin_length(String bin_length, String sElementID) {
		this.bin_length = bin_length;
		SetElements.setElement(Constants.TYPE_TEXT, this.bin_length, sElementID);
	}
	public String getBin() {
		return bin;
	}
	public void setBin(String bin, String sElementID) {
		this.bin = bin;
		SetElements.setElement(Constants.TYPE_TEXT, this.bin, sElementID);
	}
	public String getBank_code() {
		return bank_code;
	}
	public void setBank_code(String bank_code, String sElementID) {
		this.bank_code = bank_code;
		SetElements.setElement(Constants.TYPE_TEXT, this.bank_code, sElementID);
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name, String sElementID) {
		this.bank_name = bank_name;
		SetElements.setElement(Constants.TYPE_TEXT, this.bank_name, sElementID);
	}
	public String getCountry_code() {
		return country_code;
	}
	public void setCountry_code(String country_code, String sElementID) {
		this.country_code = country_code;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.country_code, sElementID);
	}
	public String getCard_no_length() {
		return card_no_length;
	}
	public void setCard_no_length(String card_no_length, String sElementID) {
		this.card_no_length = card_no_length;
		SetElements.setElement(Constants.TYPE_TEXT, this.card_no_length, sElementID);
	}
	public String getInclude_exclude() {
		return include_exclude;
	}
	public void setInclude_exclude(String include_exclude, String sElementID) {
		this.include_exclude = include_exclude;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.include_exclude, sElementID);
	}
	
	
	
	
}
