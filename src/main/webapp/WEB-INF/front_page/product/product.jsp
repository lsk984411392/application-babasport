<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<title>康康运动网-电子商城</title>
<link rel="stylesheet" href="/res/css/style.css" />
<script src="/res/js/jquery.js"></script>
<script src="/res/js/com.js"></script>
<script type="text/javascript">
//登陆
function login(){
	window.location.href = "/shopping/toLogin.shtml?returnUrl="+window.location.href;
}
function searchp(){
	var a=$("#s1").val();
	window.location.href="/product/display/list.shtml?searchName="+a;
}
$(document).ready(function(){
	var url="/product/viewCart.shtml";
	$.post(url,null,function(data){
		var items=data.items;
		var ht="";
		var amount=0;
		var totalp=0.00;
		for(i=0;i<items.length;i++){
			ht+="<p class='dt'>"+items[i].sku.product.name+"---"+items[i].sku.color.name+"---"+items[i].sku.size+"---"
			+"<b><var>¥"+items[i].sku.skuPrice+"</var><span>x"+items[i].amount+"</span></b></p>";
			amount+=items[i].amount;
			totalp+=(items[i].amount)*(items[i].sku.skuPrice);
		}
		$("#ul1").html(ht);
		
		$("#totaljian").html(amount);
		$("#totaljian2").html(amount);
		$("#totalPrice").html(totalp);
	},'json');

});

/* <li>
	<a href="#" title="依琦莲2014瑜伽服套装新 瑜珈健身服三件套 广场舞蹈服装 女瑜伽服送胸垫 长袖紫色 M全场支持货到付款 全网最低价 千人超高好评瑜伽服赶紧抢！全五分好评截图联系客服还返现五元">
	<img src="/res/img/pic/p50x50.jpg" alt="依琦莲2014瑜伽服套装新 瑜珈健身服三件套 广场舞蹈服装 女瑜伽服送胸垫 长袖紫色 M全场支持货到付款 全网最低价 千人超高好评瑜伽服赶紧抢！全五分好评截图联系客服还返现五元" /></a>
	<p class="dt"><a href="#" title="依琦莲2014瑜伽服套装新 瑜珈健身服三件套 广场舞蹈服装 女瑜伽服送胸垫 长袖紫色 M全场支持货到付款 全网最低价 千人超高好评瑜伽服赶紧抢！全五分好评截图联系客服还返现五元">依琦莲2014瑜伽服套装新 瑜珈健身服三件套 广场舞蹈服装 女瑜伽服送胸垫 长袖紫色 M全场支持货到付款 全网最低价 千人超高好评瑜伽服赶紧抢！全五分好评截图联系客服还返现五元</a></p>
	<p class="dd">
		<b><var>¥128</var><span>x1</span></b>
		<a href="javascript:void(0);" title="删除" class="del">删除</a>
	</p>
</li> */

</script>
</head>
<body>
<div class="bar"><div class="bar_w">
	<p class="l">
		<span class="l">
			收藏本网站！上海<a href="#" title="更换">[更换]</a>
		</span>
	</p>
	<ul class="r uls">
	
		<c:if test="${empty buyer_session}">
			<li class="dev" >您好,请先登录哦！</li>
			<li class="dev"><a href="javascript:void(0)" onclick="login()"  title="登陆">[登陆]</a></li>
			<li class="dev"><a href="javascript:void(0)" onclick="window.location.href='/product/toRegister.shtml'" title="免费注册">[免费注册]</a></li>
			<li class="dev"><a href="javascript:void(0)" onclick="window.location.href='/product/toCart.shtml'" title="退出">[购物车]</a></li>
			<li class="dev"><a href="javascript:void(0)" onclick="window.location.href ='/buyer/index.shtml'" title="我的订单">我的订单</a></li>
		</c:if>
		<c:if test="${!empty buyer_session}">
			<li class="dev">您好,欢迎 <font color="red">${buyer_session.realName }</font>来到新巴巴运动网！</li>
			<li class="dev"><a href="javascript:void(0)" onclick="window.location.href ='/buyer/toLogout.shtml'" title="退出">[退出]</a></li>
			<li class="dev"><a href="javascript:void(0)" onclick="window.location.href='/product/toCart.shtml'" title="退出">[购物车]</a></li>
			<li class="dev"><a href="javascript:void(0)" onclick="window.location.href ='/buyer/index.shtml'" title="我的订单">我的订单</a></li>
		</c:if>
		
		<li class="dev"><a href="#" title="在线客服">在线客服</a></li>
		<li class="dev after"><a href="#" title="English">English</a></li>
	</ul>
