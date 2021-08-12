package com.nonage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.nonage.dto.ProductVO;

import util.DBManager;

public class ProductDAO {

	private static ProductDAO instance = new ProductDAO();
	
	private ProductDAO() {
	}
	
	public static ProductDAO getInstance() {
		return instance;
	}
	
	
	public ArrayList<ProductVO> listNewProduct() {
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		String sql = "select * from NEW_PRO_VIEW";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductVO product = new ProductVO(); // 불러온 데이터 저장할 VO객체 생성
				product.setPseq(rs.getInt("pseq")); // DB에서 불러와 VO에 저장
				product.setName(rs.getString("name"));
				product.setPrice2(rs.getInt("price2"));
				product.setImage(rs.getString("image"));
				productList.add(product); // List에 VO 객체 저장
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return productList;
	}// listNewProduct()
	
	public ArrayList<ProductVO> listBestProduct() {
		ArrayList<ProductVO> productList = new ArrayList<ProductVO>();
		String sql = "select * from BEST_PRO_VIEW";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setPseq(rs.getInt("pseq"));
				product.setName(rs.getString("name"));
				product.setPrice2(rs.getInt("price2"));
				product.setImage(rs.getString("image"));
				productList.add(product);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, pstmt, rs);
		}
		return productList;
	}// listBestProduct() / listNewProduct()와 동일
	
	
	
	
	
	
	
	
}//publicDAO end
