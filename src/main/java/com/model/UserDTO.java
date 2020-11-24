package com.model;

public class UserDTO {
	private Long uIdx;
	private String uId;
	private String uPw;
	private String uNickname;
	private String uType;
	private String uRegdate;
	private String uHp;
	private String uEmailagree;
	private String uName;
	private String uMemo;
	public Long getuIdx() {
		return uIdx;
	}
	public void setuIdx(Long uIdx) {
		this.uIdx = uIdx;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
	public String getuNickname() {
		return uNickname;
	}
	public void setuNickname(String uNickname) {
		this.uNickname = uNickname;
	}
	public String getuType() {
		return uType;
	}
	public void setuType(String uType) {
		this.uType = uType;
	}
	public String getuRegdate() {
		return uRegdate;
	}
	public void setuRegdate(String uRegdate) {
		this.uRegdate = uRegdate;
	}
	public String getuHp() {
		return uHp;
	}
	public void setuHp(String uHp) {
		this.uHp = uHp;
	}
	
	public String getuEmailagree() {
		return uEmailagree;
	}
	public void setuEmailagree(String uEmailagree) {
		this.uEmailagree = uEmailagree;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	
	public String getuMemo() {
		return uMemo;
	}
	public void setuMemo(String uMemo) {
		this.uMemo = uMemo;
	}
	@Override
	public String toString() {
		return "UserDTO [uIdx=" + uIdx + ", uId=" + uId + ", uPw=" + uPw + ", uNickname=" + uNickname + ", uType="
				+ uType + ", uRegdate=" + uRegdate + ", uHp=" + uHp + ", uEmailagree=" + uEmailagree + ", uName="
				+ uName + ", uMemo=" + uMemo + "]";
	}
}
