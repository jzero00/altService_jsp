<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diebock</title>
<script>
function registMember(){
	document.memberVO.action = "<c:url value="/sys/memberReg.do"/>";
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
						<h3 class="card-title">회원관리 등록</h3>
					</div>
					<div class="card-body">
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="emplyr_id" class="col-form-label">회원ID</label>
								</div>
								<div class="col-9 input-group">
									<input type="text" class="form-control" name="emplyr_id" value="${vo.emplyr_id }">
									<div class="input-group-append">
										<button type="submit" class="btn btn-md btn-default" onclick="">중복확인</button>
									</div>
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
									<label for="password" class="col-form-label">비밀번호</label>
								</div>
								<div class="col-9">
									<input type="password" class="form-control" name="password">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="password_chk" class="col-form-label">비밀번호확인</label>
								</div>
								<div class="col-9">
									<input type="password" class="form-control" name="password_chk">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="password_hint" class="col-form-label">비밀번호힌트</label>
								</div>
								<div class="col-9">
									<select class="custom-select" name="password_hint">
										<option>--선택하세요--</option>
										<option>기억에 남는 추억의 장소는?</option>
										<option>자신의 인생 좌우명은?</option>
										<option>가작 기억에 남는 선생님 성함은?</option>
										<option>타인이 모르는 신체 비밀이 있다면?</option>
										<option>받았던 선물 중 기억에 남는 독특한 선물은?</option>
										<option>유년시절 가작 생각나는 친구 이릉은?</option>
										<option>인상 깊게 읽은 책 이름은?</option>
										<option>읽은 책 중에서 좋아하는 구절이 있다면?</option>
										<option>자신이 두 번째로 존경하는 인물은?</option>
										<option>친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
										<option>초등학교 때 기억에 남는 짝꿍 이름은?</option>
										<option>내가 좋아하는 캐릭터는?</option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="password_cnsr" class="col-form-label">비밀번호정답</label>
								</div>
								<div class="col-9">
									<input type="text" class="form-control" name="password_cnsr" value="${vo.password_cnsr }">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="upper_menu_no" class="col-form-label">성별</label>
								</div>
								<div class="col-9">
									<select class="custom-select">
										<option>--선택하세요--</option>
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
											<input type="text" class="form-control" name="area_no" style="width: 100px;"> - <input type="text" class="form-control" name="house_middle_telno" style="width: 100px;"> - <input type="text" class="form-control" name="house_end_telno" style="width: 100px;">
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
									<input type="text" class="form-control" name="email_adres">
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
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="emplyr_sttus_code" class="col-form-label">회원상태</label>
								</div>
								<div class="col-9">
									<input type="text" class="form-control" name="emplyr_sttus_code" value="${vo.emplyr_sttus_code }">
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-9"></div>
							<div class="col-3">
								<div>
									<button type="button" class="btn bg-gradient-primary" style="margin-right: 10px;" onclick="registMember(); return false;">등록</button>
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
		</form>
	</section>
</body>
</html>