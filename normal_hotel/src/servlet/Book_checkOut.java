package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mysql.DataDAO;
/**
 * Servlet implementation class Book_checkOut
 */
@WebServlet("/checkOut.do")
public class Book_checkOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Book_checkOut() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		String str_record_num=request.getParameter("recor_num");
		String room_id=request.getParameter("room_id");
		int record_num=Integer.valueOf(str_record_num);
		DataDAO ddao=new DataDAO("hotel","book_info");
		String set="book_state='预订取消'";
		String where="record_num="+record_num+"";
		ddao.update(set,where);
		ddao=new DataDAO("hotel","room_info");
		set="room_state=0";
		where="room_id='"+room_id+"'";
		ddao.update(set,where);
		response.sendRedirect("./record.view");
	}

}
