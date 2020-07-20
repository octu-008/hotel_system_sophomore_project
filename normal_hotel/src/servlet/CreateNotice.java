package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import hotel_data.Admin;
import hotel_data.DataList;
import service.Service_general;
import service.Service_search;
import dao.NoticeDAO;
/**
 * Servlet implementation class CreateNotice
 */
@WebServlet("/notice.create")
public class CreateNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateNotice() {
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
		String noticeContent=request.getParameter("noticeContent");
		HttpSession session=request.getSession();
	    DataList result_fail=new DataList();
	    if(noticeContent.length()>255)//判断通知是否大于255字
	    {
	    	//超出字数进入出错提示页面
	    	result_fail.add("通知内容不能超过255字。");
	    	session.setAttribute("result_mark",false);
		    session.setAttribute("result_type","发布通知");
	    	session.setAttribute("result_fail",result_fail);
	    	session.setAttribute("backpath","../data.view?table=notice");
		    response.sendRedirect("./admin/admin_result.jsp");
	    }
	    else
	    {
	    	//成功发布通知
			String tittle=request.getParameter("tittle");
			Admin admin=(Admin)session.getAttribute("admin");
			NoticeDAO ndao=new NoticeDAO();
			Service_search ss=new Service_search();
			int rows=ss.get_row("hotel","notice")+1;
			Service_general sd=new Service_general();
			Date date=sd.getNowDate();
		    ndao.insert_into(rows,tittle,admin.getAdmin_name(),noticeContent,date);//将通知插入到通知表中
		    //跳转到成功后的页面
		    session.setAttribute("result_mark",true);
		    session.setAttribute("backpath","../data.view?table=notice");
		    session.setAttribute("result_type","发布通知");
		    response.sendRedirect("./admin/admin_result.jsp");
	    }
	}

}
