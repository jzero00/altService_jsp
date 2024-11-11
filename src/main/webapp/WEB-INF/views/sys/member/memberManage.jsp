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
											<option value="id">ID</option>
											<option value="user_nm">사용자이름</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-3">
								<div class="form-group row">
									<label for="menu" class="col-sm-3 col-form-label">메뉴명 : </label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="keyword">
									</div>
								</div>
							</div>
							<div class="col-3">
								<div class="btn-group">
									<button type="button" class="btn bg-gradient-primary">조회</button>
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
						<tr id="${list.menu_no }" onclick="menuManageMod(this); return false;">
							<td>${list.menu_no }</td>
							<td><input type="checkbox"></td>
							<td>${list.menu_nm }</td>
							<td>${list.progrm_file_nm }</td>
							<td>${list.menu_dc }</td>
							<td>${list.menu_dc }</td>
							<td>${list.menu_dc }</td>
							<td>${list.upper_menu_no }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<form name="menuManageVO" action="<c:url value='/sys/menuRegView.do' />" method="post">
				<input type="hidden" id="menu_no" name="menu_no" value="">
			</form>
		</div>
	</section>
</body>
</html>