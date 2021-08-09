package comtroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDAO;
import dto.MovieVO;

@WebServlet("/movieList.do")
public class MovieListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		MovieDAO mDao = MovieDAO.getinstance(); // DAO 객체 생성.
		ArrayList<MovieVO> movieList = mDao.selectAllMovies(); // VO객체 생성 후 메소드 대입.
		
		// 페이지 이동시에 사라지지않게 request객체에 데이터 저장.
				request.setAttribute("movieList", movieList);
		
		RequestDispatcher rd = request.getRequestDispatcher("movie_product/MovieList.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
