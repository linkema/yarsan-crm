<%--
  Created by IntelliJ IDEA.
  User: YasanMa
  Date: 2019/6/3
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>注册</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you util the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        function changeImage() {
            /*
            1. 获取img元素
            */
            var imgEle = document.getElementById("imgEle");
            // 设置它的src为servlet
            imgEle.src = "${pageContext.request.contextPath }/user/getVerifyCode.action" ;
        }
    </script>
</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">注册界面</h3>
                </div>
                <div class="panel-body">
                    <form role="form" action="${pageContext.request.contextPath}/user/doRegist.action" method="post">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="账户名" name="username" autofocus>
                                <span style="color: red; font-size: 10pt; font-weight: 900;">
                                    ${errors.username }
                                </span>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="密码" name="password" type="password">
                                <span style="color: red; font-size: 10pt; font-weight: 900;">
                                    ${errors.password }
                                </span>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="确认密码" name="repassword" type="password">
                                <span style="color: red; font-size: 10pt; font-weight: 900;">
                                    ${errors.repassword }
                                </span>
                            </div>
                            <div class="form-group">
                                    <input class="form-control" style="width:180px;" type="text" id="verifyCode" name="verifyCode" placeholder="验证码" maxlength="4">
                                    <img  src="${pageContext.request.contextPath }/user/getVerifyCode.action" width="110" height="34" id="imgEle" />
                                    <a href="javascript:changeImage()">换一张</a>
                                    <span style="color: red; font-size: 10pt; font-weight: 900;">
                                        ${errors.verifyCode }
                                    </span>
                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <input type="submit" value="注册" class="btn btn-primary form-control">
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/bower_components/jquery/dist/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/bower_components/metisMenu/dist/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="${pageContext.request.contextPath}/js/sb-admin-2.js"></script>

<!-- Background -->
<script src="${pageContext.request.contextPath}/bower_components/login/jquery.backstretch.min.js"></script>
<script src="${pageContext.request.contextPath}/bower_components/login/scripts.js"></script>

</body>

</html>

