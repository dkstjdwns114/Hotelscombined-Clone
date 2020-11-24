package com.hotelsCombined.dy_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import com.hotels.db.DBconn;
import com.hotelsCombined.dy_DTO.HotelsDTO;
import com.hotelsCombined.dy_DTO.SearchInfoDTO;


public class FindBusanDAO {
    HashMap<String, String> shillaMap = null;
    HashMap<String, String> paradiseMap = null;
    HashMap<String, String> lavalseMap = null;
    HashMap<String, String> ramadaMap = null;
    ArrayList<HashMap<String, String>> shillaHaeundaeList = new ArrayList<HashMap<String,String>>();
    ArrayList<HashMap<String, String>> paradiseList = new ArrayList<HashMap<String,String>>();
    ArrayList<HashMap<String, String>> lavalseList = new ArrayList<HashMap<String,String>>();
    ArrayList<HashMap<String, String>> ramadaList = new ArrayList<HashMap<String,String>>();
    
    Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
public void getShillaHaeundae(){
        

        String sql = "SELECT h_siteName, h_price, h_url FROM tb_hotels WHERE h_hotel = 8";
        try {
        	conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(("h_price")) != null) {
				shillaMap = new HashMap<String, String>();
				shillaMap.put("price1", rs.getString(("h_price")));
				shillaMap.put("url1", rs.getString(("h_url")));
				shillaMap.put("logo", rs.getString(("h_siteName")));
				shillaHaeundaeList.add(shillaMap);
				}
			}
        	
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    public ArrayList<HashMap<String,String>> getShillaHaeundaeList() {
    	this.getShillaHaeundae();
    	System.out.println(shillaHaeundaeList);
    	  Collections.sort(shillaHaeundaeList, new Comparator<HashMap<String, String >>() {
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

        System.out.println(shillaHaeundaeList);

    	return	shillaHaeundaeList;
    }
    // 파라다이스
public void getParadise(){
        

        String sql = "SELECT h_siteName, h_price, h_url FROM tb_hotels WHERE h_hotel = 9";
        try {
        	conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(("h_price")) != null) {
				paradiseMap = new HashMap<String, String>();
				paradiseMap.put("price2", rs.getString(("h_price")));
				paradiseMap.put("url12", rs.getString(("h_url")));
				paradiseMap.put("logo", rs.getString(("h_siteName")));
				paradiseList.add(paradiseMap);
				}
			}
        	
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    public ArrayList<HashMap<String,String>> getParadiseList() {

    	this.getParadise();
    	System.out.println(paradiseList);
    	  Collections.sort(paradiseList, new Comparator<HashMap<String, String >>() {
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

        System.out.println(paradiseList);

    	return	paradiseList;
    }
    // 라발스
public void getLavalse(){
        

        String sql = "SELECT h_siteName, h_price, h_url FROM tb_hotels WHERE h_hotel = 10";
        try {
        	conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(("h_price")) != null) {
				lavalseMap = new HashMap<String, String>();
				lavalseMap.put("price3", rs.getString(("h_price")));
				lavalseMap.put("url13", rs.getString(("h_url")));
				lavalseMap.put("logo", rs.getString(("h_siteName")));
				lavalseList.add(lavalseMap);
				}
			}
        	
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    public ArrayList<HashMap<String,String>> getLavalseList() {

    	this.getLavalse();
    	System.out.println(lavalseList);
    	  Collections.sort(lavalseList, new Comparator<HashMap<String, String >>() {
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

        System.out.println(lavalseList);

    	return	lavalseList;
    }
    // 라마다
public void getRamada(){
        

        String sql = "SELECT h_siteName, h_price, h_url FROM tb_hotels WHERE h_hotel = 11";
        try {
        	conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(("h_price")) != null) {
				ramadaMap = new HashMap<String, String>();
				ramadaMap.put("price4", rs.getString(("h_price")));
				ramadaMap.put("url14", rs.getString(("h_url")));
				ramadaMap.put("logo", rs.getString(("h_siteName")));
				ramadaList.add(ramadaMap);
				}
			}
        	
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    public ArrayList<HashMap<String,String>> getRamadaList() {
    	this.getRamada();
    	System.out.println(ramadaList);
    	  Collections.sort(ramadaList, new Comparator<HashMap<String, String >>() {
    	        public int compare(HashMap<String, String> first,
    	                HashMap<String, String> second) {
    	            
    	            int firstValue = Integer.valueOf(first.get("price4"));
    	            int secondValue = Integer.valueOf(second.get("price4"));
    	            
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

        System.out.println(ramadaList);

    	return	ramadaList;
    }
}
