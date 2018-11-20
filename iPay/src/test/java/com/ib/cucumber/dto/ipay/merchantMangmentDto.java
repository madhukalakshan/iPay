package com.ib.cucumber.dto.ipay;

import org.openqa.selenium.WebDriver;

import com.ib.cucumber.common.Constants;
import com.ib.cucumber.common.SetElements;
import com.ib.cucumber.pageobject.WebPageObject;

public class merchantMangmentDto extends WebPageObject{
	
	public merchantMangmentDto(WebDriver webDriver) 
	{
		super(webDriver);
	}
	private String  merchant_id;
    private String  business_type_id;
    private String  merchent_code;
    private String  url;
    private String  date_of_application_d;
    private String  date_of_application_m;
    private String  date_of_application_y;
    private String account_manager;
    private String success_static_return_link;
    private String fail_static_return_link;
    private String do_credit_pre_auth;
    private String custom_payment_screens;
    private String auto_settle_txn        ;
    private String Allow_sale_transaction_without_pages ;
    private String Allow_mobile_transactions            ;
    private String capture_billing_address              ;
    private String show_captcha                         ;
    private String inapp_payment                        ;
    private String txn_ref_num_uniqueness_period        ;
    private String fixed_service_fee_period             ;
    private String fixed_service_fee_amount             ;
    private String fixed_service_fee_currency           ;
    private String fixed_service_fee_account            ;
    private String merchant_multi_purpose_1             ;
    private String merchant_multi_purpose_2             ;
    private String merchant_multi_purpose_3             ;
    private String merchant_multi_purpose_4             ;
    private String merchant_multi_purpose_5             ;
    private String merchant_multi_purpose_6             ;
    private String merchant_multi_purpose_7             ;
    private String merchant_multi_purpose_8             ;
    private String merchant_multi_purpose_9             ;
    private String merchant_multi_purpose_10            ;
    private String merchant_multi_purpose_11            ;
    private String merchant_multi_purpose_12            ;
    private String product_code                         ;
    private String bin_length                           ;
    private String bin                                  ;
    private String bank_code;                     
    private String bank_name                            ;
    private String iss_country_code                     ;
    private String card_no_length                       ;
    private String include_exclude                      ;
    private String currency_code                        ;                  
    private String product_terminal_id                  ;
    private String global_limit_category                ;
    private String merchant_account_number              ;
    private String per_sale_txn_limit_alwd              ;                    
    private String per_sale_txn_limit_value             ;
    private String daily_sale_txn_limit_alwd            ;
    private String daily_sale_txn_limit_value           ;
    private String monthly_sale_txn_limit_alwd          ;
    private String monthly_sale_txn_limit_value         ;                     
    private String debit_void_alwd                      ;                    
    private String credit_card_void_alwd                ;
    private String debit_refund_alwd                    ;
    private String credit_card_refund_alwd              ;
    private String per_refund_txn_limit_alwd            ;
    private String per_refund_txn_limit_value           ;
    private String daily_refund_txn_limit_alwd          ;
    private String daily_refund_txn_limit_value         ;
    private String monthly_refund_txn_limit_alwd        ;
    private String monthly_refund_txn_limit_value       ;
    private String off_us_credit_card_alwd              ;
    private String plain_text_txn_req_alwd              ;
    private String void_allowed_period_alwd             ;
    private String void_allowed_period_value            ;
    private String refund_allowed_period_alwd           ;
    private String refund_allowed_period_value          ;
    private String clearance_allowed_period_alwd        ;
    private String clearance_allowed_period_value       ;
    private String language_code                        ;

