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
  max-width: 330px;
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
 </style>   
<title>N0rmAl_h0te1</title>
</head>
<body class="text-center" >
<nav class="navbar navbar-dark bg-dark">
  <a class="navbar-brand" href="../start/home_page.jsp">返回首页</a>
   <a href="./login_in.jsp"><button class="btn btn-primary my-2 my-sm-0" type="submit">会员登录/注册</button></a>
</nav>
 <form class="form-signin" method="post" action="../adminLogin.do">
      <h1 class="h3 mb-3 font-weight-normal">管理员，请登录</h1>
      <input type="text" name="inputName" class="form-control" placeholder="管理员名称" required autofocus>
      <input type="password" name="inputPwd" class="form-control" placeholder="管理员密码" required>
      <hr class="featurette-divider">
      <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
      <hr class="featurette-divider">
      <p class="mt-5 mb-3 text-muted">*该页面为管理员登录页面，若您不是管理员请点击导航栏左上角/右上角，返回网站主页/登录页面。谢谢合作: )</p>
    </form>
  </body>
</html>