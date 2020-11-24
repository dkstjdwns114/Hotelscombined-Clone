package com.model;

public class AdminDTO {
	private Long adIdx;
	private String adId;
	private String adPw;
	private String adRegdate;
	private String adEndlicense;
	private String adEmail;
	private String adHp;
	public Long getAdIdx() {
		return adIdx;
	}
	public void setAdIdx(Long adIdx) {
		this.adIdx = adIdx;
	}
	public String getAdId() {
		return adId;
	}
	public void setAdId(String adId) {
		this.adId = adId;
	}
	public String getAdPw() {
		return adPw;
	}
	public void setAdPw(String adPw) {
		this.adPw = adPw;
	}
	public String getAdRegdate() {
		return adRegdate;
	}
	public void setAdRegdate(String adRegdate) {
		this.adRegdate = adRegdate;
	}
	public String getAdEndlicense() {
		return adEndlicense;
	}
	public void setAdEndlicense(String adEndlicense) {
		this.adEndlicense = adEndlicense;
	}
	
	public String getAdEmail() {
		return adEmail;
	}
	public void setAdEmail(String adEmail) {
		this.adEmail = adEmail;
	}
	public String getAdHp() {
		return adHp;
	}
	public void setAdHp(String adHp) {
		this.adHp = adHp;
	}
	@Override
	public String toString() {
		return "AdminDTO [adIdx=" + adIdx + ", adId=" + adId + ", adPw=" + adPw + ", adRegdate=" + adRegdate
				+ ", adEndlicense=" + adEndlicense + ", adEmail=" + adEmail + ", adHp=" + adHp + "]";
	}

}
