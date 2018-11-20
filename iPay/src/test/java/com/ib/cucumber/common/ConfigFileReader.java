package com.ib.cucumber.common;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

public class ConfigFileReader {

	private Properties properties;
	private final String propertyFilePath = "config//Configuration.properties";

	public ConfigFileReader() {
		BufferedReader reader;
		try {
			reader = new BufferedReader(new FileReader(propertyFilePath));
			properties = new Properties();
			try {
				properties.load(reader);
				reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException("Configuration.properties not found at " + propertyFilePath);
		}
	}

	public String getLoginPageUrl() {
		String url = properties.getProperty("LOGIN_PAGE");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}

	public String getMerchantPageUrl() {
		String url = properties.getProperty("MERCHANT_PAGE");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}

	public String getPHPClientUrl() {
		String url = properties.getProperty("PHPCLIENT_LINK");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}

	public String getOnboardingPHPClientUrl() {
		String url = properties.getProperty("ONBOARDINGPHPCLIENT_LINK");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}
	
	public String getInAppClientUrl() {
		String url = properties.getProperty("INAPPCLIENT_LINK");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}

	public String getPHPClient() {
		String url = properties.getProperty("PHPCLIENT");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}

	public String getOnboardingPHPClient() {
		String url = properties.getProperty("ONBOARDINGPHPCLIENT");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}
	
	public String getInAppClient() {
		String url = properties.getProperty("INAPP");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}

	public String getDBType() {
		String url = properties.getProperty("DBType");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}

	public String getSwtUserName() {
		String url = properties.getProperty("SWTUSERNAME");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}

	public String getSwtPassword() {
		String url = properties.getProperty("SWTPASSWORD");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}

	public String getBknUserName() {
		String url = properties.getProperty("BKNUSERNAME");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}
	
	public String getBknPassword() {
		String url = properties.getProperty("BKNPASSWORD");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}

	public String getIpgUserName() {
		String url = properties.getProperty("IPGUSERNAME");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}

	public String getIpgPassword() {
		String url = properties.getProperty("IPGPASSWORD");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}
	
	public String getUsrName() {
		String url = properties.getProperty("USRUSERNAME");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}

	public String getUsrPassword() {
		String url = properties.getProperty("USRPASSWORD");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}
	
	public String getBnkUserName() {
		String url = properties.getProperty("BNKUSERNAME");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}

	public String getBnkPassword() {
		String url = properties.getProperty("BNKPASSWORD");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}

	public String getIP() {
		String url = properties.getProperty("IP");
		if (url != null)
			return url;
		else
			throw new RuntimeException("url not specified in the Configuration.properties file.");
	}

	

}