</div></div>
<div class="w loc">
	<div class="h-title">
		<div class="h-logo"><a href="/"><img src="/res/img/pic/logo-1.png" /></a></div>
	    <div class="h-search">
	      	<input type="text" id="s1" name="searchName" value="${searchName }" />
	        <div class="h-se-btn"><a href="javascript:void(0)" onclick="searchp()">搜索</a></div>
	    </div>
	</div>
	<dl id="cart" class="cart r">
	
		<dt><a href="javascript:void(0)" title="结算" onclick="window.location.href ='/buyer/toOrder.shtml'"> 去结算</a  >购物车:共有  <b id="totaljian" >0</b>件</dt>
		<dd class="hidden">
			<p class="alg_c hidden">购物车中还没有商品，赶紧选购吧！</p>
			<h3 title="最新加入的商品">最新加入的商品</h3>
			<ul class="uls" id="ul1">
				
			</ul>
			<div>
				<p>共<b id="totaljian2">0</b>件商品&nbsp;&nbsp;&nbsp;&nbsp;共计<b class="f20" id="totalPrice">¥0.00</b></p>
				<a href="javascript:void(0)" title="去购物车结算" class="inb btn120x30c" onclick="window.location.href ='/buyer/toOrder.shtml'">去购物车结算</a>
			</div>
		</dd>
		
		
	</dl>
</div>

