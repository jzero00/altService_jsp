<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<table class="table">
				<tr>
					<th>
						<div class="form-group row">
							<div class="row">
								<div class="col-9">
									<div class="row">
										<div class="col-4">
											<label for="menu" class="col-sm-3 col-form-label">메뉴명 : </label>
										</div>
										<div class="col-8">
											<div class="col-sm-9">
												<input type="text" class="form-control" id="menu">
											</div>
										</div>
									</div>
								</div>
								<div class="col-3">
									<div class="btn-group">
										<button type="button" class="btn bg-gradient-primary" onclick="upperMenuNoSearch(); return false;">조회</button>
									</div>
								</div>
							</div>
						</div>
					</th>
				</tr>
			</table>
			<table class="table">
				<tr>
					<th>프로그램파일명</th>
					<th>프로그램명</th>
				</tr>
			</table>
		</div>
	</section>
</body>
</html>