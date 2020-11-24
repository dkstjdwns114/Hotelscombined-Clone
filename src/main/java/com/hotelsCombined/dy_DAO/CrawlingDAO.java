package com.hotelsCombined.dy_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.NoSuchElementException;

import org.openqa.selenium.By;
import org.openqa.selenium.InvalidArgumentException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;


import com.hotels.db.DBconn;

public class CrawlingDAO {
	
	public static String DRIVER_ID = "webdriver.chrome.driver";
	// 각자 컴퓨터에 있는 chromedriver 경로를 맞추셔야됩니다.
    public static String DRIVER_PATH = "C:/asj/정규과정/JSP/chromedriver.exe";
    WebDriver driver;
    LocalDate currentDate = LocalDate.now();
    LocalDate tomorrowDate = LocalDate.now().plusDays(1);
    Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	 String sql = "INSERT INTO tb_hotels(h_hotel, h_siteName, h_price, h_desc, h_url) VALUES(?,?,?,?,?)";
	
	
	
	String skybayAgodaurl ="https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin="+currentDate+"&checkout="+tomorrowDate+"&NumberofAdults=1&NumberofChildren=0&Rooms=1&mcid=3038&tag=4916267,pid1334087373&selectedproperty=4916267&city=19041&adults=1&children=0&hc=KRW&los=1";
	String skybayHotelpassurl ="http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRKAG&hoteltype=2&hotelCode=KRKAG013&checkInDate="+currentDate+"&checkOutDate="+tomorrowDate+"&RoomPassen=1,0,_/&mAgentCD=A000002227&ConversionID=1334089381&NaverYN=N";
	String skybayHotelsurl ="https://kr.hotels.com/web/ho680372352?pos=HCOM_KR&locale=ko_KR&q-rooms=1&q-room-0-adults=1&q-room-0-children=0&q-check-in="+currentDate+"&q-check-out="+tomorrowDate+"&cur=KRW&wapa2=680372352&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334099119";
	String st_JohnAgodaurl ="https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin="+currentDate+"&checkout="+tomorrowDate+"&NumberofAdults=1&NumberofChildren=0&Rooms=1&mcid=3038&tag=3541400,pid1334087618&selectedproperty=3541400&city=19041&adults=1&children=0&hc=KRW&los=1";
	String st_JohnHotelpassurl ="http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRKAG&hoteltype=2&hotelCode=KRKAG011&checkInDate="+currentDate+"&checkOutDate="+tomorrowDate+"&RoomPassen=1,0,_/&mAgentCD=A000002227&ConversionID=1334089323&NaverYN=N";
	String st_JohnHotelsurl ="https://kr.hotels.com/web/ho655304448?pos=HCOM_KR&locale=ko_KR&q-rooms=1&q-room-0-adults=1&q-room-0-children=0&q-check-in="+currentDate+"&q-check-out="+tomorrowDate+"&cur=KRW&wapa2=655304448&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334088876";
	String nineAgodaurl = "https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin="+currentDate+"&checkout="+tomorrowDate+"&NumberofAdults=1&NumberofChildren=0&Rooms=1&mcid=3038&tag=9119187,pid1332867663&selectedproperty=9119187&city=14690&adults=1&children=0&hc=KRW&los=1";
	String nineHotelpassurl ="http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRSEL&hoteltype=2&hotelCode=KRSEL470&checkInDate="+currentDate+"&checkOutDate="+tomorrowDate+"&RoomPassen=1,0,_/&mAgentCD=A000002227&ConversionID=1334089624&NaverYN=N";
	String nineHotelsurl ="https://kr.hotels.com/web/ho1253871168?pos=HCOM_KR&locale=ko_KR&q-rooms=1&q-room-0-adults=1&q-room-0-children=0&q-check-in="+currentDate+"&q-check-out="+tomorrowDate+"&cur=KRW&wapa2=1253871168&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089001";
	String lotteAgodaurl = "https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin="+currentDate+"&checkout="+tomorrowDate+"&NumberofAdults=1&NumberofChildren=0&Rooms=1&mcid=332&tag=1061347,pid1334087746&selectedproperty=1061347&city=14690&adults=1&children=0&hc=KRW&los=1";
	String lotteHotelpassurl = "http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRSEL&hoteltype=2&hotelCode=KRSEL323&checkInDate="+currentDate+"&checkOutDate="+tomorrowDate+"&RoomPassen=1,0,_/&mAgentCD=A000002227&ConversionID=1334089175&NaverYN=N";
	String lotteHotelsurl = "https://kr.hotels.com/web/ho555459?pos=HCOM_KR&locale=ko_KR&q-rooms=1&q-room-0-adults=1&q-room-0-children=0&q-check-in="+currentDate+"&q-check-out="+tomorrowDate+"&cur=KRW&wapa2=555459&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089055";
	String gladMAgodaurl = "https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin="+currentDate+"&checkout="+tomorrowDate+"&NumberofAdults=1&NumberofChildren=0&Rooms=1&mcid=3038&tag=4453651,pid1334085165&selectedproperty=4453651&city=14690&adults=1&children=0&hc=KRW&los=1";
	String gladMHotelpass = "";
	String gladMHotelsurl = "https://kr.hotels.com/web/ho738407680?pos=HCOM_KR&locale=ko_KR&q-rooms=1&q-room-0-adults=1&q-room-0-children=0&q-check-in="+currentDate+"&q-check-out="+tomorrowDate+"&cur=KRW&wapa2=738407680&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089094"; 
	String gladGAgodaurl = "https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin="+currentDate+"&checkout="+tomorrowDate+"&NumberofAdults=1&NumberofChildren=0&Rooms=1&mcid=3038&tag=3759721,pid1334085352&selectedproperty=3759721&city=14690&adults=1&children=0&hc=KRW&los=1";
	String gladGHotelpassurl = "http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRSEL&hoteltype=2&hotelCode=KRSEL363&checkInDate="+currentDate+"&checkOutDate="+tomorrowDate+"&RoomPassen=1,0,_/&mAgentCD=A000002227&ConversionID=1334089478&NaverYN=N";
	String gladGHotelsurl = "https://kr.hotels.com/web/ho692847744?pos=HCOM_KR&locale=ko_KR&q-rooms=1&q-room-0-adults=1&q-room-0-children=0&q-check-in="+currentDate+"&q-check-out="+tomorrowDate+"&cur=KRW&wapa2=692847744&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089149"; 
	String shillaSAgodaurl ="https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin="+currentDate+"&checkout="+tomorrowDate+"&NumberofAdults=1&NumberofChildren=0&Rooms=1&mcid=332&tag=1974802,pid1334087855&selectedproperty=1974802&city=14690&adults=1&children=0&hc=KRW&los=1";
	String shillaSHotelpassurl ="http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRSEL&hoteltype=2&hotelCode=KRSEL343&checkInDate="+currentDate+"&checkOutDate="+tomorrowDate+"&RoomPassen=1,0,_/&mAgentCD=A000002227&ConversionID=1334089106&NaverYN=N";
	String shillaSHotelsurl ="https://kr.hotels.com/web/ho672401?pos=HCOM_KR&locale=ko_KR&q-rooms=1&q-room-0-adults=1&q-room-0-children=0&q-check-in="+currentDate+"&q-check-out="+tomorrowDate+"&cur=KRW&wapa2=672401&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089210";
	String shillaHAgodaurl = "https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin="+currentDate+"&checkout="+tomorrowDate+"&NumberofAdults=1&NumberofChildren=0&Rooms=1&mcid=332&tag=1974844,pid1334087980&selectedproperty=1974844&city=17172&adults=1&children=0&hc=KRW&los=1";
	String shillaHHotelpassurl = "http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRPUS&hoteltype=2&hotelCode=KRPUS335&checkInDate="+currentDate+"&checkOutDate="+tomorrowDate+"&RoomPassen=1,0,_/&mAgentCD=A000002227&ConversionID=1334089052&NaverYN=N";
	String shillaHHotelsurl = "https://kr.hotels.com/web/ho673757?pos=HCOM_KR&locale=ko_KR&q-rooms=1&q-room-0-adults=1&q-room-0-children=0&q-check-in="+currentDate+"&q-check-out="+tomorrowDate+"&cur=KRW&wapa2=673757&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089360";
	String praradiseAgodaurl = "https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin="+currentDate+"&checkout="+tomorrowDate+"&NumberofAdults=1&NumberofChildren=0&Rooms=1&mcid=3038&tag=2070028,pid1334088086&selectedproperty=2070028&city=17234&adults=1&children=0&hc=KRW&los=1";
	String praradiseHotelpassurl = "http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRPUS&hoteltype=2&hotelCode=KAPUS003&checkInDate="+currentDate+"&checkOutDate="+tomorrowDate+"&RoomPassen=1,0,_/&mAgentCD=A000002227&ConversionID=1334088949&NaverYN=N";
	String praradiseHotelsurl = "https://kr.hotels.com/web/ho673757?pos=HCOM_KR&locale=ko_KR&q-rooms=1&q-room-0-adults=1&q-room-0-children=0&q-check-in="+currentDate+"&q-check-out="+tomorrowDate+"&cur=KRW&wapa2=673757&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089485";
	String lavalseAgodaurl = "https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin="+currentDate+"&checkout="+tomorrowDate+"&NumberofAdults=1&NumberofChildren=0&Rooms=1&mcid=3038&tag=6868772,pid1334088196&selectedproperty=6868772&city=17172&adults=1&children=0&hc=KRW&los=1";
	String lavalseHotelpassurl = "";
	String lavalseHotelsurl = "https://kr.hotels.com/web/ho1104634464?pos=HCOM_KR&locale=ko_KR&q-rooms=1&q-room-0-adults=1&q-room-0-children=0&q-check-in="+currentDate+"&q-check-out="+tomorrowDate+"&cur=KRW&wapa2=1104634464&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089565";
	String ramadaAgodaurl ="https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin="+currentDate+"&checkout="+tomorrowDate+"&NumberofAdults=1&NumberofChildren=0&Rooms=1&mcid=3038&tag=2205026,pid1334088286&selectedproperty=2205026&city=17172&adults=1&children=0&hc=KRW&los=1";
	String ramadaHotelpassurl ="http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRPUS&hoteltype=2&hotelCode=KRPUS337&checkInDate="+currentDate+"&checkOutDate="+tomorrowDate+"&RoomPassen=1,0,_/&mAgentCD=A000002227&ConversionID=1334088719&NaverYN=N";
	String ramadaHotelsurl ="https://kr.hotels.com/web/ho619695648?pos=HCOM_KR&locale=ko_KR&q-rooms=1&q-room-0-adults=1&q-room-0-children=0&q-check-in="+currentDate+"&q-check-out="+tomorrowDate+"&cur=KRW&wapa2=619695648&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334089627";
	String amantiAgodaurl = "https://www.agoda.com/ko-kr/search?cid=1617473&currency=KRW&checkin="+currentDate+"&checkout="+tomorrowDate+"&NumberofAdults=1&NumberofChildren=0&Rooms=1&mcid=332&tag=1197749,pid1334088386&selectedproperty=1197749&city=14690&adults=1&children=0&hc=KRW&los=1";
	String amantiHotelpassurl = "http://hotelscombined.hotelpass.com/search/detail.asp?cmd=infoHotel&sNatCtyCode=KRSEL&hoteltype=2&hotelCode=KRSEL383&checkInDate="+currentDate+"&checkOutDate="+tomorrowDate+"&RoomPassen=1,0,_/&mAgentCD=A000002227&ConversionID=1334088580&NaverYN=N";
	String amantiHotelsurl = "https://kr.hotels.com/web/ho600060?pos=HCOM_KR&locale=ko_KR&q-rooms=1&q-room-0-adults=1&q-room-0-children=0&q-check-in="+currentDate+"&q-check-out="+tomorrowDate+"&cur=KRW&wapa2=600060&rffrid=mdp.hcom.KR.112.158.02.kwrd=1334090043";

