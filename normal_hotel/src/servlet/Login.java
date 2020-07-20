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
import service.Service_search;
import service.Service_setSingle;
/**
 * Servlet implementation class Login
 */
@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String inputEmail=request.getParameter("inputEmail");
		String inputPwd=request.getParameter("inputPwd");
		DataList infodl=new DataList();
		String result_type="登录";
		boolean mark=true;
		Service_login s_l=new Service_login("hotel","member");
		
		if(s_l.isInvalidAccount("m_email",inputEmail))
		{
			mark=false;
			String backpath="./login_in.jsp";
			infodl.add("没有找到邮箱地址");
			session.setAttribute("result_type",result_type);
			session.setAttribute("result_mark",mark);
			session.setAttribute("result_fail",infodl);
			session.setAttribute("backpath",backpath);
			response.sendRedirect("./login/login_result.jsp");
		}
		else {
			if(s_l.isPwdMatch("m_email",inputEmail,inputPwd,5))
			{
				Service_setSingle sss=new Service_setSingle();
				sss.set_Member(inputEmail,session);
				session.setAttribute("result_type",result_type);
				session.setAttribute("result_mark",mark);
				response.sendRedirect("./record.view?passtype=user");
			}
			else
			{
				mark=false;
				String backpath="./login_in.jsp";
				infodl.add("密码与邮箱不匹配，输入密码错误");
				session.setAttribute("result_type",result_type);
				session.setAttribute("result_mark",mark);
				session.setAttribute("result_fail",infodl);
				session.setAttribute("backpath",backpath);
				response.sendRedirect("./login/login_result.jsp");
			}
		}
	}

}