<div class="w ofc">
	<div class="l wl">
		<h2 class="h2 h2_l"><em title="销量排行榜">销量排行榜</em><cite></cite></h2>
		<div class="box bg_white">
			<ul class="uls x_50x50">
				
				
			</ul>
		</div>

		<h2 class="h2 h2_l mt"><em title="我的浏览记录">我的浏览记录</em><cite></cite></h2>
		<div class="box bg_white">
			<ul class="uls x_50x50">
				<!-- <li>
					<a href="#" title="富一代" target="_blank" class="pic"><img src="/res/img/pic/ppp.jpg" alt="依琦莲2014瑜伽服套装新" /></a>
					<dl>
						dt 8个文字+...
						<dt><a href="#" title="依琦莲2014瑜伽服套装新" target="_blank">依琦莲2014瑜伽服套装新</a></dt>
						<dd class="orange">￥120 ~ ￥150</dd>
					</dl>
				</li> -->
				
			</ul>
		</div>
		
		<h2 class="h2 h2_l mt"><em title="商家精选">商家精选</em><cite></cite></h2>
		<img src="/res/img/pic/ad200x75.jpg" alt="" />
	</div>
	<div class="r wr">
		<!-- <h2 class="h2 h2_r rel"><samp></samp><em title="热卖推荐">&nbsp;&nbsp;&nbsp;热卖推荐</em></h2>
		<div class="box bg_white">
			<ul class="uls i_150x150 x4_150x150">
				<li>
					<a href="productDetail.jsp" title="富一代" target="_blank" class="pic"><img src="	/res/img/pic/ppp.jpg" alt="依琦莲2014瑜伽服套装新" /></a>
					<dl>
						<dt><a href="productDetail.jsp" title="依琦莲2014瑜伽服套装新" target="_blank">依琦莲2014瑜伽服套装新</a></dt>
						<dd class="h40">依琦莲2014瑜伽服套装新！</dd>
						<dd class="orange">￥120 ~ ￥150</dd>
						<dd><a href="productDetail.jsp" title="立即抢购" class="inb btn70x21 mr">立即抢购</a></dd>
					</dl>
				</li>
				
			</ul>
		</div> -->

		<h2 class="h2 h2_filter mt"><em title="商品筛选">商品筛选</em><cite>
			<a href="javascript:void(0);" id="filterRest" title="重置筛选条件" onclick="javascript:window.location.href='/product/display/list.shtml'">重置筛选条件</a></cite></h2>
			<ul class="uls filter">
				<c:if test="${ flag }">
					<li><label>已选条件：</label>
					<p class="sel">
						<c:forEach items="${map }" var="en">
						<a href="javascript:void(0);" >
						<em>${en.key}：${en.value }</em>
						<cite title="关闭此筛选条件" onclick="clear()">X</cite></a>
						</c:forEach>
						<a href="javascript:void(0)" onclick="javascript:window.location.href='/product/display/list.shtml'">清除筛选条件</a>
					</p>
					</li>
				</c:if>
				<c:if test="${!empty brands}">
				<li><b>品牌：</b><p>
					<a href="javascript:void(0);" title="不限" class="here">不限</a>
					<c:forEach items="${ brands}" var="brand">
						<a href="javascript:void(0);" title="${brand.name }" 
						onclick="javascript:window.location.href='/product/display/list.shtml?brandId=${brand.id }&brandName=${brand.name }&typeId=${typeId }&typeName=${typeName }&featureName=${featureName}&featureId=${featureId }'">${brand.name }</a>
					</c:forEach>
				</p></li>
				</c:if>
				<!-- <li><b>价格：</b><p>
					<a href="javascript:void(0);" title="不限" class="here">不限</a>
					<a href="javascript:void(0);" title="1-99">0-79</a>
					<a href="javascript:void(0);" title="100-199">80-199</a>
					<a href="javascript:void(0);" title="200-499">200-299</a>
					<a href="javascript:void(0);" title="200-499">300-499</a>
					<a href="javascript:void(0);" title="200-499">500-599</a>
					<a href="javascript:void(0);" title="200-499">600以上</a>
				</p></li> -->
				<c:if test="${!empty types }">
					<li><b>类型：</b><p>
						<a href="javascript:void(0);" title="不限" class="here">不限</a>
						<c:forEach items="${ types}" var="type">
							<a href="javascript:void(0);" title="${type.name }"
							onclick="javascript:window.location.href='/product/display/list.shtml?brandId=${brandId }&brandName=${brandName }&typeId=${type.id }&typeName=${type.name }&featureName=${featureName }&featureId=${featureId }'">${type.name }</a>
						</c:forEach>
						
					</p></li>
				</c:if>
				<c:if test="${!empty features }">
				<li><b>材质：</b><p>
					<a href="javascript:void(0);" title="不限" class="here">不限</a>	
					<!-- <span><a href="javascript:void(0);" title="环保人棉">环保人棉</a></span> -->
					<c:forEach items="${features }" var="feature">
						<%-- <span><a href="javascript:void(0);" title="${f.name }">${f.name }</a></span> --%>
						
						<a href="/product/display/list.shtml?
							brandId=${brandId }&brandName=${brandName }&typeId=${typeId }&typeName=${typeName }&featureName=${feature.name }&featureId=${feature.id}" title="${feature.name }"
							onclick="javascript:">${feature.name }</a>
					</c:forEach>
				</p>
				</li>
				</c:if>
				<!-- <li><b>适用人群：</b><p>
					<a href="javascript:void(0);" title="不限" class="here">不限</a>
					<a href="javascript:void(0);" title="男士">男士</a>
					<a href="javascript:void(0);" title="女士">女士</a>
					<a href="javascript:void(0);" title="儿童">儿童</a>
					<a href="javascript:void(0);" title="中性">中性</a>
				</p></li> -->
			</ul>
			<div class="sort_type">
				<a href="javascript:void(0);" title="销量" class="sales">销量</a>
				<a href="javascript:void(0);" title="价格" class="price">价格</a>
				<a href="javascript:void(0);" title="上架时间" class="time">上架时间</a>
			</div>
			<div class="mt ofc">
				<ul class="uls i_150x150 x4_150x150b">
				<c:forEach items="${ pagination.list}" var="product">
					<li>
						<a href="javascript:void(0);" title="${product.name }" target="_blank" class="pic" 
						onclick="window.open('/product/detail.shtml?productId=${product.id}')">
						<img src="${product.img.url }" alt="${product.name }" /></a>
						<dl>
							<!-- dt 10个文字+... -->
							<dt><a href="javascript:void(0);" title="${product.name }" target="_blank"
							onclick="window.open('/product/detail.shtml?productId=${product.id}')">${product.name }</a></dt>
							<!-- dt 25个文字+... -->
							<%-- <dd class="h40">${product.name }</dd> --%>
							<!-- <dd class="orange">￥128.00</dd>
							<dd>北京有货</dd> -->
							<!-- <dd><a href="#" title="加入购物车" class="inb btn70x21 mr">加入购物车</a></dd> -->
						</dl>
						<img src="/res/img/pic/hot.gif" alt="热门" class="type" />
					</li>
				</c:forEach>
				</ul>
			<div class="page pb15">
				<span class="r inb_a page_b">
					<c:forEach items="${ pagination.pageView}" var="page">
						${page }
					</c:forEach>
				</span>
			</div>
	</div>
