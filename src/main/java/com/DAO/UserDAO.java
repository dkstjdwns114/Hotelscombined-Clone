
package com.DAO;

import java.io.SequenceInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.common.paging.PageMaker;
import com.hotels.db.SqlMapConfig;
import com.model.UserDTO;

public class UserDAO {
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlSession;
	public UserDAO() {
		// openSession을 true로 설정시 자동 commit
		sqlSession = ssf.openSession(true);
	}
	public List<UserDTO> userList(PageMaker pageMaker, String searchOpt, String keyword){
		Map<String, Object> sqlMap = new HashMap<String, Object>();
		sqlMap.put("startCnt", pageMaker.getStartCnt());
		sqlMap.put("perPageCnt", pageMaker.getPerPageCnt());
		sqlMap.put("searchOpt", searchOpt);
		sqlMap.put("keyword", keyword);
		return sqlSession.selectList("User.userList", sqlMap);
	}
	public UserDTO findUserByIdx(Long idx) {
		return sqlSession.selectOne("User.findUserByIdx", idx);
	}
	public Long cntAllUser(String searchOpt, String keyword) {
		Map<String, Object> sqlMap = new HashMap<String, Object>();
		sqlMap.put("searchOpt", searchOpt);
		sqlMap.put("keyword", keyword);
		return sqlSession.selectOne("User.cntAllUser", sqlMap);
	}
	public Long cntSignupToday() {
		return sqlSession.selectOne("User.cntSignupToday");
	}
	public Integer updateUser(Map<String, Object> dataMap) {
		return sqlSession.update("User.updateUser", dataMap);
	}
	public Integer deleteUser(Map<String, Object> dataMap) {
		sqlSession.delete("User.deleteUserToReservation", dataMap);
		sqlSession.delete("User.deleteUserToReview", dataMap);
		sqlSession.delete("User.deleteUserToCoupon", dataMap);
		return sqlSession.delete("User.deleteUserToCustomer", dataMap);
	}
}
