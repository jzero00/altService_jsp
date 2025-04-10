<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<section class="content">
		<div class="container-fluid">
			<div class="card card-primary">
				<div class="card-header">
					<h3 class="card-title">엑셀일괄등록</h3>
				</div>
				<!-- /.card-header -->
				<!-- form start -->
				<form id="frm" name="frm" method="post" action="/excel/insertMember.do" enctype="multipart/form-data">
					<div class="card-body">
						<div class="form-group">
							<label for="exampleInputFile">엑셀 등록</label>
							<div class="input-group">
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="exampleInputFile" onchange="changeFile()" name="excelFile">
									<label class="custom-file-label" for="exampleInputFile">파일 선택</label>
								</div>
								<div class="input-group-append">
									<span class="input-group-text">등록하기</span>
								</div>
							</div>
						</div>
					</div>
					<!-- /.card-body -->
					<div class="card-footer">
						<button type="button" onclick="registExcelFile();" class="btn btn-primary">엑셀 일괄 등록</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
<script>
	function changeFile(){
		let fileInput = document.querySelector("input[type=file]");
		let file = fileInput.files[0];
		let name = file.name;
		let fileLabel = document.querySelector("label[class=custom-file-label]").innerHTML = name; 
	}
	
	function registExcelFile(){
		if(confirm("파일을 등록하시겠습니까?")){
			document.frm.submit();		
		}
	}
</script>
</html>