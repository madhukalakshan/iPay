package com.ib.cucumber.common;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Statement;

import org.apache.log4j.Logger;
import org.postgresql.util.PSQLException;

import com.ib.cucumber.definition.iadmin.WebDriverInitializer;

public class DbManager {

	static Logger log = Logger.getLogger("LOG");
	ConfigFileReader configFileReader;
	
	public DbManager() {
		configFileReader= new ConfigFileReader();
	}

	public boolean verfyDb(String alias, String query, String rowCount) {

		int count = 0;
		boolean isSuccess = false;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String DBType = configFileReader.getDBType();
		int i = 0;
		while (i < 2) {
			try {
				switch (DBType) {
				case "ORACLE":
					Class.forName("oracle.jdbc.driver.OracleDriver");
					break;
				case "POSTGRE":
					Class.forName("org.postgresql.Driver");
					break;
				case "DB2":
					Class.forName("com.ibm.db2.jcc.DB2Driver");
					break;
				}
				switch (alias) {
				case "ISWITCH":
					con = DriverManager.getConnection(configFileReader.getIP(), configFileReader.getSwtUserName(), configFileReader.getSwtPassword());
					break;
				case "ICORE":
					con = DriverManager.getConnection(configFileReader.getIP(), configFileReader.getBknUserName(), configFileReader.getBknPassword());
					break;
				case "IPG":
					con = DriverManager.getConnection(configFileReader.getIP(), configFileReader.getIpgUserName(), configFileReader.getIpgPassword());
					break;
				case "USR":
					con = DriverManager.getConnection(configFileReader.getIP(), configFileReader.getUsrName(), configFileReader.getUsrPassword());
					break;
				case "BNK":
					con = DriverManager.getConnection(configFileReader.getIP(), configFileReader.getBnkUserName(), configFileReader.getBnkPassword());
					break;
				}

				stmt = con.createStatement();
				log.debug("===========================================================================");
				log.debug("The Query is: " + query);
				rs = stmt.executeQuery(query);
				if (rs.next()) {
					count = rs.getInt(1);
					log.debug("Expected Row Count in feature file: " + rowCount);
					log.debug("Result Row Count of SQL: " + count);
					log.debug("===========================================================================");
				}
				i = i + 2;
				isSuccess = (count == Integer.parseInt(rowCount));

			} catch (PSQLException e) {
				log.debug("Occurred PSQLException: " + i + " time");
				log.error("error:", e);
				i++;
			} catch (SQLException  e1) {
				log.debug("Occurred SQLException: " + i + " time");
				i++;
				log.error("error:", e1);
			} catch(Exception e2){
				log.debug("When connect the DB, occurred Exception");
				i = i + 2;
				log.error("error:", e2);
			} finally{
				closeDBConnection(con, stmt, rs);
				log.debug("DB connection closed successfully");
			}
		}
		return isSuccess;
	}

	public String geDbValue(String alias, String query, String ColumnName) {
		String value = "";
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String DBType = configFileReader.getDBType();
		int i = 0;
		while (i < 2) {
			try {
				switch (DBType) {
				case "ORACLE":
					Class.forName("oracle.jdbc.driver.OracleDriver");
					break;
				case "POSTGRE":
					Class.forName("org.postgresql.Driver");
					break;
				case "DB2":
					Class.forName("com.ibm.db2.jcc.DB2Driver");
					break;
				}
				switch (alias) {
				case "ISWITCH":
					con = DriverManager.getConnection(configFileReader.getIP(), configFileReader.getSwtUserName(), configFileReader.getSwtPassword());
					break;
				case "ICORE":
					con = DriverManager.getConnection(configFileReader.getIP(), configFileReader.getBknUserName(), configFileReader.getBknPassword());
					break;
				case "IPG":
					con = DriverManager.getConnection(configFileReader.getIP(), configFileReader.getIpgUserName(), configFileReader.getIpgPassword());
					break;
				case "USR":
					con = DriverManager.getConnection(configFileReader.getIP(), configFileReader.getUsrName(), configFileReader.getUsrPassword());
					break;
				case "BNK":
					con = DriverManager.getConnection(configFileReader.getIP(), configFileReader.getBnkUserName(), configFileReader.getBnkPassword());
					break;
				}
				stmt = con.createStatement();
				log.debug("===========================================================================");
				log.debug("The Query is: " + query);
				rs = stmt.executeQuery(query);
				if (rs.next()) {
					// value = rs.getLong(1);
					value = rs.getString(ColumnName);
					log.debug("Result Row Count of SQL: " + value);
					log.debug("===========================================================================");
				}
				i = i + 2;
			} catch (PSQLException e) {
				log.debug("Occurred PSQLException: " + i + " time");
				i++;
				log.error("error:", e);
			} catch (SQLException  e1) {
				log.debug("Occurred SQLException: " + i + " time");
				i++;
				log.error("error:", e1);
			} catch(Exception e2){
				log.debug("When connect the DB, occurred Exception");
				i = i + 2;
				log.error("error:", e2);
			}finally{
				closeDBConnection(con, stmt, rs);
				log.debug("DB conneceded successfully");
			}
		}
		return value;
	}

	public void closeDBConnection(Connection con, Statement stmt, ResultSet rs) {
		if (con != null)
			try {
				con.close();
			} catch (Exception e) {
				log.debug("Error occurred when close the connection");
				log.error("error:", e);
			}
		if (stmt != null)
			try{
				stmt.close();
			} catch (Exception e) {
				log.debug("Error occurred when close the Statement");
				log.error("error:", e);
			}		
		if (rs != null)
			try{
				rs.close();
			} catch (Exception e) {
				log.debug("Error occurred when close the ResultSet");
				log.error("error:", e);
			}
	}
}
