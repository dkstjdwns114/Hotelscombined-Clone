'use strict';
$(document).ready(function() {
	const searchOpt = $('#savedSearchOpt').val();
	const keyword = $('#savedKeyword').val();
	if(searchOpt != 'all'){
		$('#searchOpt').val(searchOpt);
	}else{
		$('#searchOpt').val('id');
	}
	$('#keyword').val(keyword);
})
const goPage = function(curPage) {
	const url = '/dy_files/allUserListLogic.jsp?curPage='+curPage;
	$(location).attr('href', url);
}
const goInfo = function(uIdx) {
	const url = '/dy_files/userInfoLogic.jsp?uIdx='+uIdx;
	$(location).attr('href', url);
}
const goSearch = function() {
	const searchOpt = $('#searchOpt').val();
	const keyword = $('#keyword').val();
	location.href = "/dy_files/allUserListLogic.jsp?searchOpt="+searchOpt+"&keyword="+keyword;
}