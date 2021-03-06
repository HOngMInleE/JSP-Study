package com.nonage.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nonage.dao.ProductDAO;
import com.nonage.dto.ProductVO;

public class ProductDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "/product/ProductDetail.jsp";
		
		String pseq = request.getParameter("pseq");
		ProductDAO productDAO = ProductDAO.getInstance();
		ProductVO productVO = productDAO.getProduct(pseq);
		
		request.setAttribute("productVO", productVO);
		
		RequestDispatcher dispacher = request.getRequestDispatcher(url);
		dispacher.forward(request, response);
		
	}
	
	

}
