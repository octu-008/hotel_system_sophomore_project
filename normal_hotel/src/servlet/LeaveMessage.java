package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MessageDAO;
import mysql.DataDAO;
import service.Service_search;
import hotel_data.DataList;
import hotel_data.Member;
/**
 * Servlet implementation class LeaveMessage
 */
@WebServlet("/leaveMessage.do")
public class LeaveMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LeaveMessage() {
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
		Member m=(Member) session.getAttribute("member");//获取用户姓名
		String message=request.getParameter("message");//获取用户留言内容
	    String contact=request.getParameter("contact");//获取用户提供的联系方式
	    DataList infodl=new DataList();
	    boolean mark=true;
	    String result_type="留言";
	    if(message.length()>255)//检测留言是否超过255字
	    {
	    	//跳转到出错提示页面
	    	infodl.add("抱歉，留言不能超过255字");
	    	mark=false;
	    	String backpath="./user_leave_message.jsp";
	    	session.setAttribute("result_type",result_type);
	    	session.setAttribute("result_mark",mark);
	    	session.setAttribute("result_fail",infodl);
	    	session.setAttribute("backpath",backpath);
	    	response.sendRedirect("./user/user_result.jsp");
	    }
	    else
	    {
	    	//留言成功并跳转
	    	Service_search ss=new Service_search();
	    	int lastrecord=ss.get_last_row_num("hotel","message")+1;
	    	MessageDAO msdao=new MessageDAO();
	    	msdao.insert_into(lastrecord,m.getM_name(),contact,message);
	    	String backpath="./user_leave_message.jsp";
	    	session.setAttribute("result_type",result_type);
	    	session.setAttribute("result_mark",mark);
	    	session.setAttribute("backpath",backpath);
	        response.sendRedirect("./user/user_result.jsp");
	    }
	}
}
