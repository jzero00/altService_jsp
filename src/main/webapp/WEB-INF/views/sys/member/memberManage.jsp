<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<table class="table">
				<tr>
					<th>
						<div class="row">
							<div class="col-12">사용자관리 목록</div>
						</div>
						<div class="row">
							<div class="col-4">
								<div class="form-group row">
									<div class="col-6">
									<select class="form-control" id="emplyrSttusCode">
										<option value="">상태(전체)</option>
										<option value="r" <c:if test="${cri.stts eq 'r'}">selected</c:if>>신청</option>
										<option value="a" <c:if test="${cri.stts eq 'a'}">selected</c:if>>승인</option>
										<option value="e" <c:if test="${cri.stts eq 'e'}">selected</c:if>>만료</option>
									</select>
									</div>
									<div class="col-6">
										<select class="form-control" id="searchType">
											<option value="id" <c:if test="${cri.searchType eq 'id'}">selected</c:if> >ID</option>
											<option value="user_nm" <c:if test="${cri.searchType eq 'user_nm'}">selected</c:if>>사용자이름</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-4">
								<div class="form-group row">
									<label for="menu" class="col-sm-3 col-form-label">메뉴명 : </label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="keyword" value="${cri.keyword }">
									</div>
								</div>
							</div>
							<div class="col-4">
								<div class="btn-group">
									<button type="button" class="btn bg-gradient-primary" onclick="searchMember(); return false;">조회</button>
								</div>
								<div class="btn-group">
									<button type="button" class="btn bg-gradient-primary" onclick="deleteMember(); return false;">삭제</button>
								</div>
								<div class="btn-group">
									<button type="button" class="btn bg-gradient-primary" onclick="insertMember(); return false;">등록</button>
								</div>
							</div>
						</div>
					</th>
				</tr>
			</table>
			<table class="table">
				<thead>
					<tr>
						<th class="text-center">번호</th>
						<th class="text-center" style="width: 10px"><input type="checkbox"></th>
						<th class="text-center">ID</th>
						<th class="text-center">사용자이름</th>
						<th class="text-center">사용자이메일</th>
						<th class="text-center">전화번호</th>
						<th class="text-center">등록일</th>
						<th class="text-center">가입상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr id="" onclick="memberManageDtl(this); return false;">
							<td class="text-center">${list.list_no }</td>
							<td class="text-center"><input type="checkbox" onclick="checkbox(this,event)"></td>
							<td class="text-center" id="id">${list.emplyr_id }</td>
							<td class="text-center">${list.user_nm }</td>
							<td class="text-center">${list.email_adres }</td>
							<td class="text-center">${list.area_no} - ${list.house_middle_telno } - ${list.house_end_telno }</td>
							<td class="text-center"><fmt:formatDate value="${list.sbscrb_de }" pattern="yyyy-MM-dd"/></td>
							<td class="text-center">${list.emplyr_sttus_code }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<form name="memberManageVO" method="post">
				<input type='hidden' name="page" value="${pageMaker.cri.page }" />
				<input type="hidden" id="searchType" name="searchType" value="${cri.searchType }">
				<input type="hidden" id="keyword" name="keyword" value="${cri.keyword }">
				<input type="hidden" id="id" name="id" value="">
				<input type="hidden" id="stts" name="stts" value="${cri.stts }">
			</form>
			<ul class="pagination m-0 justify-content-center">
				<%@include file="/WEB-INF/views/include/pagination.jsp" %>
			</ul>
		</div>
	</section>
</body>
<script>
function memberManageDtl(e){
	let id = e.querySelector("td[id=id]").innerHTML;
	document.memberManageVO.action = "<c:url value='/sys/memberDtl.do'/>";
	document.memberManageVO.querySelector("input[id=id]").value = id;
	memberManageVO.submit();
}

function searchMember(){
	let searchType = document.querySelector("select[id=searchType]").value;
	let keyword = document.querySelector("input[id=keyword]").value;
	let emplyrSttusCode = document.querySelector("select[id=emplyrSttusCode]").value;
	
	document.memberManageVO.querySelector("input[id=searchType]").value = searchType;
	document.memberManageVO.querySelector("input[id=keyword]").value = keyword;
	document.memberManageVO.querySelector("input[id=stts]").value = emplyrSttusCode;
	
	document.memberManageVO.action = "<c:url value='/sys/memberManage.do'/>";
	memberManageVO.submit();
}

function search_list_go(pageNo){
	document.memberManageVO.querySelector("input[name=page]").value = pageNo;
	document.memberManageVO.submit();
}

function insertMember(){
	document.memberManageVO.action = "<c:url value='/sys/memberRegView.do'/>";
	memberManageVO.submit();
}

function checkbox(e,event){
	event.stopPropagation();
}


function deleteMember(){
	if(confirm("삭제하시겠습니까?")){	
		let checkedBoxes = document.querySelectorAll("input[type=checkbox]:checked");
		let tr  = '';
		let deletedIds = new Array();
		console.log(checkedBoxes);
		for(i = 0; i < checkedBoxes.length; i++){
			tr = checkedBoxes[i].parentElement.parentElement;
// 			console.log(tr);
			deletedIds.push(tr.querySelector("td:nth-child(3)").innerHTML);
		}
		console.log(deletedIds);
		
		$.ajax({
			url : '/sys/memberDelete.do',
			method : 'post',
			data : {'id' : deletedIds.toString()},
			success : function(data) {
				console.log(data);
			},
			error : function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            var err=JSON.parse(request.responseText);

	            alert(err.resData[0].errorMsg);
			}
		});
	}
}
</script>
</html>