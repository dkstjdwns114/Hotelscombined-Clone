package com.hotelsCombined.dy_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import com.hotels.db.DBconn;
import com.hotelsCombined.dy_DTO.HotelsDTO;
import com.hotelsCombined.dy_DTO.SearchInfoDTO;

public class FindDetailDAO {
    HashMap<String, String> skybayMap = null;
    HashMap<String, String> st_JohnMap = null;
    HashMap<String, String> amantiMap = null;
    ArrayList<HashMap<String, String>> skybayList = new ArrayList<HashMap<String,String>>();
    ArrayList<HashMap<String, String>> st_JohnList = new ArrayList<HashMap<String,String>>();
    ArrayList<HashMap<String, String>> amantiList = new ArrayList<HashMap<String,String>>();
    
    Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
public void getSkybay(){
        

        String sql = "SELECT h_siteName, h_price, h_desc, h_url FROM tb_hotels WHERE h_hotel = 1";
        try {
        	conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(("h_price")) != null) {
				skybayMap = new HashMap<String, String>();
				skybayMap.put("price1", rs.getString(("h_price")));
				skybayMap.put("url1", rs.getString(("h_url")));
				skybayMap.put("desc1", rs.getString(("h_desc")));
				skybayMap.put("logo", rs.getString(("h_siteName")));
				skybayList.add(skybayMap);
				}
			}
        	
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

  
    public ArrayList<HashMap<String,String>> getSkybayList() {
    	this.getSkybay();
    	  Collections.sort(skybayList, new Comparator<HashMap<String, String >>() {
    	        public int compare(HashMap<String, String> first,
    	                HashMap<String, String> second) {
    	            
    	            int firstValue = Integer.valueOf(first.get("price1"));
    	            int secondValue = Integer.valueOf(second.get("price1"));
    	            
    	            // 오름차순 정렬
    	            if (firstValue > secondValue) {
    	                return 1;
    	            } else if (firstValue < secondValue) {
    	                return -1;
    	            } else /* if (firstValue == secondValue) */ {
    	                return 0;
    	            }
    	        }
    	    });

    	return	skybayList;
    }
    
    
    
public void getSt_John(){
        

        String sql = "SELECT h_siteName, h_price, h_desc, h_url FROM tb_hotels WHERE h_hotel = 2";
        try {
        	conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(("h_price")) != null) {
				st_JohnMap = new HashMap<String, String>();
				st_JohnMap.put("price2", rs.getString(("h_price")));
				st_JohnMap.put("url2", rs.getString(("h_url")));
				st_JohnMap.put("desc2", rs.getString(("h_desc")));
				st_JohnMap.put("logo", rs.getString(("h_siteName")));
				st_JohnList.add(st_JohnMap);
				}
			}
        	
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    
    public ArrayList<HashMap<String,String>> getSt_JohnList() {
    	this.getSt_John();
    	System.out.println(st_JohnList);
    	  Collections.sort(st_JohnList, new Comparator<HashMap<String, String >>() {
    	        public int compare(HashMap<String, String> first,
    	                HashMap<String, String> second) {
    	            
    	            int firstValue = Integer.valueOf(first.get("price2"));
    	            int secondValue = Integer.valueOf(second.get("price2"));
    	            
    	            // 오름차순 정렬
    	            if (firstValue > secondValue) {
    	                return 1;
    	            } else if (firstValue < secondValue) {
    	                return -1;
    	            } else /* if (firstValue == secondValue) */ {
    	                return 0;
    	            }
    	        }
    	    });

    	return	st_JohnList;
    }
    
public void getAmanti(){
        

        String sql = "SELECT h_siteName, h_price, h_desc, h_url FROM tb_hotels WHERE h_hotel = 12";
        try {
        	conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(("h_price")) != null) {
				amantiMap = new HashMap<String, String>();
				amantiMap.put("price3", rs.getString(("h_price")));
				amantiMap.put("url3", rs.getString(("h_url")));
				amantiMap.put("desc3", rs.getString(("h_desc")));
				amantiMap.put("logo", rs.getString(("h_siteName")));
				amantiList.add(amantiMap);
				}
			}
        	
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    
    
    
    
    
    
    public ArrayList<HashMap<String,String>> getAmantiList() {
    	this.getAmanti();
    	System.out.println(amantiList);
    	  Collections.sort(amantiList, new Comparator<HashMap<String, String >>() {
    	        public int compare(HashMap<String, String> first,
    	                HashMap<String, String> second) {
    	            
    	            int firstValue = Integer.valueOf(first.get("price3"));
    	            int secondValue = Integer.valueOf(second.get("price3"));
    	            
    	            // 오름차순 정렬
    	            if (firstValue > secondValue) {
    	                return 1;
    	            } else if (firstValue < secondValue) {
    	                return -1;
    	            } else /* if (firstValue == secondValue) */ {
    	                return 0;
    	            }
    	        }
    	    });

    	return	amantiList;
    }


}
