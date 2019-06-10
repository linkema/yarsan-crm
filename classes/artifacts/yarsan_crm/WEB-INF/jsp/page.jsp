<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: my-deepin
  Date: 18-3-17
  Time: 下午4:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <title>备忘录操作界面</title>
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
          type="text/css">
    <link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
          type="text/css">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css"/>
</head>
<body class="layui-layout-body">

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 17px;"><strong>YarsanMa_客户管理系统</strong></div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><a href="<%=basePath%>/user/login.action" style="text-decoration: none;;"><strong>退出登录</strong></a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/customer.action" ><strong><span class="fa fa-bicycle fa-fw"></span>&nbsp;&nbsp;&nbsp;客户管理</strong></a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/salevisit.action" ><strong><span class="fa fa-child fa-fw"></span>&nbsp;&nbsp;&nbsp;客户拜访</strong></a></li>
                <li class="layui-nav-item">
                    <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;备忘录管理</strong></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="javascript: toArticleManage();" style="text-decoration: none;"><strong>备忘录列表</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: toArticleWrite();" style="text-decoration: none;"><strong>备忘录草稿</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: toArticleTrash();" style="text-decoration: none;"><strong>回收站</strong></a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <!-- 以上都是共享内容 -->

    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div id="content">
            <div style="font-size: 45px;color: #1D9D73;margin-top: 300px;" class="text-center"><strong>欢迎使用客户管理系统备忘录功能</strong></div>
            <p class="text-center">
                <strong style="color: #1D9D73;">本系统由各种Copy来的代码实现功能以及页面的美化</strong>
            </p>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <strong>© 客户管理系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---->&nbsp;Create by YarsanMa</strong>
        <strong class="layui-layout-right">系统时间：<%=nowDate%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
    </div>
</div>
</body>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<script src="<%=basePath%>/layui/layui.js"></script>
<script src="<%=basePath%>/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/js/jquery-3.3.1.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<script type="text/javascript">
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
<script type="text/javascript">
    function toArticleWrite() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/article/toArticleWrite.action\" width=\"100%\" height=\"100%\"></object>";
    }
    function toArticleManage() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/article/toArticleManage.action\" width=\"100%\" height=\"100%\"></object>";
    }
    function toArticleTrash() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/article/toArticleTrash.action\" width=\"100%\" height=\"100%\"></object>";
    }
</script>
</html>