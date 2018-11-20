package com.ib.cucumber.dto.ipay;

import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.pageobject.WebPageObject;

public class globalSettingManagementDto extends WebPageObject {
	
	public globalSettingManagementDto(WebDriver webDriver) 
	{
		super(webDriver);
	}

	private String global_limit_category;
	private String currency_code;
	private String glob_limit_cat_desc;
	private String per_sale_txn_limit_value;
	private String daily_sale_txn_limit_value;
	private String monthly_sale_txn_limit_value;
	private String debit_void_alwd;
	private String credit_card_void_alwd;
	private String debit_refund_alwd;
	private String credit_card_refund_alwd;
	private String debit_clearance_alwd;
	private String dcredit_clearance_alwd;
	private String per_refund_txn_limit_value;
	private String daily_refund_txn_limit_value;
	private String monthly_refund_txn_limit_value;
	private String off_us_credit_card_alwd;
	private String plain_text_txn_req_alwd;
	private String void_allowed_period_value;
	private String refund_allowed_period_value;
	private String clearance_allowed_period_value;
	private String glob_txn_id;

	public String getGlobal_limit_category() {
		return global_limit_category;
	}

	public void setGlobal_limit_category(String global_limit_category, String sElementID) {
		this.global_limit_category = global_limit_category;
		SetElements.setElement(Constants.TYPE_TEXT, this.global_limit_category, sElementID);
	}

	public String getCurrency_code() {
		return currency_code;
	}

	public void setCurrency_code(String currency_code, String sElementID) {
		this.currency_code = currency_code;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.currency_code, sElementID);
	}

	public String getGlob_limit_cat_desc() {
		return glob_limit_cat_desc;
	}

	public void setGlob_limit_cat_desc(String glob_limit_cat_desc, String sElementID) {
		this.glob_limit_cat_desc = glob_limit_cat_desc;
		SetElements.setElement(Constants.TYPE_TEXT, this.glob_limit_cat_desc, sElementID);
	}

	public String getPer_sale_txn_limit_value() {
		return per_sale_txn_limit_value;
	}

	public void setPer_sale_txn_limit_value(String per_sale_txn_limit_value, String sElementID) {
		this.per_sale_txn_limit_value = per_sale_txn_limit_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.per_sale_txn_limit_value, sElementID);
	}

	public String getDaily_sale_txn_limit_value() {
		return daily_sale_txn_limit_value;
	}

	public void setDaily_sale_txn_limit_value(String daily_sale_txn_limit_value, String sElementID) {
		this.daily_sale_txn_limit_value = daily_sale_txn_limit_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.daily_sale_txn_limit_value, sElementID);
	}

	public String getMonthly_sale_txn_limit_value() {
		return monthly_sale_txn_limit_value;
	}

	public void setMonthly_sale_txn_limit_value(String monthly_sale_txn_limit_value, String sElementID) {
		this.monthly_sale_txn_limit_value = monthly_sale_txn_limit_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.monthly_sale_txn_limit_value, sElementID);
	}

	public String getDebit_void_alwd() {
		return debit_void_alwd;
	}

	public void setDebit_void_alwd(String debit_void_alwd, String sElementID) {
		this.debit_void_alwd = debit_void_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.debit_void_alwd, sElementID);
	}

	public String getCredit_card_void_alwd() {
		return credit_card_void_alwd;
	}

	public void setCredit_card_void_alwd(String credit_card_void_alwd, String sElementID) {
		this.credit_card_void_alwd = credit_card_void_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.credit_card_void_alwd, sElementID);
	}

	public String getDebit_refund_alwd() {
		return debit_refund_alwd;
	}

	public void setDebit_refund_alwd(String debit_refund_alwd, String sElementID) {
		this.debit_refund_alwd = debit_refund_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.debit_refund_alwd, sElementID);
	}

	public String getCredit_card_refund_alwd() {
		return credit_card_refund_alwd;
	}

	public void setCredit_card_refund_alwd(String credit_card_refund_alwd, String sElementID) {
		this.credit_card_refund_alwd = credit_card_refund_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.credit_card_refund_alwd, sElementID);
	}

	public String getDebit_clearance_alwd() {
		return debit_clearance_alwd;
	}

	public void setDebit_clearance_alwd(String debit_clearance_alwd, String sElementID) {
		this.debit_clearance_alwd = debit_clearance_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.debit_clearance_alwd, sElementID);
	}

	public String getDcredit_clearance_alwd() {
		return dcredit_clearance_alwd;
	}

	public void setDcredit_clearance_alwd(String dcredit_clearance_alwd, String sElementID) {
		this.dcredit_clearance_alwd = dcredit_clearance_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.dcredit_clearance_alwd, sElementID);
	}

	public String getPer_refund_txn_limit_value() {
		return per_refund_txn_limit_value;
	}

	public void setPer_refund_txn_limit_value(String per_refund_txn_limit_value, String sElementID) {
		this.per_refund_txn_limit_value = per_refund_txn_limit_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.per_refund_txn_limit_value, sElementID);
	}

	public String getDaily_refund_txn_limit_value() {
		return daily_refund_txn_limit_value;
	}

	public void setDaily_refund_txn_limit_value(String daily_refund_txn_limit_value, String sElementID) {
		this.daily_refund_txn_limit_value = daily_refund_txn_limit_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.daily_refund_txn_limit_value, sElementID);
	}

	public String getMonthly_refund_txn_limit_value() {
		return monthly_refund_txn_limit_value;
	}

	public void setMonthly_refund_txn_limit_value(String monthly_refund_txn_limit_value, String sElementID) {
		this.monthly_refund_txn_limit_value = monthly_refund_txn_limit_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.monthly_refund_txn_limit_value, sElementID);
	}

	public String getOff_us_credit_card_alwd() {
		return off_us_credit_card_alwd;
	}

	public void setOff_us_credit_card_alwd(String off_us_credit_card_alwd, String sElementID) {
		this.off_us_credit_card_alwd = off_us_credit_card_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.off_us_credit_card_alwd, sElementID);
	}

	public String getPlain_text_txn_req_alwd() {
		return plain_text_txn_req_alwd;
	}

	public void setPlain_text_txn_req_alwd(String plain_text_txn_req_alwd, String sElementID) {
		this.plain_text_txn_req_alwd = plain_text_txn_req_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.plain_text_txn_req_alwd, sElementID);
	}

	public String getVoid_allowed_period_value() {
		return void_allowed_period_value;
	}

	public void setVoid_allowed_period_value(String void_allowed_period_value, String sElementID) {
		this.void_allowed_period_value = void_allowed_period_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.void_allowed_period_value, sElementID);
	}

	public String getRefund_allowed_period_value() {
		return refund_allowed_period_value;
	}

	public void setRefund_allowed_period_value(String refund_allowed_period_value, String sElementID) {
		this.refund_allowed_period_value = refund_allowed_period_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.refund_allowed_period_value, sElementID);
	}

	public String getClearance_allowed_period_value() {
		return clearance_allowed_period_value;
	}

	public void setClearance_allowed_period_value(String clearance_allowed_period_value, String sElementID) {
		this.clearance_allowed_period_value = clearance_allowed_period_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.clearance_allowed_period_value, sElementID);
	}
	public String getGlob_txn_id() {
		return glob_txn_id;
	}

	public void setGlob_txn_id(String glob_txn_id,  String sElementID) {
		this.glob_txn_id = glob_txn_id;
		SetElements.setElement(Constants.TYPE_TEXT, this.glob_txn_id, sElementID);
	}
}
