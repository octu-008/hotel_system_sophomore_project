package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel_data.DataList;
import service.Service_login;
import service.Service_setSingle;
/**
 * Servlet implementation class Admin_Login
 */
@WebServlet("/adminLogin.do")
public class Admin_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin_Login() {
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
	    String inputName=request.getParameter("inputName");
	    String inputPwd=request.getParameter("inputPwd");
	    DataList infodl=new DataList();
		String result_type="管理员登录";
		boolean mark=true;
		Service_login sl=new Service_login("hotel","admin");
	    if(sl.isInvalidAccount("admin_name",inputName))
	    {
	    	mark=false;
	    	infodl.add("没有找到该管理员名称");
	    	String backpath="./admin_login.jsp";
			session.setAttribute("result_type",result_type);
			session.setAttribute("result_mark",mark);
	    	session.setAttribute("result_fail",infodl);
	    	session.setAttribute("backpath",backpath);
	    	response.sendRedirect("./login/login_result.jsp");
	    }
	    else
	    {
	    	if(sl.isPwdMatch("admin_name",inputName,inputPwd,3))
	    	{
	    		Service_setSingle sss=new Service_setSingle();
	    		sss.set_Admin(inputName,session);
	    		response.sendRedirect("./admin/admin_menu.jsp");
	    	}
	    	else
	    	{
	    		mark=false;
	    		String backpath="./admin_login.jsp";
	    		infodl.add("密码与名称不匹配，输入密码错误");
				session.setAttribute("result_type",result_type);
				session.setAttribute("result_mark",mark);
	    		session.setAttribute("result_fail",infodl);
	    		session.setAttribute("backpath",backpath);
	    		response.sendRedirect("./login/login_result.jsp");
	    	}
	    }
	}

}
