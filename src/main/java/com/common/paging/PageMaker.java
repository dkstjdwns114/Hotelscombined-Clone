package com.common.paging;

public class PageMaker {
	// private PageSetting pageSetting;
	private int curPage; // 현재 페이지번호
	private int perPageCnt; // 한페이지에 몇개 출력?
	private Long totalPost; // 전체 게시글 개수
	private int totalPage; // 전체 페이지 개수
	private int startCnt; // 게시글 시작번호
	private int endCnt; // 게시글 끝번호
	private int startPage; // 시작 페이지
	private int endPage; // 끝 페이지

	public PageMaker(int curPage, int perPageCnt) {
		super();
		if (curPage < 0) {
			this.curPage = 1;
		} else {
			this.curPage = curPage;
		}
		this.perPageCnt = perPageCnt;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPerPageCnt() {
		return perPageCnt;
	}

	public void setPerPageCnt(int perPageCnt) {
		this.perPageCnt = perPageCnt;
	}

	public Long getTotalPost() {
		return totalPost;
	}

	public void setTotalPost(Long totalPost) {
		this.totalPost = totalPost;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartCnt() {
		return startCnt;
	}

	public void setStartCnt(int startCnt) {
		this.startCnt = startCnt;
	}

	public int getEndCnt() {
		return endCnt;
	}

	public void setEndCnt(int endCnt) {
		this.endCnt = endCnt;
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
		return "PageMaker [curPage=" + curPage + ", perPageCnt=" + perPageCnt + ", totalPost=" + totalPost
				+ ", totalPage=" + totalPage + ", startCnt=" + startCnt + ", endCnt=" + endCnt + ", startPage="
				+ startPage + ", endPage=" + endPage + "]";
	}

	// 페이지 계산
	public PageInfo pageSetting(Long totalPost) {
		this.totalPost = totalPost;

		totalPage = (int) (Math.ceil(totalPost / (double) perPageCnt));
		// 표시할 게시글 범위
		startCnt = (curPage - 1) * perPageCnt;
		endCnt = startCnt + (perPageCnt - 1);

		// 시작페이지 끝페이지
		startPage = curPage - 4;
		if (startPage <= 0) {
			startPage = 1;
		}
		endPage = curPage + 4;
		if (endPage >= totalPage) {
			endPage = totalPage;
		}
		return new PageInfo(totalPage, this.totalPost, curPage, startPage, endPage);
	}
}
