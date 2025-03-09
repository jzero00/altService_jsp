<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diebock</title>
<script>
	document.addEventListener("DOMContentLoaded", function(){
		let checkDupleButton = document.querySelector("button[id=checkDupleId]");
		checkDupleButton.addEventListener('click',checkDupleId);
		let idInput = document.querySelector("input[name=emplyr_id]");
		idInput.addEventListener('keydown',changeDupleCheck);
		let passwordChkInput = document.querySelector("input[name=password_chk]");
		passwordChkInput.addEventListener('keyup',passwordCheckAlarm);
	});

	function modifyMember() {
		document.memberVO.action = "<c:url value="/sys/memberMod.do"/>";
		let flag = passwordCheck();
		if(flag){
			console.log("통과");
		} else {
			console.log("비밀번호 확인");
		}
		
		let dupleCheckFlag = passDupleId();
		if(!dupleCheckFlag) {
			console.log("ID 중복체크 필요")
			return false;
		}
		memberVO.submit();
	}
	
	function listMenu() {
		document.memberVO.action = "<c:url value="/sys/memberManage.do"/>";
		memberVO.submit();
	}
</script>
</head>
<body>
	<section class="content">
		<form name="memberVO" action="" method="post">
			<div class="container-fluid">
				<div class="card card-info">
					<div class="card-header">
						<h3 class="card-title">회원관리 수정</h3>
					</div>
					<div class="card-body">
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="emplyr_id" class="col-form-label">회원ID</label>
								</div>
								<div class="col-9 input-group">
									<input type="text" readonly="readonly" class="form-control" name="emplyr_id" value="${vo.emplyr_id }">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="user_nm" class="col-form-label">회원이름</label>
								</div>
								<div class="col-9">
									<input type="text" class="form-control" name="user_nm" value="${vo.user_nm }">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="upper_menu_no" class="col-form-label">성별</label>
								</div>
								<div class="col-9">
									<select class="custom-select" name="sexdstn_code">
										<option>--선택하세요--</option>
										<option value="m" <c:if test="${vo.sexdstn_code eq 'm' }">selected</c:if>>남자</option>
										<option value="f" <c:if test="${vo.sexdstn_code eq 'f' }">selected</c:if>>여자</option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="" class="col-form-label">전화번호</label>
								</div>
								<div class="col-9">
									<div class="col-12">
										<div class="form-group row">
											<input type="text" class="form-control" name="area_no" style="width: 100px;" value="${vo.area_no }"> - <input type="text" class="form-control" name="house_middle_telno" style="width: 100px;" value="${vo.house_middle_telno }"> - <input type="text" class="form-control" name="house_end_telno" style="width: 100px;" value="${vo.house_end_telno }">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="email_adres" class="col-form-label">이메일주소</label>
								</div>
								<div class="col-9">
									<input type="text" class="form-control" name="email_adres" value="${vo.email_adres }">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="zip" class="col-form-label">우편번호</label>
								</div>
								<div class="col-9">
									<input type="text" class="form-control" name="zip" value="${vo.zip }">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="house_adres" class="col-form-label">주소</label>
								</div>
								<div class="col-9">
									<input type="text" class="form-control" name="house_adres" value="${vo.house_adres }">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="detail_adres" class="col-form-label">상세주소</label>
								</div>
								<div class="col-9">
									<input type="text" class="form-control" name="detail_adres" value="${vo.detail_adres }">
								</div>
							</div>
						</div>
						<%-- 						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="emplyr_sttus_code" class="col-form-label">회원상태</label>
								</div>
								<div class="col-9">
									<input type="text" class="form-control" name="emplyr_sttus_code" value="${vo.emplyr_sttus_code }">
								</div>
							</div>
						</div> --%>

						<div class="row">
							<div class="col-9"></div>
							<div class="col-3">
								<div>
									<button type="button" class="btn bg-gradient-primary" style="margin-right: 10px;" onclick="modifyMember(); return false;">수정</button>
									<button type="button" class="btn bg-gradient-primary" onclick="listMenu(); return false;">목록</button>
								</div>
							</div>
						</div>
						<!-- /.row -->

						<!-- /input-group -->
					</div>
					<!-- /.card-body -->
				</div>
			</div>
			<input type="hidden" name="checkDupleId">
		</form>
	</section>
</body>
</html>