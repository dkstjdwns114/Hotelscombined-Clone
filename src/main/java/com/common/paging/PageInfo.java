package com.common.paging;

public class PageInfo {
	private int totalPage;
	private Long totalPost;
	private int curPage;
	private int startPage;
	private int endPage;

	public PageInfo(int totalPage, Long totalPost, int curPage, int startPage, int endPage) {
		super();
		this.totalPage = totalPage;
		this.totalPost = totalPost;
		this.curPage = curPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public Long getTotalPost() {
		return totalPost;
	}

	public void setTotalPost(Long totalPost) {
		this.totalPost = totalPost;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageInfo [totalPage=" + totalPage + ", totalPost=" + totalPost + ", curPage=" + curPage + ", startPage="
				+ startPage + ", endPage=" + endPage + "]";
	}
}
