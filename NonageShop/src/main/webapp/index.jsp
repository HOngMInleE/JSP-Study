<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../header.jsp" %>

	<div class="clear"></div>
	
	<div id="main_img">
		<img src="images/main_img.jpg">
	</div>
	
	<div class="clear"></div>
	
	<div id="front">
		<h2>New Item</h2>
		<div id="bestProduct">
			<c:forEach var="productVO" items="${newProductList}"> <!-- var:지역변수 -->
				<div id="item">
					<a href="NonageServlet?command=product_detail&pseq=${productVO.pseq}">
						<img alt="상품 사진" src="product_images/${productVO.image}">
						<h3>${productVO.name }</h3>
						<p>${productVO.price2 }</p> <!--  DB에 저장된 컬럼명이 price2이다. -->
					</a>		
				</div>	
			</c:forEach>	
		</div>
		
		<div class="clear"></div> <!-- 빈 공간 생성 -->	
		
		<h2>Best Item</h2>
		<div id="bestProduct">
			<c:forEach var="productVO" items="${bestProductList}">
				<div id="item">
					<a href="NonageServlet?command=product_detail&pseq=${productVO.pseq}">
						<img alt="상품 사진" src="product_images/${productVO.image}">
						<h3>${productVO.name }</h3>
						<p>${productVO.price2 }</p>
					</a>		
				</div>	
			</c:forEach>	
		</div>
		
		<div class="clear"></div>
	</div>
<%@ include file="../footer.jsp" %>