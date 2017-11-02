<%@page language="java" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/include.jsp"%>
<link rel="stylesheet" type="text/css" href="${webPath}/resources/css/layout.css" />
<div align="right" class="pagediv">
	<div>
		<c:if test="${curPage>1}">
			<span class="lastPage" onclick="firstPage()" title="首页">&nbsp;</span>
			<span class="nextPage" onclick="previousPage()" title="上一页">&nbsp;</span>
		</c:if>
		<c:if test="${totalPage>1&&curPage!=totalPage}">
			<span class="firstpage" onclick="nextPage()" title="下一页">&nbsp;</span>
			<span class="previousPage" onclick="lastPage()" title="末页">&nbsp;</span>
		</c:if>
		共${totalCount}条/${totalPage}页&nbsp;&nbsp;
		每页<select name="rows"  id="rows" class="pageSize"  onchange="goto_Page();"></select> 条&nbsp;&nbsp;
		第<input type="text" value="${curPage}" name="curPage" id="curPage"  class="pageSize"  />页
		<c:if test="${totalPage>1}">
			<span class="gopage" onclick="goto_Page()" title="转到">&nbsp;</span>
		</c:if>
	</div>
</div>
<script type="text/javascript">
	var curPage = "${curPage}";
	var totalPage = "${totalPage}";
	var blGo = true;
	var thisform = document.getElementsByTagName("form")[0];
	function firstPage() {
		blGo = false;
		thisform.curPage.value = "1";
		thisform.submit();
	}
	function lastPage() {
		blGo = false;
		thisform.curPage.value = totalPage;
		thisform.submit();
	}
	function previousPage() {
		blGo = false;
		if (curPage > 1) {
			thisform.curPage.value = parseInt(curPage) - 1;
		}
		thisform.submit();
	}
	function nextPage() {
		blGo = false;
		if (parseInt(curPage) < parseInt(totalPage)) {
			thisform.curPage.value = parseInt(curPage) + 1;
		}
		thisform.submit();
	}
	function goto_Page() {
		if (blGo) {
			var p = parseInt(thisform.curPage.value);
			if (isNaN(p) || p<1 || p>totalPage) {
				thisform.curPage.value = 1;
			} else {
				thisform.curPage.value = p;
			}
			thisform.submit();
		}
	}
	$(document).ready(function() {
		$(function() {
			$("#curPage").bind('keypress', function(event) {
				if (event.keyCode == "13") {
					goto_Page();
				}
			});
		});
		for(var i=10;i<41;i=i+5){
			$("#rows").append($("<option/>").text(i).val(i));
		}
		$("#rows").val('${rows}');
	});
</script>