<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<body class="bg-light">
	<div style="margin: 2%;"></div>
    <div class="container">
      <div class="py-5 text-center">
        <h2>회 원 가 입</h2>        
      </div>
	
	<div class="row">
	<div class="col-md-4 order-md-2 mb-4">
		<small>1. Delivery 회원가입은 만 14세 이상의 고객만 가능합니다.</small><br/>
		<small>2. 전 항목은 필수 사항 입니다. 반드시 기재 부탁드림니다.</small>
	</div>
	<div class="col-md-8">
		<form action="${pageContext.servletContext.contextPath}/signup.do" method="post">
		  <div class="col-md-8 order-md-1" >
		    <label><small>(필수)</small>아이디</label>
		    <input type="text" class="form-control" id="id" name="id" placeholder="ID" autocomplete="off">
			<button type="button" class="btn btn-secondary" id="btn_checkid">중복확인</button>
		    <small id="checkresult" class="form-text text-muted"></small>
		  </div>
		  <div class="col-md-8 order-md-1">
		    <label><small>(필수)</small>비밀번호</label>
		    <input type="password" class="form-control" id="pw1" name="pw1" placeholder="PASSWORD"><hr/>
		    <input type="password" class="form-control" id="pw2" name="pw2" placeholder="PASSWORD CONFIRM">
		    <span id="result"></span>
		  </div>
		  <div class="col-md-8 order-md-1">
		    <label><small>(필수)</small>닉네임</label>
		    <input type="text" class="form-control" id="nick" name="nick"  placeholder="NICKNAME">
		  </div>
		  <div class="form-group col-md-8 ">
		    <label><small>(필수)</small>휴대폰</label>
		    <input type="text" class="form-control" id="phone" name="phone"  placeholder="PHONE">
		  </div>
		  <button class="btn btn-primary btn-lg btn-block" type="submit">회 원 가 입</button>
		
		</form>
	</div>
	</div>
	</div>
	<script>
	
	$("#pw2").on("keyup",function(){
		var pw1 = $("#pw1").val();
		var pw2 = $("#pw2").val();
		
		if (pw1==pw2) {
			var html="비밀번화가 일치합니다.";
			document.getElementById("result").innerHTML=html;
			$("#result").css("color","blue");	
		}else {
			var html="비밀번화가 일치하지 않습니다.";
			document.getElementById("result").innerHTML=html;
			$("#result").css("color","red");
		}
	
	});
	
	$("#btn_checkid").on("click",function(){
		var id = $("#id").val();
		
		var url="/delivery/idcheck.do";
		var param={
			"mode":"checkid",
			"id":id				
		};
		
		$.get(url,param,function(rst){
			console.log(rst);
			if (rst==true) {
				if (id=="") {
					window.alert("아이디를 입력해주세요.");
				}else{
				$("#checkresult").html("사용가능한 아이디 입니다");
				}
			}else{
				$("#checkresult").html("사용중인 아이디 입니다");
			}
		});
		
	});

	
	
	
	</script>
	
	
	

</body>