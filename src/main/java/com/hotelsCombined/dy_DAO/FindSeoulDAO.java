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

import com.hotelsCombined.dy_DTO.HotelsDTO;
import com.hotelsCombined.dy_DTO.SearchInfoDTO;
import com.hotels.db.DBconn;



public class FindSeoulDAO {
    HashMap<String, String> nineMap = null;
    HashMap<String, String> gladMap = null;
    HashMap<String, String> gladGangnamMap = null;
    HashMap<String, String> lotteMap = null;
    HashMap<String, String> shillaStayMap = null;
    ArrayList<HashMap<String, String>> nineTreeList = new ArrayList<HashMap<String,String>>();
    ArrayList<HashMap<String, String>> gladMapoList = new ArrayList<HashMap<String,String>>();
    ArrayList<HashMap<String, String>> gladGangnamList = new ArrayList<HashMap<String,String>>();
    ArrayList<HashMap<String, String>> lotteCityList = new ArrayList<HashMap<String,String>>();
    ArrayList<HashMap<String, String>> shillaStayList = new ArrayList<HashMap<String,String>>();
    
    Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;


	
    public void getNineTree(){
       

        String sql = "SELECT h_siteName, h_price, h_url FROM tb_hotels WHERE h_hotel = 3 AND h_price IS NOT null";
        try {
        	conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(("h_price")) != null) {
				nineMap = new HashMap<String, String>();
	            nineMap.put("price1", rs.getString(("h_price")));
	            nineMap.put("url1", rs.getString(("h_url")));
	            nineMap.put("logo", rs.getString(("h_siteName")));
	            nineTreeList.add(nineMap);
				}
			}
        	
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

   
    public ArrayList<HashMap<String,String>> getNineTreeList() {
    	this.getNineTree();
    	System.out.println(nineTreeList);
    	  Collections.sort(nineTreeList, new Comparator<HashMap<String, String >>() {
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



    	return	nineTreeList;
    }
    // 글래드 마포
    public void getGladMapo(){
        

        String sql = "SELECT h_siteName, h_price, h_url FROM tb_hotels WHERE h_hotel = 4 AND h_price IS NOT null";
        String price ="";
        try {
        	conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(("h_price")) != null) {
				gladMap = new HashMap<String, String>();
				gladMap.put("price2", rs.getString(("h_price")));
				gladMap.put("url2", rs.getString(("h_url")));
				gladMap.put("logo", rs.getString(("h_siteName")));
				gladMapoList.add(gladMap);
				}
			}
        	
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    public ArrayList<HashMap<String,String>> getGladMapoList() {
    	this.getGladMapo();
    	  Collections.sort(gladMapoList, new Comparator<HashMap<String, String >>() {
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
        System.out.println(gladMapoList);

    	return	gladMapoList;
    }
    // 글래드 강남
    public void getGladGangnam(){
        

        String sql = "SELECT h_siteName, h_price, h_url FROM tb_hotels WHERE h_hotel = 6 AND h_price IS NOT null";
        try {
        	conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(("h_price")) != null) {
				gladGangnamMap = new HashMap<String, String>();
				gladGangnamMap.put("price3", rs.getString(("h_price")));
				gladGangnamMap.put("url3", rs.getString(("h_url")));
				gladGangnamMap.put("logo", rs.getString(("h_siteName")));
				gladGangnamList.add(gladGangnamMap);
				}
			}
        	
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
   
    public ArrayList<HashMap<String,String>> getGladGangnamList() {
    	this.getGladGangnam();
    	  Collections.sort(gladGangnamList, new Comparator<HashMap<String, String >>() {
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

        System.out.println(gladGangnamList);

    	return	gladGangnamList;
    }
    // 롯데시티
    public void getLotteCity(){
        

        String sql = "SELECT h_siteName, h_price, h_url FROM tb_hotels WHERE h_hotel = 5 AND h_price IS NOT null";
        try {
        	conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				if(rs.getString(("h_price")) != null) {
				lotteMap = new HashMap<String, String>();
				lotteMap.put("price4", rs.getString(("h_price")));
				lotteMap.put("url4", rs.getString(("h_url")));
				lotteMap.put("logo", rs.getString(("h_siteName")));
				lotteCityList.add(lotteMap);
				}
			}
        	
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    public ArrayList<HashMap<String,String>> getLotteCityList() {
    	this.getLotteCity();
    	
    	System.out.println(lotteCityList);
    	  Collections.sort(lotteCityList, new Comparator<HashMap<String, String >>() {
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

        System.out.println(lotteCityList);

    	return	lotteCityList;
    }
    //신라스테이
    public void getShillaStay(){
        

        String sql = "SELECT h_siteName, h_price, h_url FROM tb_hotels WHERE h_hotel =7 AND h_price IS NOT null";
        try {
        	conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				
				shillaStayMap = new HashMap<String, String>();
				shillaStayMap.put("price5", rs.getString(("h_price")));
				shillaStayMap.put("url5", rs.getString(("h_url")));
				shillaStayMap.put("logo", rs.getString(("h_siteName")));
				shillaStayList.add(shillaStayMap);
				
			}
        	
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    public ArrayList<HashMap<String,String>> getShillaStayList() {
    	this.getShillaStay();
    	System.out.println(shillaStayList);
    	  Collections.sort(shillaStayList, new Comparator<HashMap<String, String >>() {
    	        public int compare(HashMap<String, String> first,
    	                HashMap<String, String> second) {
    	            
    	            int firstValue = Integer.valueOf(first.get("price5"));
    	            int secondValue = Integer.valueOf(second.get("price5"));
    	            
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

        System.out.println(shillaStayList);

    	return	shillaStayList;
    } 
}
