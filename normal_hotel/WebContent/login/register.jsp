<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
    <link href="./login.css" rel="stylesheet">
        <script src="../bootstrap4/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
    <script src="../bootstrap4/js/bootstrap.min.js"  type="text/javascript"></script>
    <script src="../bootstrap4/popper.min.js"  type="text/javascript"></script>
    <script src="../bootstrap4/holder.min.js"  type="text/javascript"></script>
  <style>
 .form-signin {
  width: 100%;
  max-width:500px;
  padding: 15px;
  margin: 0 auto;
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
#gendercheck
{
text-align:left!important;
font-size:17px;
padding-left:0.20em;
border-left-style:solid;
border-left-width:10px;
border-left-color:rgb(94,180,243);
}
  </style>
<title>N0rmAl_h0te1</title>
</head>
<body class="text-center"> 
<nav class="navbar navbar-dark bg-dark">
  <a class="navbar-brand" href="./login_in.jsp">返回登录</a>
  <a href="./login_in.jsp"><button class="btn btn-primary" type="submit">会员登录/注册</button></a>
</nav>
<form class="form-signin" method="post" action="../register.do">
   <h1 class="h3 mb-3 font-weight-normal">请正确填写以下信息</h1>
   <hr class="featurette-divider">
   <div class="form-group">
   <input type="email" name="inputEmail" class="form-control" placeholder="邮箱地址" required autofocus>
   </div>
    <hr class="featurette-divider">
     <div class="form-group">
    <input type="password" name="inputPwd" class="form-control"  placeholder="密码" required autofocus>
    </div>
    <hr class="featurette-divider">
    <div class="form-group">
    <input type="password" name="inputPwd2" class="form-control"  placeholder="确认密码" required autofocus>
    </div>
    <hr class="featurette-divider">
    <div class="form-group">
    <input type="text" name="inputPapper" class="form-control"  placeholder="身份证号码" required autofocus>
    </div>
    <hr class="featurette-divider">
    <div class="form-group">
    <input type="text" name="realName" class="form-control"  placeholder="真实姓名" required autofocus>
    </div>
    <hr class="featurette-divider">
    <div class="form-group" id="gendercheck">
    <label>性别：</label>
    <input type="radio" name="sex" value="male" checked>男
    <input type="radio" name="sex" value="female">女
    </div>
    <hr class="featurette-divider">
     <div class="form-group">
    <input type="text" name="address" class="form-control"  placeholder="家庭住址" required autofocus>
    </div>
  <hr class="featurette-divider">
  <button class="btn btn-lg btn-outline-primary btn-block" type="submit">注册</button>
</form>
</body>
</html>