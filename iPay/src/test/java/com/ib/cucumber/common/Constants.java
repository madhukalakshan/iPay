package com.ib.cucumber.common;

public class Constants {

	public final static String FOLDER_SEPERATOR = "\\";
	public final static String DATE_FORMAT = "yyyy/MM/dd HH:mm:ss";
	public final static String IMAGE_EXTENSION = ".png";
	public final static String IMAGE_LOCATION = "config\\SCREENS_SHOTS\\";
	public final static String TEST_BROWSER_FIRE_FOX = "N";
	public final static String TEST_BROWSER_CHROME = "Y";
	public final static String CHROME_DRIVER_PATH = "config\\chromedriver.exe";
	public final static String LOG_PROPERTY_FILE_PATH = "config\\log4j.properties";
	public final static String DATA_FILE_PATH = "config\\Data.xls";
	public final static String WAMPSERVER_PATH64="C:\\wamp64\\";
	public final static String WAMPSERVER_PATH="C:\\wamp\\";
	public final static String FIRE_FOX_PROFILE_LOAD = "Y";
	public final static boolean DATA_XL_FILE_ALLOW=true;
	public final static String FEATURE_FILE_LOCATION = "src\\test\\resources\\";
	public final static String SUCCESS_MESSAGE = "success";
	public final static String ERROR_MESSAGE = "error";
	public final static String MAIN_ICARD_ICON_XPATH = "/html/body/div[2]/nav/div/a[2]/div/img";
	public final static String PRODUCT_CREATION_FINAL_RESULT_IMAGE_NAME = "Creation_result";
	public final static String COMMENT_APPROVE = "Approving BY cucumber Automation";

	// Types of elements
	public final static String TYPE_TEXT = "T";
	public final static String TYPE_DROP_DOWN = "D";
	public final static String TYPE_CHECK_BOX = "C";
	public final static String TYPE_RADIO_BOX = "R";

	public final static boolean GET_SCREEN_SHOTS = true;
	public static boolean failScenarioMessageAllow=false;
	public static String failScenarioMessageText="";
	public final static boolean ADD_SUB_FOLDER_CREATION = true; // This will put
																// all images in
																// relevant sub
																// folders
																// according to
																// the module
	
	public final static long TIME_OUT_PERIOD = 50;

	// DB Details
	/*public final static String DBType="ORACLE";
	public final static String SWTUSERNAME = "NIB_D_SWT";
    public final static String SWTPASSWORD = "NIB_D_SWT";
    public final static String BKNUSERNAME = "NIB_D_BKN";
    public final static String BKNPASSWORD = "NIB_D_BKN";
    public final static String IPGUSERNAME = "NIB_D_IPY";
    public final static String IPGPASSWORD = "NIB_D_IPY";
    public final static String USRUSERNAME = "NIB_D_USR";
    public final static String USRPASSWORD = "NIB_D_USR";
    public final static String BNKUSERNAME = "NIB_D_BNK";
    public final static String BNKPASSWORD = "NIB_D_BNK";
	public final static String IP = "jdbc:oracle:thin:@10.4.2.75:1521:pgwdb";*/
	/*public final static String SWTUSERNAME = "usl_d_swt";
    public final static String SWTPASSWORD = "usl_d_swt";
    public final static String BKNUSERNAME = "usl_d_bkn";
    public final static String BKNPASSWORD = "usl_d_bkn";
    public final static String IPGUSERNAME = "usl_d_ipy";
    public final static String IPGPASSWORD = "usl_d_ipy";
	public final static String IP = "jdbc:postgresql://192.168.21.101:5002/usld";*/


}