	public void getAgoda() throws InterruptedException{
		String agodaurl[] = {null, skybayAgodaurl,st_JohnAgodaurl, nineAgodaurl, gladMAgodaurl, lotteAgodaurl, gladGAgodaurl, shillaSAgodaurl, shillaHAgodaurl, praradiseAgodaurl, lavalseAgodaurl, ramadaAgodaurl, amantiAgodaurl};
		for(int i=0; i<agodaurl.length; i++) {
		System.setProperty(DRIVER_ID, DRIVER_PATH);
		if(agodaurl[i] == null) {continue;}
        driver = new ChromeDriver();
        String price ="";
        String newPrice =null;
        
        	
        try {
        	
          driver.get(agodaurl[i]);
            Thread.sleep(5000);
            price= driver.findElement(By.className("PropertyCardPrice__Value")).getText();
             newPrice = price.replace(",", "");
            System.out.println(newPrice);
            driver.close();
        } catch (Exception e) {
            e.printStackTrace();
            driver.close();
        }
        try {
			conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i);
			pstmt.setString(2, "agoda");
			pstmt.setString(3, newPrice);
			pstmt.setString(4, "디럭스 트윈룸");
			pstmt.setString(5, agodaurl[i]);
			pstmt.executeUpdate();
			System.out.println("호텔 번호 : " + i+ ", 사이트 명 : agoda, 가격 : "+ newPrice +", 룸 정보 : 다럭스 트윈룸, url :"+ agodaurl[i] );

        }catch(Exception e) {
        	e.printStackTrace();
        }
       }
    	
    }
    public void getHotelpass(){
    	String hotelpassurl[] = {null, skybayHotelpassurl, st_JohnHotelpassurl, nineHotelpassurl, gladMHotelpass, lotteHotelpassurl, gladGHotelpassurl, shillaSHotelpassurl, shillaHHotelpassurl, praradiseHotelpassurl, lavalseHotelpassurl, ramadaHotelpassurl, amantiHotelpassurl};

    	for(int i=0; i<hotelpassurl.length; i++) {
        	
        if(hotelpassurl[i] == null) {continue;}
        System.setProperty(DRIVER_ID, DRIVER_PATH);
        driver = new ChromeDriver();
        String price ="";
        String newPrice =null;
        String desc =null;
        
        try {

        	driver.get(hotelpassurl[i]);
            Thread.sleep(5000);
            price= driver.findElement(By.className("price_red")).getText();
            newPrice = price.substring(1).replace(",", "");
            desc = driver.findElement(By.cssSelector(".roomtype > strong")).getText();
            System.out.println(newPrice);
            driver.close();
            
        	
        } catch (Exception e) {
            e.printStackTrace();
            driver.close();
        }
        try {

			conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i);
			pstmt.setString(2, "hotelpass");
			pstmt.setString(3, newPrice);
			pstmt.setString(4, desc);
			pstmt.setString(5, hotelpassurl[i]);
			pstmt.executeUpdate();
			System.out.println("호텔 번호 : " + i+ ", 사이트 명 : agoda, 가격 : "+ newPrice +", 룸 정보 :"+desc+", url :"+ hotelpassurl[i] );
        }catch(Exception e) {
        	e.printStackTrace();
       
        }
        }

    }
    public void getHotels(){
    	 String hotelsurl[] = {null, skybayHotelsurl, st_JohnHotelsurl, nineHotelsurl, gladMHotelsurl, lotteHotelsurl, gladGHotelsurl, shillaSHotelsurl, shillaHHotelsurl, praradiseHotelsurl, lavalseHotelsurl, ramadaHotelsurl, amantiHotelsurl};

    	 for(int i=0; i<hotelsurl.length; i++) {
        System.setProperty(DRIVER_ID, DRIVER_PATH);
        if(hotelsurl[i] == null) {continue;}

        driver = new ChromeDriver();
        String price ="";
        String newPrice =null;
        String desc =null;
        
        try {
        	driver.get(hotelsurl[i]);
           
            Thread.sleep(5000);
            price= driver.findElement(By.className("current-price")).getText();
            newPrice = price.substring(1).replace(",", "");
            desc = driver.findElement(By.cssSelector("h3 > span.room-name")).getText();
            System.out.println(desc);
            driver.close();
        } catch (Exception e) {
            e.printStackTrace();
            driver.close();
        }
        try {
        	if(newPrice != null) {
			conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i);
			pstmt.setString(2, "hotels");
			pstmt.setString(3, newPrice);
			pstmt.setString(4, desc);
			pstmt.setString(5, hotelsurl[i]);
			pstmt.executeUpdate();
			System.out.println("호텔 번호 : " + i+ ", 사이트 명 : agoda, 가격 : "+ newPrice +", 룸 정보 :"+desc+", url :"+ hotelsurl[i] );
        	}
        }catch(Exception e) {
        	e.printStackTrace();
        	driver.close();
        }
        }

    }
    ////-------------------------------------------------------------------
    public void getNineagoda() {
    	System.setProperty(DRIVER_ID, DRIVER_PATH);
    	driver = new ChromeDriver();
        String price ="";
        String newPrice =null;
        String desc =null;
            try {
            	
                driver.get(nineAgodaurl);
                  Thread.sleep(5000);
                  price= driver.findElement(By.className("PropertyCardPrice__Value")).getText();
                   newPrice = price.replace(",", "");
                  System.out.println(newPrice);
                  driver.close();
              } catch (Exception e) {
                  e.printStackTrace();
                  driver.close();
              }
        try {
        	if(newPrice != null) {
			conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 3);
			pstmt.setString(2, "agoda");
			pstmt.setString(3, newPrice);
			pstmt.setString(4, desc);
			pstmt.setString(5, nineAgodaurl);
			pstmt.executeUpdate();
			System.out.println("호텔 번호 : 3"+ ", 사이트 명 : agoda, 가격 : "+ newPrice +", 룸 정보 : 디럭스 더블룸, url :"+ nineAgodaurl );
        	}
        }catch(Exception e) {
        	e.printStackTrace();
        	driver.close();
        }
        }
    
    public void getNineHotelpass() {
    	
    	System.setProperty(DRIVER_ID, DRIVER_PATH);
    	driver = new ChromeDriver();
        String price ="";
        String newPrice =null;
        String desc =null;
        try {
        	
      	driver.get(nineHotelpassurl);
            Thread.sleep(5000);
            price= driver.findElement(By.className("price_red")).getText();
            newPrice = price.substring(1).replace(",", "");
            desc = driver.findElement(By.cssSelector(".roomtype > strong")).getText();
            System.out.println(newPrice);
            driver.close();
            
        	
        } catch (Exception e) {
            e.printStackTrace();
            driver.close();
        }
        try {
        	if(newPrice != null) {
			conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 3);
			pstmt.setString(2, "hotelpass");
			pstmt.setString(3, newPrice);
			pstmt.setString(4, desc);
			pstmt.setString(5, nineHotelpassurl);
			pstmt.executeUpdate();
			System.out.println("호텔 번호 : 3, 사이트 명 : hotelpass, 가격 : "+ newPrice +", 룸 정보 :"+desc+", url :"+nineHotelpassurl);
        	}
        }catch(Exception e) {
        	e.printStackTrace();
        	driver.close();
        
        }
    }
    public void getNineHotels(){
   	 
       System.setProperty(DRIVER_ID, DRIVER_PATH);

       driver = new ChromeDriver();
       String price ="";
       String newPrice =null;
       String desc =null;
       
       try {
       	driver.get(nineHotelsurl);
          
           Thread.sleep(5000);
           price= driver.findElement(By.className("current-price")).getText();
           newPrice = price.substring(1).replace(",", "");
           desc = driver.findElement(By.cssSelector("h3 > span.room-name")).getText();
           System.out.println(desc);
           driver.close();
       } catch (Exception e) {
           e.printStackTrace();
           driver.close();
       }
       try {
       	if(newPrice != null) {
			conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 3);
			pstmt.setString(2, "hotels");
			pstmt.setString(3, newPrice);
			pstmt.setString(4, desc);
			pstmt.setString(5, nineHotelsurl);
			pstmt.executeUpdate();
			System.out.println("호텔 번호 : 3 , 사이트 명 : hotels, 가격 : "+ newPrice +", 룸 정보 :"+desc+", url :"+ nineHotelsurl );
       	}
       }catch(Exception e) {
       	e.printStackTrace();
       	driver.close();
       }
       }
    //=--------------------------------------------------------
    public void getGladagoda() {
    	System.setProperty(DRIVER_ID, DRIVER_PATH);
    	driver = new ChromeDriver();
        String price ="";
        String newPrice =null;
        String desc =null;
            try {
            	
                driver.get(gladMAgodaurl);
                  Thread.sleep(5000);
                  price= driver.findElement(By.className("PropertyCardPrice__Value")).getText();
                   newPrice = price.replace(",", "");
                  System.out.println(newPrice);
                  driver.close();
              } catch (Exception e) {
                  e.printStackTrace();
                  driver.close();
              }
        try {
        	if(newPrice != null) {
			conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 4);
			pstmt.setString(2, "agoda");
			pstmt.setString(3, newPrice);
			pstmt.setString(4, desc);
			pstmt.setString(5, gladMAgodaurl);
			pstmt.executeUpdate();
			System.out.println("호텔 번호 : 3"+ ", 사이트 명 : agoda, 가격 : "+ newPrice +", 룸 정보 : 디럭스 더릅룸, url :"+ gladMAgodaurl );
        	}
        }catch(Exception e) {
        	e.printStackTrace();
        	driver.close();
        }
        }
    

    public void getGladHotels(){
   	 
       System.setProperty(DRIVER_ID, DRIVER_PATH);

       driver = new ChromeDriver();
       String price ="";
       String newPrice =null;
       String desc =null;
       
       try {
       	driver.get(gladMHotelsurl);
          
           Thread.sleep(5000);
           price= driver.findElement(By.className("current-price")).getText();
           newPrice = price.substring(1).replace(",", "");
           desc = driver.findElement(By.cssSelector("h3 > span.room-name")).getText();
           System.out.println(desc);
           driver.close();
       } catch (Exception e) {
           e.printStackTrace();
           driver.close();
       }
       try {
       	if(newPrice != null) {
			conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, 4);
			pstmt.setString(2, "hotels");
			pstmt.setString(3, newPrice);
			pstmt.setString(4, desc);
			pstmt.setString(5, gladMHotelsurl);
			pstmt.executeUpdate();
			System.out.println("호텔 번호 : 3 , 사이트 명 : hotles, 가격 : "+ newPrice +", 룸 정보 :"+desc+", url :"+ gladMHotelsurl );
       	}
       }catch(Exception e) {
       	e.printStackTrace();
       	driver.close();
       }
       }
   
    ///-----------------------------------------

public void update(){
        String sql = "TRUNCATE tb_hotels";
        try {
        	conn = DBconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println("db를 초기화합니다.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void crawlingAll() throws InterruptedException {
    	this.update();
    	// 아래의 5개는 홈페이지 시연할 때 짧게하려고 썼던 코드입니다.
//    	this.getNineagoda();
//    	this.getNineHotelpass();
//    	this.getNineHotels();
//    	this.getGladagoda();
//    	this.getGladHotels();
    	
    	
    	// 아래의 3개는 12개의 호텔의 아고다, 호텔페스, 호텔스 페이지를 크롤링 하는 코드입니다.
    	this.getAgoda();
    	this.getHotelpass();
    	this.getHotels();
    	
    	// 짧게 크롤링하려면 아래의 3줄을 주석처리해야되고, 모두 크롤링하려면 위의 5줄을 주석처리 해야됩니다.

    }
    


}