</div>
</div>
<div class="mode">
	<div class="tl"></div><div class="tr"></div>
	<ul class="uls">
		<li class="first">
			<span class="guide"></span>
			<dl>
			<dt title="购物指南">购物指南</dt>
			<dd><a href="#" title="购物流程">购物流程</a></dd>
			<dd><a href="#" title="购物流程">购物流程</a></dd>
			<dd><a href="#" target="_blank" title="联系客服">联系客服</a></dd>
			<dd><a href="#" target="_blank" title="联系客服">联系客服</a></dd>
			</dl>
		</li>
		<li>
			<span class="way"></span>
			<dl>
			<dt title="支付方式">支付方式</dt>
			<dd><a href="#" title="货到付款">货到付款</a></dd>
			<dd><a href="#" title="在线支付">在线支付</a></dd>
			<dd><a href="#" title="分期付款">分期付款</a></dd>
			<dd><a href="#" title="分期付款">分期付款</a></dd>
			</dl>
		</li>
		<li>
			<span class="help"></span>
			<dl>
			<dt title="配送方式">配送方式</dt>
			<dd><a href="#" title="上门自提">上门自提</a></dd>
			<dd><a href="#" title="上门自提">上门自提</a></dd>
			<dd><a href="#" title="上门自提">上门自提</a></dd>
			<dd><a href="#" title="上门自提">上门自提</a></dd>
			</dl>
		</li>
		<li>
			<span class="service"></span>
			<dl>
			<dt title="售后服务">售后服务</dt>
			<dd><a href="#" target="_blank" title="售后策略">售后策略</a></dd>
			<dd><a href="#" target="_blank" title="售后策略">售后策略</a></dd>
			<dd><a href="#" target="_blank" title="售后策略">售后策略</a></dd>
			<dd><a href="#" target="_blank" title="售后策略">售后策略</a></dd>
			</dl>
		</li>
		<li>
			<span class="problem"></span>
			<dl>
			<dt title="特色服务">特色服务</dt>
			<dd><a href="#" target="_blank" title="夺宝岛">夺宝岛</a></dd>
			<dd><a href="#" target="_blank" title="夺宝岛">夺宝岛</a></dd>
			<dd><a href="#" target="_blank" title="夺宝岛">夺宝岛</a></dd>
			<dd><a href="#" target="_blank" title="夺宝岛">夺宝岛</a></dd>
			</dl>
		</li>
	</ul>
</div>
</body>
<script type="text/javascript">
	function clear(){
	alert("aaaaaa");
}
</script>
</html>