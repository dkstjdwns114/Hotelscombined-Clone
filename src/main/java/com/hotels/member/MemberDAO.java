package com.hotels.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.hotels.db.SqlMapConfig;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	MemberDTO member;
	String sql = "";
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public MemberDAO() {
		// openSession을 true로 설정시 자동 commit
		sqlsession = ssf.openSession(true);
		System.out.println("마이바티스 설정 성공!");
	}
	
	public boolean idCheck(String userid) {
		if((Integer)sqlsession.selectOne("Customer.idCheck", userid) == 1) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public boolean nameCheck(String username) {
		if((Integer)sqlsession.selectOne("Customer.nameCheck", username) == 1) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public int join(MemberDTO member) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("u_id", member.getUserid());
		dataMap.put("u_pw", member.getUserpw());
		dataMap.put("u_name", member.getUsername());
		dataMap.put("u_nickname", member.getNickname());
		dataMap.put("u_type", "일반회원");
		dataMap.put("u_hp", member.getHp());
		dataMap.put("u_emailagree", "거부");
		
		return sqlsession.insert("Customer.join", dataMap);
	}
	
	public MemberDTO login(MemberDTO member) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("u_id", member.getUserid());
		dataMap.put("u_pw", member.getUserpw());
		dataMap = sqlsession.selectOne("Customer.login", dataMap);
		if(dataMap != null) {
			member.setIdx(Integer.parseInt(String.valueOf(dataMap.get("u_idx"))));
			member.setUsername(dataMap.get("u_name"));
			return member;
		}
		return null;
	}
	
	public MemberDTO info(int u_idx) {
		member = new MemberDTO();
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap = sqlsession.selectOne("Customer.info", u_idx);
		
		if(dataMap != null) {
			member.setIdx(u_idx);
			member.setUserid(dataMap.get("u_id"));
			member.setUsername(dataMap.get("u_name"));
			member.setNickname(dataMap.get("u_nickname"));
			member.setHp(dataMap.get("u_hp"));
			member.setEmailagree(dataMap.get("u_emailagree"));
			return member;
		}
		return null;
	}
	
	public boolean pwcheck(MemberDTO member) {
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("u_idx",  String.valueOf(member.getIdx()));
		dataMap.put("u_pw", member.getUserpw());
		if((Integer)sqlsession.selectOne("Customer.pwCheck", dataMap) == 1) {
			return true;
		}else {
			return false;
		}
	}
	
	public int edit(MemberDTO member) {
		HashMap<String, String> dataMap = new HashMap<>();
		
		dataMap.put("u_idx", String.valueOf(member.getIdx()));
		dataMap.put("u_nickname", member.getNickname());
		dataMap.put("u_hp", member.getHp());
		dataMap.put("u_emailagree", member.getEmailagree());
		
		return sqlsession.update("Customer.edit", dataMap);
	}
}
