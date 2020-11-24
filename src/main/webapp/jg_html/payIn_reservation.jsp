<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.Calendar, java.text.DateFormat, java.text.SimpleDateFormat, java.sql.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	if(session.getAttribute("idx") == null || session.getAttribute("idx").equals("")){
%>		
	<script>
		alert("로그인 후 이용하세요.");
		location.href="../asj_html/login.jsp";
	</script>
<%
		return;
	}
%>
<jsp:useBean id="member" class="com.hotels.member.MemberDTO"></jsp:useBean>
<jsp:useBean id="dao" class="com.hotels.member.MemberDAO"></jsp:useBean>
<%
	int u_idx = Integer.parseInt(String.valueOf(session.getAttribute("idx")));
	
	member = dao.info(u_idx);
	System.out.println(member);
	if(member == null){
%>
	<script>
		alert("잘못된 접속입니다.");
		location.href="../asj_html/login.jsp";
	</script>
<%
		return;
	}
%>
<!DOCTYPE html>
<html lang="en">
<%
	request.setCharacterEncoding("UTF-8");
	String user_coupon = request.getParameter("user_coupon");
	
	
	
	
	String filter_checkin = request.getParameter("filter_checkin");
	String filter_checkout = request.getParameter("filter_checkout");
	String filter_adult = request.getParameter("filter_adult");
	String h_idx = request.getParameter("h_idx");
	String img_path = "./payIn_images/hotel_images/hotel" + h_idx + "_image";
	String room_arr_str = request.getParameter("room_arr_str");
	String[] room_arr_list = room_arr_str.split("\\.");
	int room_num = room_arr_list.length;
	int[] room_arr = new int[room_num];
	int selected_room_cnt = 0;
	for(int i = 0; i < room_num; i++){
		room_arr[i] = Integer.parseInt(room_arr_list[i]);
		selected_room_cnt += room_arr[i];
	}	

	String[] checkin_date = filter_checkin.split("-");
	String[] checkout_date = filter_checkout.split("-");
	
	String[] sql_insert = new String[selected_room_cnt];
	for(int i = 0; i < selected_room_cnt; i++){
		sql_insert[i] = "INSERT INTO tb_reservation (res_purpose, res_last_name, res_first_name, res_email, res_guest, res_guest_name,"
				+" res_guest_email, res_other_name, res_other_email, res_rent_car, res_changeable,res_nation,res_ph," 
				+ "res_useridx,res_hotelidx, res_roomName, res_checkin,res_checkout,res_people,res_price)"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	}
	String trip_purpose  = request.getParameter("trip_purpose");
	String last_name = request.getParameter("last_name");
	String first_name = request.getParameter("first_name");
	String user_email = request.getParameter("user_email");
	String user_email_re = request.getParameter("user_email_re");
	String book_for_whom  = request.getParameter("book_for_whom");
	String[] per_people = new String[selected_room_cnt];
	for(int i = 0; i < selected_room_cnt; i++){
		per_people[i] = request.getParameter("per_people" + i);
	}	
	String[] guest_name = new String[selected_room_cnt];
	for(int i = 0; i < selected_room_cnt; i++){
		guest_name[i] = request.getParameter("guest_name" + i);
	}
	String[] other_name = new String[selected_room_cnt];
	for(int i = 0; i < selected_room_cnt; i++){
		other_name[i] = request.getParameter("other_name" + i);
	}
	String[] other_email = new String[selected_room_cnt];
	for(int i = 0; i < selected_room_cnt; i++){
		other_email[i] = request.getParameter("other_email" + i);
	}
	String[] modifiable = new String[selected_room_cnt];
	for(int i = 0; i < selected_room_cnt; i++){
		modifiable[i] = request.getParameter("modifiable" + i);
	}
	
	String[] rent_car = new String[selected_room_cnt];
	for(int i = 0; i < selected_room_cnt; i++){
		rent_car[i] = request.getParameter("rent_car" + i);
	}

	String toHotelMsg = request.getParameter("toHotelMsg");
	String arrive_time = request.getParameter("arrive_time");
	String nation = request.getParameter("nation");
	String user_ph = request.getParameter("user_ph");
	
	Calendar cal = Calendar.getInstance();
	cal.set(Integer.parseInt(checkin_date[0]), Integer.parseInt(checkin_date[1]) - 1, Integer.parseInt(checkin_date[2]));
	int dayNum_checkin = cal.get(Calendar.DAY_OF_WEEK);
	String day_checkin = "";
	String[] str_list = null;
    
   switch(dayNum_checkin){
       case 1:
    	   day_checkin = "(일)";
           break ;
       case 2:
    	   day_checkin = "(월)";
           break ;
       case 3:
    	   day_checkin = "(화)";
           break ;
       case 4:
    	   day_checkin = "(수)";
           break ;
       case 5:
    	   day_checkin = "(목)";
           break ;
       case 6:
    	   day_checkin = "(금)";
           break ;
       case 7:
    	   day_checkin = "(토)";
           break ;            
   }

	Calendar cal2 = Calendar.getInstance();
	cal2.set(Integer.parseInt(checkout_date[0]), Integer.parseInt(checkout_date[1]) - 1, Integer.parseInt(checkout_date[2]));
	
	Calendar cal_cancle = Calendar.getInstance();
	cal_cancle.set(Integer.parseInt(checkout_date[0]), Integer.parseInt(checkout_date[1]) - 1, Integer.parseInt(checkout_date[2]));
	cal_cancle.add(Calendar.DATE, -2);
	
	int dayNum_checkout = cal2.get(Calendar.DAY_OF_WEEK);
	String day_checkout = "";
  
   
  	switch(dayNum_checkout){
      case 1:
    	  day_checkout = "(일)";
          break ;
      case 2:
    	  day_checkout = "(월)";
          break ;
      case 3:
    	  day_checkout = "(화)";
          break ;
      case 4:
    	  day_checkout = "(수)";
          break ;
      case 5:
    	  day_checkout = "(목)";
          break ;
      case 6:
    	  day_checkout = "(금)";
          break ;
      case 7:
    	  day_checkout = "(토)";
          break ;            
 	 }	
	
  	long calDate = cal2.getTimeInMillis() - cal.getTimeInMillis();
  	long term = calDate / ( 24*60*60*1000); 
  	term = Math.abs(term);
  	if(term == 0){
  		term = 1;
  	}
    
	String url = "jdbc:mariadb://localhost:3306/hotels";
	String uid = "root";
	String upw = "1234";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;
	PreparedStatement[] pstmt_insert = new PreparedStatement[selected_room_cnt];
	String h_name = "";
	String h_location = "";
	long r_idx = 0;
	String r_name = "";
	String r_bed = "";
	String r_explaination = "";
	String r_spec = "";
	String r_spec_sub = "";
	int r_people = 0;
	int r_price = 0;
	int r_tax = 0;
	String r_good_option = "";
	String r_option = "";
	int cnt = 0;
	int r_available = 0;
	int last_td = 0;
	int total = 0;

	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upw);
		if(conn != null){
			
			for(int i = 0; i < sql_insert.length; i++){
				pstmt_insert[i] = conn.prepareStatement(sql_insert[i]);
				pstmt_insert[i].setString(1, trip_purpose);
				pstmt_insert[i].setString(2, last_name);
				pstmt_insert[i].setString(3, first_name);
				pstmt_insert[i].setString(4, user_email);
				pstmt_insert[i].setString(5, book_for_whom);

				pstmt_insert[i].setString(6, per_people[i]);
				pstmt_insert[i].setString(7, guest_name[i]);
				pstmt_insert[i].setString(8, other_name[i]);
				pstmt_insert[i].setString(9, other_email[i]);
				pstmt_insert[i].setString(10, modifiable[i]);
				
				pstmt_insert[i].setString(11, rent_car[i]);			
				pstmt_insert[i].setString(12, nation);
				pstmt_insert[i].setString(13, user_ph);
				pstmt_insert[i].setInt(14, u_idx);
				pstmt_insert[i].setInt(15, Integer.parseInt(h_idx));
				pstmt_insert[i].setString(17, filter_checkin);
				pstmt_insert[i].setString(18, filter_checkout);
			}
			
			String sql = "SELECT cou_price FROM tb_coupon WHERE cou_idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_coupon);
			rs = pstmt.executeQuery(); 
			int cou_price = 0;
			while(rs.next()){
				 cou_price = Integer.parseInt(rs.getString("cou_price"));
			}
			
			
			sql = "SELECT * FROM tb_room WHERE r_hotelIdx =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, h_idx);
			rs = pstmt.executeQuery(); 
			int index = 0;
			cnt = 0;
			
			
			while(rs.next()){ 
				if(room_arr[index] != 0) {
					for(int i = 0; i < room_arr[index]; i++){
						r_name = rs.getString("r_name");
						r_price = rs.getInt("r_price");
						r_people = rs.getInt("r_people");	
						
						pstmt_insert[cnt].setString(16, r_name);
						pstmt_insert[cnt].setInt(19, r_people);
											
						if(cnt == 0 && cou_price != 0){
							pstmt_insert[cnt].setInt(20, (r_price - cou_price));
						} else {
							pstmt_insert[cnt].setInt(20, r_price);
						}
						cnt++;	
					}
			
				}
				index++;	
			}
			
			sql = "DELETE FROM tb_coupon WHERE cou_idx =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_coupon);
			int delete_ok = pstmt.executeUpdate();
			
			for(int i = 0; i < selected_room_cnt; i++){
				if(pstmt_insert[i].executeUpdate() < 1) {
%>
			<script type="text/javascript">
				location.href='payIn_fail.jsp';
			</script>
<%					
				}				
			}
%>
			<script type="text/javascript">
				location.href='payIn_success.jsp';
			</script>
			
<%				
		}			
			
	} catch(ClassNotFoundException e){
		e.printStackTrace();
	} catch(SQLException e){
		e.printStackTrace();
	}	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% for(int i = 0; i < pstmt_insert.length; i++){ %>
<p style = "margin : 10px"><%=pstmt_insert[i]%></p>
<% } %>
</body>
</html>