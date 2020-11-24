package com.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.common.paging.PageMaker;
import com.hotels.db.SqlMapConfig;
import com.model.ResAdminDTO;

public class ResAdminDAO {
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlSession;
	public ResAdminDAO() {
		// openSession을 true로 설정시 자동 commit
		sqlSession = ssf.openSession(true);
	}
	public List<ResAdminDTO> resAdminList(PageMaker pageMaker, String opt_status, String opt_user, String keyword){
		Map<String, Object> sqlMap = new HashMap<String, Object>();
		sqlMap.put("startCnt", pageMaker.getStartCnt());
		sqlMap.put("perPageCnt", pageMaker.getPerPageCnt());
		sqlMap.put("opt_status", opt_status);
		sqlMap.put("opt_user", opt_user);
		sqlMap.put("keyword", keyword);
		return sqlSession.selectList("ResAdmin.resAdminList", sqlMap);
	}
	public Long cntAllRes(String opt_status, String opt_user, String keyword) {
		Map<String, Object> sqlMap = new HashMap<String, Object>();
		//System.out.println("cntAllRes: "+opt_status);
		sqlMap.put("opt_status", opt_status);
		sqlMap.put("opt_user", opt_user);
		sqlMap.put("keyword", keyword);
		return sqlSession.selectOne("ResAdmin.cntAllRes", sqlMap);
	}
	public Integer updateStatus(String status, String resIdx) {
		Map<String, Object> sqlMap = new HashMap<String, Object>();
		sqlMap.put("status", status);
		sqlMap.put("resIdx", resIdx);
		return sqlSession.update("ResAdmin.updateStatus", sqlMap);
	}
	public Integer sumAllPay() {
		return sqlSession.selectOne("ResAdmin.sumAllPay");
	}
}
