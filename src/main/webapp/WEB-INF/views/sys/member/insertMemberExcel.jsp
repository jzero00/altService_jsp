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
				<form>
					<div class="card-body">
						<div class="form-group">
							<label for="exampleInputFile">엑셀 등록</label>
							<div class="input-group">
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="exampleInputFile" onchange="changeFile()"> <label class="custom-file-label" for="exampleInputFile">Choose file</label>
								</div>
								<div class="input-group-append">
									<span class="input-group-text">등록하기</span>
								</div>
							</div>
						</div>
					</div>
					<!-- /.card-body -->
					<div class="card-footer">
						<button type="submit" class="btn btn-primary">Submit</button>
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
</script>
</html>