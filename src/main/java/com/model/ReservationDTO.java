package com.model;

public class ReservationDTO {
	private Long resIdx;
	private String resPurpose;
	private String resLastname;
	private String resFirstname;
	private String resEmail;
	private String resGuest;
	private String resGuestname;
	private String resGuestemail;
	private String resNation;
	private String resPh;
	private String resRoomName;
	private String resCheckin;
	private String resCheckout;
	private Long resPeople;
	private String resPrice;
	private String resBankName;
	private String resAccount;
	private String resPaytype;
	private String resPaystatus;
	private Integer resOkstatus;
	private String resOkdate;
	private Long resUseridx;
	private Long resHotelidx;
	public Long getResIdx() {
		return resIdx;
	}
	public void setResIdx(Long resIdx) {
		this.resIdx = resIdx;
	}
	public String getResPurpose() {
		return resPurpose;
	}
	public void setResPurpose(String resPurpose) {
		this.resPurpose = resPurpose;
	}
	public String getResLastname() {
		return resLastname;
	}
	public void setResLastname(String resLastname) {
		this.resLastname = resLastname;
	}
	public String getResFirstname() {
		return resFirstname;
	}
	public void setResFirstname(String resFirstname) {
		this.resFirstname = resFirstname;
	}
	public String getResEmail() {
		return resEmail;
	}
	public void setResEmail(String resEmail) {
		this.resEmail = resEmail;
	}
	public String getResGuest() {
		return resGuest;
	}
	public void setResGuest(String resGuest) {
		this.resGuest = resGuest;
	}
	public String getResGuestname() {
		return resGuestname;
	}
	public void setResGuestname(String resGuestname) {
		this.resGuestname = resGuestname;
	}
	public String getResGuestemail() {
		return resGuestemail;
	}
	public void setResGuestemail(String resGuestemail) {
		this.resGuestemail = resGuestemail;
	}
	public String getResNation() {
		return resNation;
	}
	public void setResNation(String resNation) {
		this.resNation = resNation;
	}
	public String getResPh() {
		return resPh;
	}
	public void setResPh(String resPh) {
		this.resPh = resPh;
	}
	public String getResRoomName() {
		return resRoomName;
	}
	public void setResRoomName(String resRoomName) {
		this.resRoomName = resRoomName;
	}
	public String getResCheckin() {
		return resCheckin;
	}
	public void setResCheckin(String resCheckin) {
		this.resCheckin = resCheckin;
	}
	public String getResCheckout() {
		return resCheckout;
	}
	public void setResCheckout(String resCheckout) {
		this.resCheckout = resCheckout;
	}
	public Long getResPeople() {
		return resPeople;
	}
	public void setResPeople(Long resPeople) {
		this.resPeople = resPeople;
	}
	public String getResPrice() {
		return resPrice;
	}
	public void setResPrice(String resPrice) {
		this.resPrice = resPrice;
	}
	public String getResBankName() {
		return resBankName;
	}
	public void setResBankName(String resBankName) {
		this.resBankName = resBankName;
	}
	public String getResAccount() {
		return resAccount;
	}
	public void setResAccount(String resAccount) {
		this.resAccount = resAccount;
	}
	public String getResPaytype() {
		return resPaytype;
	}
	public void setResPaytype(String resPaytype) {
		this.resPaytype = resPaytype;
	}
	public String getResPaystatus() {
		return resPaystatus;
	}
	public void setResPaystatus(String resPaystatus) {
		this.resPaystatus = resPaystatus;
	}
	public Integer getResOkstatus() {
		return resOkstatus;
	}
	public void setResOkstatus(Integer resOkstatus) {
		this.resOkstatus = resOkstatus;
	}
	public String getResOkdate() {
		return resOkdate;
	}
	public void setResOkdate(String resOkdate) {
		this.resOkdate = resOkdate;
	}
	
	public Long getResUseridx() {
		return resUseridx;
	}
	public void setResUseridx(Long resUseridx) {
		this.resUseridx = resUseridx;
	}
	public Long getResHotelidx() {
		return resHotelidx;
	}
	public void setResHotelidx(Long resHotelidx) {
		this.resHotelidx = resHotelidx;
	}
	@Override
	public String toString() {
		return "ReservationDTO [resIdx=" + resIdx + ", resPurpose=" + resPurpose + ", resLastname=" + resLastname
				+ ", resFirstname=" + resFirstname + ", resEmail=" + resEmail + ", resGuest=" + resGuest
				+ ", resGuestname=" + resGuestname + ", resGuestemail=" + resGuestemail + ", resNation=" + resNation
				+ ", resPh=" + resPh + ", resRoomName=" + resRoomName + ", resCheckin=" + resCheckin + ", resCheckout="
				+ resCheckout + ", resPeople=" + resPeople + ", resPrice=" + resPrice + ", resBankName=" + resBankName
				+ ", resAccount=" + resAccount + ", resPaytype=" + resPaytype + ", resPaystatus=" + resPaystatus
				+ ", resOkstatus=" + resOkstatus + ", resOkdate=" + resOkdate + "]";
	}
}
