package com.hotelsCombined.dy_DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.hotels.db.DBconn;

public class GetPriceDAO {
	
				Connection conn;
				PreparedStatement pstmt;
				ResultSet rs;
				String sql = "";
				String[] r_price = new String[13];
				String[] r_desc = new String[13];
				public String[] getOurPrice() {
				try {
					Class.forName("org.mariadb.jdbc.Driver");
					conn = DBconn.getConnection();
					if(conn != null){
					for(int i=1; i<=12; i++) {
					String sql = "SELECT MIN(r_price) AS minprice FROM tb_room WHERE r_hotelidx = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, i);
					rs = pstmt.executeQuery();
					if(rs.next()){
						r_price[i] = Integer.toString((Integer.parseInt(rs.getString("minprice")) - 10000));
								}
					
						}
					}
					}catch (Exception e){
						e.printStackTrace();
					}
				return r_price;
				}
				
				public String[] getDesc() {
					try {
						Class.forName("org.mariadb.jdbc.Driver");
						conn = DBconn.getConnection();
						if(conn != null){
						for(int i=1; i<=12; i++) {
						String sql = "SELECT MIN(r_price) AS minprice, r_name FROM tb_room WHERE r_hotelidx = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, i);
						rs = pstmt.executeQuery();
						if(rs.next()){
							r_desc[i] = rs.getString("r_name");
									}
							}
						}
						}catch (Exception e){
							e.printStackTrace();
						}
					return r_desc;
					}


					
}
				
