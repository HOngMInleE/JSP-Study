package com.saeyan.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saeyan.dao.ProductDAO;
import com.saeyan.dto.ProductVO;

@WebServlet("/productList.do")
public class ProductListservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductDAO pDao = ProductDAO.getInstance();
		
		List<ProductVO> productList = pDao.selectAllProducts();
	// 페이지 이동시에 사라지지않게 저장할 request객체에 저장.
		request.setAttribute("productList", productList);
		
	// 데이터 받은채로 페이지 이동
		RequestDispatcher rd = request.getRequestDispatcher("product/productList.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
