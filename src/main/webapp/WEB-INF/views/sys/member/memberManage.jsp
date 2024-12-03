<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<div class="col-3">사용자관리 목록</div>
							<div class="col-3">
								<div class="form-group row">
									<div class="col-6">
									<select class="form-control" id="emplyr_sttus_code">
										<option value="">상태(전체)</option>
										<option value="r">신청</option>
										<option value="a">승인</option>
										<option value="e">만료</option>
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
							<div class="col-3">
								<div class="form-group row">
									<label for="menu" class="col-sm-3 col-form-label">메뉴명 : </label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="keyword" value="${cri.keyword }">
									</div>
								</div>
							</div>
							<div class="col-3">
								<div class="btn-group">
									<button type="button" class="btn bg-gradient-primary" onclick="searchMember(); return false;">조회</button>
								</div>
								<div class="btn-group">
									<button type="button" class="btn bg-gradient-primary">삭제</button>
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
						<th>번호</th>
						<th style="width: 10px"><input type="checkbox"></th>
						<th>ID</th>
						<th>사용자이름</th>
						<th>사용자이메일</th>
						<th>전화번호</th>
						<th>등록일</th>
						<th>가입상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="list">
						<tr id="" onclick="memberManageDtl(this); return false;">
							<td>${list.list_no }</td>
							<td><input type="checkbox"></td>
							<td id="id">${list.emplyr_id }</td>
							<td>${list.user_nm }</td>
							<td></td>
							<td>${list.house_middle_telno }</td>
							<td></td>
							<td>${list.emplyr_sttus_code }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<form name="memberManageVO" method="post">
				<input type='hidden' name="page" value="${pageMaker.cri.page }" />
				<input type="hidden" id="searchType" name="searchType" value="${cri.searchType }">
				<input type="hidden" id="keyword" name="keyword" value="${cri.keyword }">
				<input type="hidden" id="id" name="id" value="">
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
	console.log(id);
	document.memberManageVO.action = "<c:url value='/sys/memberDtl.do'/>";
	document.memberManageVO.querySelector("input[id=id]").value = id;
	memberManageVO.submit();
}

function searchMember(){
	let searchType = document.querySelector("select[id=searchType]").value;
	let keyword = document.querySelector("input[id=keyword]").value;
	
	document.memberManageVO.querySelector("input[id=searchType]").value = searchType;
	document.memberManageVO.querySelector("input[id=keyword]").value = keyword;
	
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
</script>
</html>