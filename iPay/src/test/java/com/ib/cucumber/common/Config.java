package com.ib.cucumber.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


public class Config {
            
    static Properties prop = new Properties();
    static InputStream input = null;
    
    static {
        try {
            input = new FileInputStream("config\\config.properties");
            prop.load(input);

        } catch (IOException ex) {
        } finally {
            if (input != null) {
                try {
                    input.close();
                } catch (IOException e) {
                }
            }
        }
    }
        
    public static String set(String key, String defaultVal){
        if(null!=prop.getProperty(key)){            
            return prop.getProperty(key);            
        } else{
            return defaultVal;
        }
    }
    
    
    public final static String BROWSER_AGENT = set("BROWSER_AGENT", "CHROME");       
    
    //public final static String RECIPIENTS = set("madhuka@interblocks.com","lakshancs1987@gmail.com");  
    public final static String [] TOEMAILADDRESS={"madhuka@interblocks.com"};
    public final static String PDF_ATTACHMENTS = set("PDF_ATTACHMENTS", "cucumber-results-test-results.pdf");
    public final static String EMAIL_GATEWAY = set("EMAIL_GATEWAY", "smtp.gmail.com");
    public final static String FROM_EMAIL = set("FROM_EMAIL", "ipay.module@gmail.com");
    //public final static String FROM_EMAIL = set("FROM_EMAIL", "isettle.module@gmail.com");
    public final static String GATEWAY_PASS = set("GATEWAY_PASS", "ib123456.");    
    //public final static String GATEWAY_PASS = set("GATEWAY_PASS", "ib123456.");
    public final static String EMAIL_REPORTS = set("EMAIL_REPORTS", "Y");   
    
               
}
