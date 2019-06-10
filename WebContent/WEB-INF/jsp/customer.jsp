<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mlk" uri="xxx"%>
<%--
  Created by IntelliJ IDEA.
  User: YasanMa
  Date: 2019/6/3
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String nowDate = sdf.format(date);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>客户列表-YarsanMa_CRM</title>

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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">YarsanMa客户管理系统 v2.0</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-messages">
					<li><a href="#">
							<div>
								<strong>马苓珂</strong> <span class="pull-right text-muted">
									<em>昨天</em>
								</span>
							</div>
							<div>初次尝试。。</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>查看全部消息</strong>
							<i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-messages --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-tasks">
					<li><a href="#">
							<div>
								<p>
									<strong>任务 1</strong> <span class="pull-right text-muted">完成40%</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="40" aria-valuemin="0"
										aria-valuemax="100" style="width: 40%">
										<span class="sr-only">完成40%</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<p>
									<strong>任务 2</strong> <span class="pull-right text-muted">完成20%</span>
								</p>
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-info" role="progressbar"
										aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
										style="width: 20%">
										<span class="sr-only">完成20%</span>
									</div>
								</div>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>查看所有任务</strong>
							<i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-tasks --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-alerts">
					<li><a href="#">
							<div>
								<i class="fa fa-comment fa-fw"></i> 新回复 <span
									class="pull-right text-muted small">4分钟之前</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li>
							<div>
                                <a href="#" data-toggle="modal" data-target="#sendEmailDialog" >
                                    <i class="fa fa-envelope fa-fw"></i> 发送邮件</a>
							</div>
					</li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-tasks fa-fw"></i> 新任务 <span
									class="pull-right text-muted small">4分钟之前</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a href="#">
							<div>
								<i class="fa fa-upload fa-fw"></i> 服务器重启 <span
									class="pull-right text-muted small">4分钟之前</span>
							</div>
					</a></li>
					<li class="divider"></li>
					<li><a class="text-center" href="#"> <strong>查看所有提醒</strong>
							<i class="fa fa-angle-right"></i>
					</a></li>
				</ul> <!-- /.dropdown-alerts --></li>
			<!-- /.dropdown -->
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
			</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#" data-toggle="modal" data-target="#userModifyDialog"><i class="fa fa-user fa-fw"></i> 修改密码</a></li>
					<li><a href="${pageContext.request.contextPath}/user/regist.action"><i class="fa fa-gear fa-fw"></i> 创建新用户 </a></li>
					<li class="divider"></li>
					<li><a href="/crm"><i class="fa fa-sign-out fa-fw"></i>
							退出登录</a></li>
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
		<!-- /.navbar-top-links -->

		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<div class="input-group custom-search-form">
							<input type="text" class="form-control" placeholder="查询内容...">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">
									<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
								</button>
							</span>
						</div> <!-- /input-group -->
					</li>
					<li><a href="${pageContext.request.contextPath}/customer.action" class="active"><i
							class="fa fa-edit fa-fw"></i> 客户管理</a></li>
					<li><a href="${pageContext.request.contextPath}/salevisit.action" class="active"><i
							class="fa fa-dashboard fa-fw"></i> 客户拜访</a></li>
					<li  ><a href="<%=basePath%>article/page.action "  class="active"><i class="fa fa-apple fa-fw"></i>备忘列表</a></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">客户管理</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body" >
					<form class="form-inline" action="${pageContext.request.contextPath }/customer/list.action" method="get">
						<div class="form-group">
							<label for="customerName">客户名称</label> 
							<input type="text" class="form-control" id="customerName" value="${custName }" name="custName">
						</div>
						<div class="form-group">
							<label for="customerFrom">客户来源</label> 
							<select	class="form-control" id="customerFrom" placeholder="客户来源" name="custSource">
								<option value="">--请选择--</option>
								<c:forEach items="${fromType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custSource}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="custIndustry">所属行业</label> 
							<select	class="form-control" id="custIndustry"  name="custIndustry">
								<option value="">--请选择--</option>
								<c:forEach items="${industryType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custIndustry}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="custLevel">客户级别</label>
							<select	class="form-control" id="custLevel" name="custLevel">
								<option value="">--请选择--</option>
								<c:forEach items="${levelType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="custCast">年营业额</label>
							<select	class="form-control" id="custCast" name="custCast">
								<option value="">--请选择--</option>
								<c:forEach items="${castType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custCast}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
						<label for="custDo">客户状态</label>
						<select	class="form-control" id="custDo" name="custDo">
							<option value="">--请选择--</option>
							<c:forEach items="${doType}" var="item">
								<option value="${item.dict_id}"<c:if test="${item.dict_id == custDo}"> selected</c:if>>${item.dict_item_name }</option>
							</c:forEach>
						</select>
					</div>
						<button type="submit" class="btn btn-primary">查询</button>
                    <div class="btn">
                        <a href="" data-toggle="modal" data-target="#customerCreateDialog">添加新客户</a>
                    </div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default" >
						<div class="panel-heading">客户信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped" id="content">
							<thead>
								<tr>
									<th>ID</th>
									<th>客户名称</th>
									<th>客户来源</th>
									<th>客户所属行业</th>
									<th>客户级别</th>
									<th>固定电话</th>
									<th>手机</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.cust_id}</td>
										<td>${row.cust_name}</td>
										<td>${row.cust_source}</td>
										<td>${row.cust_industry}</td>
										<td>${row.cust_level}</td>
										<td>${row.cust_phone}</td>
										<td>${row.cust_mobile}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="editCustomer(${row.cust_id})">修改</a>
											<a href="#" class="btn btn-danger btn-xs" onclick="deleteCustomer(${row.cust_id})">删除</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<mlk:page url="${pageContext.request.contextPath }/customer/list.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>

		</div>
		<div class="footer">
			<!-- 底部固定区域 -->
			<strong>© 客戶管理系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---->&nbsp;Create by YarsanMa</strong>
			<strong class="right">系统时间：<%=nowDate %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
		</div>
		<!-- /#page-wrapper -->

	</div>
    <%--客户创建对话框--%>
    <div class="modal fade" id="customerCreateDialog" tabindex="-1" role="dialog"
         aria-labelledby="cModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="cModalLabel">添加客户信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="create_customer_form">
                        <input type="hidden" id="create_cust_id" name="cust_id"/>
                        <div class="form-group">
                            <label for="create_customerName" class="col-sm-2 control-label">客户名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="create_customerName" placeholder="客户名称" name="cust_name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="create_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户来源</label>
                            <div class="col-sm-10">
                                <select	class="form-control" id="create_customerFrom" placeholder="客户来源" name="cust_source">
                                    <option value="">--请选择--</option>
                                    <c:forEach items="${fromType}" var="item">
                                        <option value="${item.dict_id}"<c:if test="${item.dict_id == custSource}"> selected</c:if>>${item.dict_item_name }</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="create_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属行业</label>
                            <div class="col-sm-10">
                                <select	class="form-control" id="create_custIndustry"  name="cust_industry">
                                    <option value="">--请选择--</option>
                                    <c:forEach items="${industryType}" var="item">
                                        <option value="${item.dict_id}"<c:if test="${item.dict_id == custIndustry}"> selected</c:if>>${item.dict_item_name }</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="create_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
                            <div class="col-sm-10">
                                <select	class="form-control" id="create_custLevel" name="cust_level">
                                    <option value="">--请选择--</option>
                                    <c:forEach items="${levelType}" var="item">
                                        <option value="${item.dict_id}"<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="create_linkMan" class="col-sm-2 control-label">联系人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="create_linkMan" placeholder="联系人" name="cust_linkman">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="create_phone" class="col-sm-2 control-label">固定电话</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="create_phone" placeholder="固定电话" name="cust_phone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="create_mobile" class="col-sm-2 control-label">移动电话</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="create_mobile" placeholder="移动电话" name="cust_mobile">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="create_zipcode" class="col-sm-2 control-label">邮政编码</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="create_zipcode" placeholder="邮政编码" name="cust_zipcode">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="create_address" class="col-sm-2 control-label">联系地址</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="create_address" placeholder="联系地址" name="cust_address">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="createCustomer()">保存</button>
                </div>
            </div>
        </div>
    </div>
	<!-- 客户编辑对话框 -->
	<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_customer_form">
						<input type="hidden" id="edit_cust_id" name="cust_id"/>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="客户名称" name="cust_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户来源</label> 
							<div class="col-sm-10">
								<select	class="form-control" id="edit_customerFrom" placeholder="客户来源" name="cust_source">
									<option value="">--请选择--</option>
									<c:forEach items="${fromType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == custSource}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属行业</label>
							<div class="col-sm-10"> 
								<select	class="form-control" id="edit_custIndustry"  name="cust_industry">
									<option value="">--请选择--</option>
									<c:forEach items="${industryType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == custIndustry}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
							<div class="col-sm-10">
								<select	class="form-control" id="edit_custLevel" name="cust_level">
									<option value="">--请选择--</option>
									<c:forEach items="${levelType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">联系人</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_linkMan" placeholder="联系人" name="cust_linkman">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_phone" class="col-sm-2 control-label">固定电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_phone" placeholder="固定电话" name="cust_phone">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_mobile" class="col-sm-2 control-label">移动电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_mobile" placeholder="移动电话" name="cust_mobile">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_zipcode" class="col-sm-2 control-label">邮政编码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_zipcode" placeholder="邮政编码" name="cust_zipcode">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_address" class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_address" placeholder="联系地址" name="cust_address">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateCustomer()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<%--用户修改密码--%>
	<div class="modal fade" id="userModifyDialog" tabindex="-1" role="dialog"
		 aria-labelledby="cModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="uModalLabel">修改用户密码</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="modify_user_form">
						<input type="hidden" id="modify_user_name" name="username" value="${user.username}"/>
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">新密码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="password" placeholder="新密码" name="password" >
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="modifyUser()">保存</button>
				</div>
			</div>
		</div>
	</div>
    <%--用户发送邮件--%>
    <div class="modal fade" id="sendEmailDialog" tabindex="-1" role="dialog"
         aria-labelledby="eModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="eModalLabel">发送邮件</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="send_mail_form">
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">短讯息</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="context" placeholder="消息" name="context" >
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="sendEmail()">发送</button>
                </div>
            </div>
        </div>
    </div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
	<script src="<%=basePath%>/static/layui/layui.js"></script>
	<script src="<%=basePath%>/static/js/bootstrap.min.js"></script>
	<script src="<%=basePath%>/static/js/jquery-3.3.1.min.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	
	<script type="text/javascript">
		function editCustomer(id) {
			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/customer/edit.action",
				data:{"id":id},
				success:function(data) {
					$("#edit_cust_id").val(data.cust_id);
					$("#edit_customerName").val(data.cust_name);
					$("#edit_customerFrom").val(data.cust_source)
					$("#edit_custIndustry").val(data.cust_industry)
					$("#edit_custLevel").val(data.cust_level)
					$("#edit_linkMan").val(data.cust_linkman);
					$("#edit_phone").val(data.cust_phone);
					$("#edit_mobile").val(data.cust_mobile);
					$("#edit_zipcode").val(data.cust_zipcode);
					$("#edit_address").val(data.cust_address);
					
				}
			});
		}
		function modifyUser() {
			$.post("${pageContext.request.contextPath}/user/modifyPassword.action",$("#modify_user_form").serialize(),function(data){
				alert("用户密码修改成功！");
				window.location.reload();
			});
		}
        function createCustomer() {
            $.post("${pageContext.request.contextPath}/customer/insert.action",$("#create_customer_form").serialize(),function(data){
                alert("客户信息添加成功！");
                window.location.reload();
            });
        }
        function sendEmail() {
            $.post("${pageContext.request.contextPath}/email/send.action",$("#send_mail_form").serialize(),function(data){
                alert("消息发送成功！");
                window.location.reload();
            });
        }
		function updateCustomer() {
			$.post("${pageContext.request.contextPath}/customer/update.action",$("#edit_customer_form").serialize(),function(data){
				alert("客户信息更新成功！");
				window.location.reload();
			});
		}
		function deleteCustomer(id) {
			if(confirm('确实要删除该客户吗?')) {
				$.post("${pageContext.request.contextPath}/customer/delete.action",{"id":id},function(data){
					alert("客户删除更新成功！");
					window.location.reload();
				});
			}
		}
		layui.use('element', function(){
			var element = layui.element;
		});
	</script>
</body>

</html>
