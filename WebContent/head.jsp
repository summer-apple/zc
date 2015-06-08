<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 头部开始 -->
  <div class="header">
  
	<div class="head-in">
  	<img class="logo" src="images/common/logo.png"/>

  	
  	<ul class="nav">
  		<li class="nav-item">
  			<a class="nav-item-word white" href="index.jsp">
  				<span class="nav-item-icon white fa fa-home"></span> 首页
  			</a>
  		</li>
  		<li class="nav-item">
  			<a class="nav-item-word white" href="project-list.jsp">
  				<span class="nav-item-icon white fa fa-eye"></span> 浏览项目
  			</a>
  		</li>
  		
  		<c:if test="${empty user }">
  		<li class="nav-item">
  			<a class="nav-item-word white log-btn click-mask" href="javascript:void(0);">
  				<span class="nav-item-icon white fa fa-plus"></span> 发起项目
  			</a>
  		</li>
  		<li class="nav-item">
  			<a class="nav-item-word white log-btn click-mask"" href="javascript:void(0);">
  				<span class="nav-item-icon white fa fa-phone"></span> 个人中心
  			</a>
  		</li>
  		</c:if>
  		<c:if test="${!empty user }">
	  		<li class="nav-item">
	  			<a class="nav-item-word white" href="agree-project-protocol.jsp">
	  				<span class="nav-item-icon white fa fa-plus"></span> 发起项目
	  			</a>
	  		</li>
  			<li class="nav-item">
	  			<a class="nav-item-word white" href="user-center.jsp">
	  				<span class="nav-item-icon white fa fa-phone"></span> 个人中心
	  			</a>
  			</li>
  		</c:if>
  		
  		
  	</ul>
  	
  	<div class="nav-right">
  	<form class="search" action="SearchServlet" method="post">
  		<input class="search-input" type="search" placeholder="搜索关键字" name="key_word"/>
  		<a class="search-btn-icon" href="javasrcipt:void(0);">
  			<span class="search-icon fa fa-search"></span>
  		</a>
  		<input class="search-btn" type="submit"/>
  	</form>
  	
  	<c:if test="${empty user}">
	  	<div class="log-reg">
	  		<a class="log-reg-a white log-btn click-mask" href="javascript:void(0);">登录</a>
	  		<a class="log-reg-a white reg-btn click-mask" href="javascript:void(0);">注册</a>
	  	</div>
  	</c:if>
  	<c:if test="${!empty user}">
  		<div class="avatar-warp">
  			<a href="user-center.jsp"><img class="avatar-img" src="${user.user_avatar}"/></a>
  			<ul class="user-operation">
  				<!-- <li class="user-operation-item"><a href="user-center.jsp">支持的项目</a></li>
  				<li class="user-operation-item"><a href="GetMyProjectServlet">发起者后台</a></li> -->
  				<c:if test="${user.store_id!=0}"><li class="user-operation-item"><a href="GetStoreByOwnerServlet?store_owner=${user.user_id}">我的商店</a></li></c:if>
  				<li class="user-operation-item"><a href="settings.jsp">个人设置</a></li>
  				<li class="user-operation-item"><a href="LogoutServlet">退出</a></li>
  			</ul>
  		</div>
  	</c:if>
  	</div>
  	
  	
  	</div>
  </div>
  <!-- 头部结束 -->