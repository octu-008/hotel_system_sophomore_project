package servlet;

import java.io.IOException;
import java.util.Date;

import dao.Room_infoDAO;
import hotel_data.DataList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.Service_general;
import service.Service_setSingle;
/**
 * Servlet implementation class PreBook
 */
@WebServlet("/preBook.view")
public class PreBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PreBook() {
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
		String roomtype=request.getParameter("roomtype");
		String i_year=request.getParameter("i_year");
		String i_month=request.getParameter("i_month");
		String i_day=request.getParameter("i_day");
		String q_year=request.getParameter("q_year");
		String q_month=request.getParameter("q_month");
		String q_day=request.getParameter("q_day");
		String num=request.getParameter("num");
		DataList infodl=new DataList();
		String result_type="预订房间";
		boolean mark=true;
		Room_infoDAO rifdao=new Room_infoDAO();
		int realnum=rifdao.count_room(roomtype,0);
		try {
			Service_general sg=new Service_general();
		Date i_date=sg.strtoDate(i_year,i_month,i_day);
		Date q_date=sg.strtoDate(q_year,q_month,q_day);
		long days=(q_date.getTime()-i_date.getTime())/(24*60*60*1000);
		boolean before=i_date.before(q_date);
		if(before)//预订日期是否出错
		{
			if(realnum < Integer.parseInt(num))//房间数量是否满足
			{
				//跳转到出错提示页面
				mark=false;
				infodl.add("房间数量不足。");
				String backpath="./user_room_info.jsp";
				session.setAttribute("result_type",result_type);
				session.setAttribute("result_mark",mark);
				session.setAttribute("result_fail",infodl);
				session.setAttribute("backpath",backpath);
				response.sendRedirect("./user/user_result.jsp");
			}
			else
			{
				//跳转到确认预订页面
				Service_setSingle sss=new Service_setSingle();
				sss.set_Room_detail(roomtype,session);
				session.setAttribute("roomtype",roomtype);
				session.setAttribute("i_date",i_date);
				session.setAttribute("q_date",q_date);
				session.setAttribute("days",days);
				session.setAttribute("num",num);
				response.sendRedirect("./user/user_book_rooms.jsp");
			}
		}
		else
		{
			mark=false;
			infodl.add("日期选定出错");
			String backpath="./user_room_info.jsp";
			session.setAttribute("result_type",result_type);
			session.setAttribute("result_mark",mark);
			session.setAttribute("result_fail",infodl);
			session.setAttribute("backpath",backpath);
			response.sendRedirect("./user/user_result.jsp");
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
