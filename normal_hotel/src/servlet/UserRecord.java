package servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import hotel_data.Bill;

import hotel_data.DataList;
import hotel_data.Member;

import service.Service_search;
import service.Service_setSingle;
/**
 * Servlet implementation class UserRecord
 */
@WebServlet("/record.view")
public class UserRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRecord() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession();
		Member member=(Member)session.getAttribute("member");
		String passtype=request.getParameter("passtype");
		String name=member.getM_name();
		Service_search ss=new Service_search();
		String cond="where c_name like '"+name+"%'";
		DataList bookRecord=ss.search("book_info",cond);
		DataList historyRecord=ss.search("bill",cond);
		double totalprice=0.0;
		Object[] objs=historyRecord.getList();
		int length=historyRecord.getLength();
		Bill[] tbs=new Bill[length];
		Service_setSingle sss=new Service_setSingle();
		sss.set_Latest_notice(session);
	    for(int j=0;j<length;j++)
	    {
	    	tbs[j]=new Bill();
	    	tbs[j]=(Bill)objs[j];
	    }
	    for(Bill tb:tbs)
	    {
	    	totalprice+=tb.getCost();
	    }
		totalprice=(double)Math.round(totalprice*100)/100;
		session.setAttribute("bookRecord",bookRecord);
		session.setAttribute("historyRecord",historyRecord);
		session.setAttribute("totalPrice",totalprice);
		if(passtype.equals("record"))
		{
		response.sendRedirect("./user/user_record.jsp");
		}
		else if(passtype.equals("user"))
		{
			response.sendRedirect("./user/user_home.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
