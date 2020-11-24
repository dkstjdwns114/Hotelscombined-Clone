package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.hotels.db.SqlMapConfig;
import com.model.AdminDTO;

public class AdminDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlSession;
	public AdminDAO() {
		// openSession을 true로 설정시 자동 commit
		sqlSession = ssf.openSession(true);
	}
	public AdminDTO login(String id, String pw) {
		HashMap<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("id", id);
		dataMap.put("pw", pw);
		return sqlSession.selectOne("Admin.login", dataMap);
	}
	public AdminDTO findByIdx(Long idx) {
		return sqlSession.selectOne("Admin.findByIdx", idx);
	}
	public Integer updateInfo(Long idx, String pw, String email, String hp) {
		HashMap<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("idx", String.valueOf(idx));
		dataMap.put("pw", pw);
		dataMap.put("email", email);
		dataMap.put("hp", hp);
		return sqlSession.update("Admin.updateAdmin", dataMap);
	}

}
