<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diebock</title>
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
						<%-- 						<div class="form-group">
							<div class="row">
								<div class="col-2">
									<label for="menu_no" class="col-form-label">메뉴No *</label>
								</div>
								<div class="col-4">
									<input type="text" class="form-control" name="menu_no" value="${vo.menu_no }">
								</div>
								<div class="col-2">
									<label for="menu_ordr" class="col-form-label">메뉴순서 *</label>
								</div>
								<div class="col-4">
									<input type="text" class="form-control" name="menu_ordr" value="${vo.menu_ordr }">
								</div>
							</div>
						</div> --%>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="upper_menu_no" class="col-form-label">회원ID</label>
								</div>
								<div class="col-9 input-group">
									<input type="text" class="form-control" name="upper_menu_no" value="${vo.upper_menu_no }">
									<div class="input-group-append">
										<button type="submit" class="btn btn-md btn-default" onclick="open_upper_menu_no()">중복확인</button>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="upper_menu_no" class="col-form-label">회원이름</label>
								</div>
								<div class="col-9">
									<input type="text" class="form-control" name="progrm_file_nm">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="upper_menu_no" class="col-form-label">비밀번호</label>
								</div>
								<div class="col-9">
									<input type="password" class="form-control" name="progrm_file_nm">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="upper_menu_no" class="col-form-label">비밀번호확인</label>
								</div>
								<div class="col-9">
									<input type="password" class="form-control" name="progrm_file_nm">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="upper_menu_no" class="col-form-label">비밀번호힌트</label>
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
									<label for="upper_menu_no" class="col-form-label">비밀번호정답</label>
								</div>
								<div class="col-9">
									<input type="text" class="form-control" name="progrm_file_nm">
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
									<label for="upper_menu_no" class="col-form-label">전화번호</label>
								</div>
								<div class="col-9">
									<div class="col-12">
										<div class="form-group row">
											<input type="text" class="form-control" name="progrm_file_nm" style="width: 100px;"> - <input type="text" class="form-control" name="progrm_file_nm" style="width: 100px;"> - <input type="text" class="form-control" name="progrm_file_nm" style="width: 100px;">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="upper_menu_no" class="col-form-label">이메일주소</label>
								</div>
								<div class="col-9">
									<input type="text" class="form-control" name="progrm_file_nm">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="upper_menu_no" class="col-form-label">우편번호</label>
								</div>
								<div class="col-9">
									<input type="text" class="form-control" name="progrm_file_nm">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="upper_menu_no" class="col-form-label">주소</label>
								</div>
								<div class="col-9">
									<input type="text" class="form-control" name="progrm_file_nm">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="upper_menu_no" class="col-form-label">상세주소</label>
								</div>
								<div class="col-9">
									<input type="text" class="form-control" name="progrm_file_nm">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-3">
									<label for="upper_menu_no" class="col-form-label">회원상태</label>
								</div>
								<div class="col-9">
									<input type="text" class="form-control" name="progrm_file_nm">
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-9"></div>
							<div class="col-3">
								<div>
									<button type="button" class="btn bg-gradient-primary" style="margin-right: 10px;" onclick="modifyMenu(); return false;">등록</button>
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