	public String getMerchant_id() {
		return merchant_id;
	}
	public void setMerchant_id(String merchant_id,String sElementID) {
		this.merchant_id = merchant_id;
		SetElements.setElement(Constants.TYPE_TEXT, this.merchant_id, sElementID);		
	}
	public String getBusiness_type_id() {
		return business_type_id;
	}
	public void setBusiness_type_id(String business_type_id,String sElementID) {
		this.business_type_id = business_type_id;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.business_type_id, sElementID);	
	}
	public String getMerchent_code() {
		return merchent_code;
	}
	public void setMerchent_code(String merchent_code,String sElementID) {
		this.merchent_code = merchent_code;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.merchent_code, sElementID);	
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url,String sElementID) {
		this.url = url;
		SetElements.setElement(Constants.TYPE_TEXT, this.url, sElementID);	
	}
	public String getDate_of_application_d() {
		return date_of_application_d;
	}
	public void setDate_of_application_d(String date_of_application_d,String sElementID) {
		this.date_of_application_d = date_of_application_d;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.date_of_application_d, sElementID);
	}
	public String getDate_of_application_m() {
		return date_of_application_m;
	}
	public void setDate_of_application_m(String date_of_application_m,String sElementID) {
		this.date_of_application_m = date_of_application_m;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.date_of_application_m, sElementID);
	}
	public String getDate_of_application_y() {
		return date_of_application_y;
	}
	public void setDate_of_application_y(String date_of_application_y,String sElementID) {
		this.date_of_application_y = date_of_application_y;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.date_of_application_y, sElementID);
	}
	public String getAccount_manager() {
		return account_manager;	
	}
	public void setAccount_manager(String account_manager,String sElementID) {
		this.account_manager = account_manager;
		SetElements.setElement(Constants.TYPE_TEXT, this.account_manager, sElementID);
	}
	public String getSuccess_static_return_link() {
		return success_static_return_link;
	}
	public void setSuccess_static_return_link(String success_static_return_link,String sElementID) {
		this.success_static_return_link = success_static_return_link;
		SetElements.setElement(Constants.TYPE_TEXT, this.success_static_return_link, sElementID);
	}
	public String getFail_static_return_link() {
		return fail_static_return_link;
	}
	public void setFail_static_return_link(String fail_static_return_link,String sElementID) {
		this.fail_static_return_link = fail_static_return_link;
		SetElements.setElement(Constants.TYPE_TEXT, this.fail_static_return_link, sElementID);
	}
	public String getDo_credit_pre_auth() {
		return do_credit_pre_auth;
	}
	public void setDo_credit_pre_auth(String do_credit_pre_auth,String sElementID) {
		this.do_credit_pre_auth = do_credit_pre_auth;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.do_credit_pre_auth, sElementID);
	}
	public String getCustom_payment_screens() {
		return custom_payment_screens;
	}
	public void setCustom_payment_screens(String custom_payment_screens,String sElementID) {
		this.custom_payment_screens = custom_payment_screens;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.custom_payment_screens, sElementID);
	}
	public String getAuto_settle_txn() {
		return auto_settle_txn;
	}
	public void setAuto_settle_txn(String auto_settle_txn,String sElementID) {
		this.auto_settle_txn = auto_settle_txn;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.auto_settle_txn, sElementID);
	}
	public String getAllow_sale_transaction_without_pages() {
		return Allow_sale_transaction_without_pages;
	}
	public void setAllow_sale_transaction_without_pages(String allow_sale_transaction_without_pages,String sElementID) {
		this.Allow_sale_transaction_without_pages = allow_sale_transaction_without_pages;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.Allow_sale_transaction_without_pages, sElementID);
	}
	public String getAllow_mobile_transactions() {
		return Allow_mobile_transactions;
	}
	public void setAllow_mobile_transactions(String allow_mobile_transactions,String sElementID) {
		this.Allow_mobile_transactions = allow_mobile_transactions;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.Allow_mobile_transactions, sElementID);
	}
	public String getCapture_billing_address() {
		return capture_billing_address;
	}
	public void setCapture_billing_address(String capture_billing_address,String sElementID) {
		this.capture_billing_address = capture_billing_address;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.capture_billing_address, sElementID);
	}
	public String getShow_captcha() {
		return show_captcha;
	}
	public void setShow_captcha(String show_captcha,String sElementID) {
		this.show_captcha = show_captcha;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.show_captcha, sElementID);
	}
	public String getInapp_payment() {
		return inapp_payment;
	}
	public void setInapp_payment(String inapp_payment,String sElementID) {
		this.inapp_payment = inapp_payment;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.inapp_payment, sElementID);
	}
	public String getTxn_ref_num_uniqueness_period() {
		return txn_ref_num_uniqueness_period;
	}
	public void setTxn_ref_num_uniqueness_period(String txn_ref_num_uniqueness_period,String sElementID) {
		this.txn_ref_num_uniqueness_period = txn_ref_num_uniqueness_period;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.txn_ref_num_uniqueness_period, sElementID);
	}
	public String getFixed_service_fee_period() {
		return fixed_service_fee_period;
	}
	public void setFixed_service_fee_period(String fixed_service_fee_period,String sElementID) {
		this.fixed_service_fee_period = fixed_service_fee_period;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.fixed_service_fee_period, sElementID);
	}
	public String getFixed_service_fee_amount() {
		return fixed_service_fee_amount;
	}
	public void setFixed_service_fee_amount(String fixed_service_fee_amount,String sElementID) {
		this.fixed_service_fee_amount = fixed_service_fee_amount;
		SetElements.setElement(Constants.TYPE_TEXT, this.fixed_service_fee_amount, sElementID);
	}
	public String getFixed_service_fee_currency() {
		return fixed_service_fee_currency;
	}
	public void setFixed_service_fee_currency(String fixed_service_fee_currency,String sElementID) {
		this.fixed_service_fee_currency = fixed_service_fee_currency;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.fixed_service_fee_currency, sElementID);
	}
	public String getFixed_service_fee_account() {
		return fixed_service_fee_account;
	}
	public void setFixed_service_fee_account(String fixed_service_fee_account,String sElementID) {
		this.fixed_service_fee_account = fixed_service_fee_account;
		SetElements.setElement(Constants.TYPE_TEXT, this.fixed_service_fee_account, sElementID);
	}
	public String getMerchant_multi_purpose_1() {
		return merchant_multi_purpose_1;
	}
	public void setMerchant_multi_purpose_1(String merchant_multi_purpose_1,String sElementID) {
		this.merchant_multi_purpose_1 = merchant_multi_purpose_1;
		SetElements.setElement(Constants.TYPE_TEXT, this.merchant_multi_purpose_1, sElementID);
	}
	public String getMerchant_multi_purpose_2() {
		return merchant_multi_purpose_2;
	}
	public void setMerchant_multi_purpose_2(String merchant_multi_purpose_2,String sElementID) {
		this.merchant_multi_purpose_2 = merchant_multi_purpose_2;
		SetElements.setElement(Constants.TYPE_TEXT, this.merchant_multi_purpose_2, sElementID);
	}
	public String getMerchant_multi_purpose_3() {
		return merchant_multi_purpose_3;
	}
	public void setMerchant_multi_purpose_3(String merchant_multi_purpose_3,String sElementID) {
		this.merchant_multi_purpose_3 = merchant_multi_purpose_3;
		SetElements.setElement(Constants.TYPE_TEXT, this.merchant_multi_purpose_3, sElementID);
	}
	public String getMerchant_multi_purpose_4() {
		return merchant_multi_purpose_4;
	}
	public void setMerchant_multi_purpose_4(String merchant_multi_purpose_4,String sElementID) {
		this.merchant_multi_purpose_4 = merchant_multi_purpose_4;
		SetElements.setElement(Constants.TYPE_TEXT, this.merchant_multi_purpose_4, sElementID);
	}
	public String getMerchant_multi_purpose_5() {
		return merchant_multi_purpose_5;
	}
	public void setMerchant_multi_purpose_5(String merchant_multi_purpose_5,String sElementID) {
		this.merchant_multi_purpose_5 = merchant_multi_purpose_5;
		SetElements.setElement(Constants.TYPE_TEXT, this.merchant_multi_purpose_5, sElementID);
	}
	public String getMerchant_multi_purpose_6() {
		return merchant_multi_purpose_6;
	}
	public void setMerchant_multi_purpose_6(String merchant_multi_purpose_6,String sElementID) {
		this.merchant_multi_purpose_6 = merchant_multi_purpose_6;
		SetElements.setElement(Constants.TYPE_TEXT, this.merchant_multi_purpose_6, sElementID);
	}
	public String getMerchant_multi_purpose_7() {
		return merchant_multi_purpose_7;
	}
	public void setMerchant_multi_purpose_7(String merchant_multi_purpose_7,String sElementID) {
		this.merchant_multi_purpose_7 = merchant_multi_purpose_7;
		SetElements.setElement(Constants.TYPE_TEXT, this.merchant_multi_purpose_7, sElementID);
	}
	public String getMerchant_multi_purpose_8() {
		return merchant_multi_purpose_8;
	}
	public void setMerchant_multi_purpose_8(String merchant_multi_purpose_8,String sElementID) {
		this.merchant_multi_purpose_8 = merchant_multi_purpose_8;
		SetElements.setElement(Constants.TYPE_TEXT, this.merchant_multi_purpose_8, sElementID);
	}
	public String getMerchant_multi_purpose_9() {
		return merchant_multi_purpose_9;
	}
	public void setMerchant_multi_purpose_9(String merchant_multi_purpose_9,String sElementID) {
		this.merchant_multi_purpose_9 = merchant_multi_purpose_9;
		SetElements.setElement(Constants.TYPE_TEXT, this.merchant_multi_purpose_9, sElementID);
	}
	public String getMerchant_multi_purpose_10() {
		return merchant_multi_purpose_10;
	}
	public void setMerchant_multi_purpose_10(String merchant_multi_purpose_10,String sElementID) {
		this.merchant_multi_purpose_10 = merchant_multi_purpose_10;
		SetElements.setElement(Constants.TYPE_TEXT, this.merchant_multi_purpose_10, sElementID);
	}
	public String getMerchant_multi_purpose_11() {
		return merchant_multi_purpose_11;
	}
	public void setMerchant_multi_purpose_11(String merchant_multi_purpose_11,String sElementID) {
		this.merchant_multi_purpose_11 = merchant_multi_purpose_11;
		SetElements.setElement(Constants.TYPE_TEXT, this.merchant_multi_purpose_11, sElementID);
	}
	public String getMerchant_multi_purpose_12() {
		return merchant_multi_purpose_12;
	}
	public void setMerchant_multi_purpose_12(String merchant_multi_purpose_12,String sElementID) {
		this.merchant_multi_purpose_12 = merchant_multi_purpose_12;
		SetElements.setElement(Constants.TYPE_TEXT, this.merchant_multi_purpose_12, sElementID);
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code,String sElementID) {
		this.product_code = product_code;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.product_code, sElementID);
	}
	public String getBin_length() {
		return bin_length;
	}
	public void setBin_length(String bin_length,String sElementID) {
		this.bin_length = bin_length;
		SetElements.setElement(Constants.TYPE_TEXT, this.bin_length, sElementID);
	}
	public String getBin() {
		return bin;
	}
	public void setBin(String bin,String sElementID) {
		this.bin = bin;
		SetElements.setElement(Constants.TYPE_TEXT, this.bin, sElementID);
	}
	public String getBank_code() {
		return bank_code;
	}
	public void setBank_code(String bank_code,String sElementID) {
		this.bank_code = bank_code;
		SetElements.setElement(Constants.TYPE_TEXT, this.bank_code, sElementID);
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name,String sElementID) {
		this.bank_name = bank_name;
		SetElements.setElement(Constants.TYPE_TEXT, this.bank_name, sElementID);
	}
	public String getIss_country_code() {
		return iss_country_code;
	}
	public void setIss_country_code(String iss_country_code,String sElementID) {
		this.iss_country_code = iss_country_code;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.iss_country_code, sElementID);
	}
	public String getCard_no_length() {
		return card_no_length;
	}
	public void setCard_no_length(String card_no_length,String sElementID) {
		this.card_no_length = card_no_length;
		SetElements.setElement(Constants.TYPE_TEXT, this.card_no_length, sElementID);
	}
	public String getInclude_exclude() {
		return include_exclude;
	}
	public void setInclude_exclude(String include_exclude,String sElementID) {
		this.include_exclude = include_exclude;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.include_exclude, sElementID);
	}
	public String getCurrency_code() {
		return currency_code;
	}
	public void setCurrency_code(String currency_code,String sElementID) {
		this.currency_code = currency_code;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.currency_code, sElementID);
	}
	public String getProduct_terminal_id() {
		return product_terminal_id;
	}
	public void setProduct_terminal_id(String product_terminal_id,String sElementID) {
		this.product_terminal_id = product_terminal_id;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.product_terminal_id, sElementID);
	}
	public String getGlobal_limit_category() {
		return global_limit_category;
	}
	public void setGlobal_limit_category(String global_limit_category,String sElementID) {
		this.global_limit_category = global_limit_category;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.global_limit_category, sElementID);
	}
	public String getMerchant_account_number() {
		return merchant_account_number;
	}
	public void setMerchant_account_number(String merchant_account_number,String sElementID) {
		this.merchant_account_number = merchant_account_number;
		SetElements.setElement(Constants.TYPE_TEXT, this.merchant_account_number, sElementID);
	}
	public String getPer_sale_txn_limit_alwd() {
		return per_sale_txn_limit_alwd;
	}
	public void setPer_sale_txn_limit_alwd(String per_sale_txn_limit_alwd,String sElementID) {
		this.per_sale_txn_limit_alwd = per_sale_txn_limit_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.per_sale_txn_limit_alwd, sElementID);
	}
	public String getPer_sale_txn_limit_value() {
		return per_sale_txn_limit_value;
	}
	public void setPer_sale_txn_limit_value(String per_sale_txn_limit_value,String sElementID) {
		this.per_sale_txn_limit_value = per_sale_txn_limit_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.per_sale_txn_limit_value, sElementID);
	}
	public String getDaily_sale_txn_limit_alwd() {
		return daily_sale_txn_limit_alwd;
	}
	public void setDaily_sale_txn_limit_alwd(String daily_sale_txn_limit_alwd,String sElementID) {
		this.daily_sale_txn_limit_alwd = daily_sale_txn_limit_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.daily_sale_txn_limit_alwd, sElementID);
	}
	public String getDaily_sale_txn_limit_value() {
		return daily_sale_txn_limit_value;
	}
	public void setDaily_sale_txn_limit_value(String daily_sale_txn_limit_value,String sElementID) {
		this.daily_sale_txn_limit_value = daily_sale_txn_limit_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.daily_sale_txn_limit_value, sElementID);
		
	}
	public String getMonthly_sale_txn_limit_alwd() {
		return monthly_sale_txn_limit_alwd;
	}
	public void setMonthly_sale_txn_limit_alwd(String monthly_sale_txn_limit_alwd,String sElementID) {
		this.monthly_sale_txn_limit_alwd = monthly_sale_txn_limit_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.monthly_sale_txn_limit_alwd, sElementID);
	}
	public String getMonthly_sale_txn_limit_value() {
		return monthly_sale_txn_limit_value;
	}
	public void setMonthly_sale_txn_limit_value(String monthly_sale_txn_limit_value,String sElementID) {
		this.monthly_sale_txn_limit_value = monthly_sale_txn_limit_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.monthly_sale_txn_limit_value, sElementID);
	}
	public String getDebit_void_alwd() {
		return debit_void_alwd;
	}
	public void setDebit_void_alwd(String debit_void_alwd,String sElementID) {
		this.debit_void_alwd = debit_void_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.debit_void_alwd, sElementID);
	}
	public String getCredit_card_void_alwd() {
		return credit_card_void_alwd;
	}
	public void setCredit_card_void_alwd(String credit_card_void_alwd,String sElementID) {
		this.credit_card_void_alwd = credit_card_void_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.credit_card_void_alwd, sElementID);
	}
	public String getDebit_refund_alwd() {
		return debit_refund_alwd;
	}
	public void setDebit_refund_alwd(String debit_refund_alwd,String sElementID) {
		this.debit_refund_alwd = debit_refund_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.debit_refund_alwd, sElementID);
	}
	public String getCredit_card_refund_alwd() {
		return credit_card_refund_alwd;
	}
	public void setCredit_card_refund_alwd(String credit_card_refund_alwd,String sElementID) {
		this.credit_card_refund_alwd = credit_card_refund_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.credit_card_refund_alwd, sElementID);
	}
	public String getPer_refund_txn_limit_alwd() {
		return per_refund_txn_limit_alwd;
	}
	public void setPer_refund_txn_limit_alwd(String per_refund_txn_limit_alwd,String sElementID) {
		this.per_refund_txn_limit_alwd = per_refund_txn_limit_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.per_refund_txn_limit_alwd, sElementID);
	}
	public String getPer_refund_txn_limit_value() {
		return per_refund_txn_limit_value;
	}
	public void setPer_refund_txn_limit_value(String per_refund_txn_limit_value,String sElementID) {
		this.per_refund_txn_limit_value = per_refund_txn_limit_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.per_refund_txn_limit_value, sElementID);
	}
	public String getDaily_refund_txn_limit_alwd() {
		return daily_refund_txn_limit_alwd;
	}
	public void setDaily_refund_txn_limit_alwd(String daily_refund_txn_limit_alwd,String sElementID) {
		this.daily_refund_txn_limit_alwd = daily_refund_txn_limit_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.daily_refund_txn_limit_alwd, sElementID);
	}
	public String getDaily_refund_txn_limit_value() {
		return daily_refund_txn_limit_value;
	}
	public void setDaily_refund_txn_limit_value(String daily_refund_txn_limit_value,String sElementID) {
		this.daily_refund_txn_limit_value = daily_refund_txn_limit_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.daily_refund_txn_limit_value, sElementID);
	}
	public String getMonthly_refund_txn_limit_alwd() {
		return monthly_refund_txn_limit_alwd;
	}
	public void setMonthly_refund_txn_limit_alwd(String monthly_refund_txn_limit_alwd,String sElementID) {
		this.monthly_refund_txn_limit_alwd = monthly_refund_txn_limit_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.monthly_refund_txn_limit_alwd, sElementID);
	}
	public String getMonthly_refund_txn_limit_value() {
		return monthly_refund_txn_limit_value;
	}
	public void setMonthly_refund_txn_limit_value(String monthly_refund_txn_limit_value,String sElementID) {
		this.monthly_refund_txn_limit_value = monthly_refund_txn_limit_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.monthly_refund_txn_limit_value, sElementID);
	}
	public String getOff_us_credit_card_alwd() {
		return off_us_credit_card_alwd;
	}
	public void setOff_us_credit_card_alwd(String off_us_credit_card_alwd,String sElementID) {
		this.off_us_credit_card_alwd = off_us_credit_card_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.off_us_credit_card_alwd, sElementID);
	}
	public String getPlain_text_txn_req_alwd() {
		return plain_text_txn_req_alwd;
	}
	public void setPlain_text_txn_req_alwd(String plain_text_txn_req_alwd,String sElementID) {
		this.plain_text_txn_req_alwd = plain_text_txn_req_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.plain_text_txn_req_alwd, sElementID);
	}
	public String getVoid_allowed_period_alwd() {
		return void_allowed_period_alwd;
	}
	public void setVoid_allowed_period_alwd(String void_allowed_period_alwd,String sElementID) {
		this.void_allowed_period_alwd = void_allowed_period_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.void_allowed_period_alwd, sElementID);
	}
	public String getVoid_allowed_period_value() {
		return void_allowed_period_value;
	}
	public void setVoid_allowed_period_value(String void_allowed_period_value,String sElementID) {
		this.void_allowed_period_value = void_allowed_period_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.void_allowed_period_value, sElementID);
	}
	public String getRefund_allowed_period_alwd() {
		return refund_allowed_period_alwd;
	}
	public void setRefund_allowed_period_alwd(String refund_allowed_period_alwd,String sElementID) {
		this.refund_allowed_period_alwd = refund_allowed_period_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.refund_allowed_period_alwd, sElementID);
	}
	public String getRefund_allowed_period_value() {
		return refund_allowed_period_value;
	}
	public void setRefund_allowed_period_value(String refund_allowed_period_value,String sElementID) {
		this.refund_allowed_period_value = refund_allowed_period_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.refund_allowed_period_value, sElementID);
	}
	public String getClearance_allowed_period_alwd() {
		return clearance_allowed_period_alwd;
	}
	public void setClearance_allowed_period_alwd(String clearance_allowed_period_alwd,String sElementID) {
		this.clearance_allowed_period_alwd = clearance_allowed_period_alwd;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.clearance_allowed_period_alwd, sElementID);
	}
	public String getClearance_allowed_period_value() {
		return clearance_allowed_period_value;
	}
	public void setClearance_allowed_period_value(String clearance_allowed_period_value,String sElementID) {
		this.clearance_allowed_period_value = clearance_allowed_period_value;
		SetElements.setElement(Constants.TYPE_TEXT, this.clearance_allowed_period_value, sElementID);
	}
	public String getLanguage_code() {
		return language_code;
	}
	public void setLanguage_code(String language_code,String sElementID) {
		this.language_code = language_code;
		SetElements.setElement(Constants.TYPE_DROP_DOWN, this.language_code, sElementID);
	}
}
