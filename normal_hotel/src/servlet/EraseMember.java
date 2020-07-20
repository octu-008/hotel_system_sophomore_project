package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel_data.DataList;
import mysql.DataDAO;
import service.Service_search;

/**
 * Servlet implementation class EraseMember
 */
@WebServlet("/member.e")
public class EraseMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EraseMember() {
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
		String m_name=request.getParameter("m_name");//获取要删除会员的姓名
		String m_paper=request.getParameter("m_paper");//获取要删除会员的证件
		String m_email=request.getParameter("m_email");//获取要删除会员的邮箱
		Service_search ss=new Service_search();
		//查找符合条件会员的sql语句
		String con="where m_name='"+m_name+"' and m_paper='"+m_paper+"' and m_email='"+m_email+"'";
		//进行查找
		DataList rls=ss.search_Member(con);
		DataList result_fail=new DataList();
		String resut_type="删除会员"+m_name;
		if(rls.getLength()!=0)//搜索记录不为0，即证明有对应记录，可以进行删除
		{
			//按照条件删除对于会员记录
			DataDAO ddao=new DataDAO("hotel","member");
			ddao.delete(con);
			//删除成功后跳转页面
			session.setAttribute("result_mark",true);
	    	session.setAttribute("result_type",resut_type);
	    	session.setAttribute("backpath","../data.view?table=member");
	    	response.sendRedirect("./admin/admin_result.jsp");
			
		}
		else
		{
			result_fail.add("未找到对应会员，请再次确认信息");
			session.setAttribute("result_fail",result_fail);
    		session.setAttribute("result_mark",false);
	    	session.setAttribute("result_type",resut_type);
	    	session.setAttribute("backpath","../data.view?table=member");
	    	response.sendRedirect("./admin/admin_result.jsp");
		}
	}

}
