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
 <form class="form-signin" method="post" action="../login.do">
      <h1 class="h3 mb-3 font-weight-normal">请登录</h1>
      <label for="inputEmail" class="sr-only">邮箱地址</label>
      <input type="email" name="inputEmail" class="form-control" placeholder="邮箱地址" required autofocus>
      <label for="inputPassword" class="sr-only">密码</label>
      <input type="password" name="inputPwd" class="form-control" placeholder="账号密码" required>
      <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
      <a href="./register.jsp"><button class="btn btn-lg btn-outline-primary btn-block" type="button">注册</button></a>
     <p class="mt-5 mb-3 text-muted">&copy; 2017-2077</p>
      <a href="./admin_login.jsp"><p class="mt-5 mb-3 text-muted">&Oslash;</p></a>
    </form>
  </body>
</html>