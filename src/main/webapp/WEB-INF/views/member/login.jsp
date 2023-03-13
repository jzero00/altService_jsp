<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<style>
html,
body {
  height: 100%;
}

body {
  display: -ms-flexbox;
  display: flex;
  -ms-flex-align: center;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}
.form-signin .checkbox {
  font-weight: 400;
}
.form-signin .form-control {
  position: relative;
  box-sizing: border-box;
  height: auto;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>
</head>
<body>
<!-- div s -->
<form id="frm" class="form-signin" action="/member/login.do" method="post">
<!--   <img class="mb-4" src="/docs/4.6/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
<!--   <h1 class="h3 mb-3 font-weight-normal">로그인해주십시오</h1> -->
  <label for="name" class="sr-only">이름</label>
  <input type="text" id="name" name="altNo" class="form-control" placeholder="이름을 입력해주세요" required="" autofocus="">
  <label for="password" class="sr-only">Password</label>
  <input type="password" id="password" name="pwd" class="form-control" placeholder="Password" required="">
<!--   <div class="checkbox mb-3"> -->
<!--     <label> -->
<!--       <input type="checkbox" value="remember-me"> Remember me -->
<!--     </label> -->
<!--   </div> -->
  <button class="btn btn-lg btn-primary btn-block" type="button" onclick="login()">로그인</button>
<!--   <p class="mt-5 mb-3 text-muted">© 2017-2022</p> -->
</form>
<!-- div e -->
</body>
<script>
function login(){
	let form = document.querySelector('form[id=frm]');
	let inputs = form.querySelectorAll('input');
	let blankFlag = true;
	inputs.forEach(function(e) {
		if(e.value == null || e.value == ''){
			blankFlag = false;
			if(!blankFlag) {
				return false;
			}
		}
	});
	
	if(blankFlag){
		form.submit();
	} else {
		alert('빈값을 입력해주십시오.');
		
	}
}
</script>
</html>