package com.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.common.paging.PageMaker;
import com.hotels.db.SqlMapConfig;
import com.model.ReservationDTO;
import com.model.UserDTO;

public class ReservationDAO {
	SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlSession;
	public ReservationDAO() {
		// openSession을 true로 설정시 자동 commit
		sqlSession = ssf.openSession(true);
	}
	public List<ReservationDTO> reservationList(PageMaker pageMaker){
		Map<String, Object> sqlMap = new HashMap<String, Object>();
		sqlMap.put("startCnt", pageMaker.getStartCnt());
		sqlMap.put("perPageCnt", pageMaker.getPerPageCnt());
		return sqlSession.selectList("Reservation.reservationList", sqlMap);
	}
	public Long cntAllReservation() {
		return sqlSession.selectOne("Reservation.cntAllReservation");
	}
	public Integer insertReservation(Map<String, Object> dataMap) {
		return sqlSession.insert("Reservation.insertReservation", dataMap);
	}
	public Integer updateState(Map<String, Object> dataMap) {
		return sqlSession.update("Reservation.updateState", dataMap);
	}
	public Integer sumAllpayment() {
		return sqlSession.selectOne("Reservation.sumAllPayment");
	}
	public Long cntAllPayment(String searchOpt, String keyword) {
		Map<String, Object> sqlMap = new HashMap<String, Object>();
		sqlMap.put("searchOpt", searchOpt);
		sqlMap.put("keyword", keyword);
		return sqlSession.selectOne("Reservation.cntAllPayment");
	}
	public List<ReservationDTO> paymentList(PageMaker pageMaker, String searchOpt, String keyword){
		Map<String, Object> sqlMap = new HashMap<String, Object>();
		sqlMap.put("startCnt", pageMaker.getStartCnt());
		sqlMap.put("perPageCnt", pageMaker.getPerPageCnt());
		sqlMap.put("searchOpt", searchOpt);
		sqlMap.put("keyword", keyword);
		return sqlSession.selectList("Reservation.paymentList", sqlMap);
	}
	public Integer updatePayOk(Long payIdx) {
		return sqlSession.update("Reservation.updatePayOk", payIdx);
	}
	public Integer deleteRes(Long resIdx) {
		return sqlSession.delete("Reservation.deleteRes", resIdx);
	}
}
