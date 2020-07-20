package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel_data.DataList;
import dao.MemberDAO;
import service.Service_login;
import service.Service_general;
import service.Service_password;
import service.Service_search;
/**
 * Servlet implementation class Register
 */
@WebServlet("/register.do")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		String inputPwd2=request.getParameter("inputPwd2");
		String inputPapper=request.getParameter("inputPapper");
		String realName=request.getParameter("realName");
		String sex=request.getParameter("sex");
		String address=request.getParameter("address");
		DataList infodl=new DataList();
		String result_type="注册";
		Service_login ss=new Service_login("hotel","member");
		boolean mark=true;
		if(isInvalidEmail(inputEmail))
		{
			infodl.add("邮箱输入格式不正确。");
		}
		if(!(ss.isInvalidAccount("m_email",inputEmail)))
		{
			infodl.add("邮箱已经被注册了");
		}
		if(isInvalidPassword(inputPwd,inputPwd2))
		{
			infodl.add("输入密码格式不正确\n（要求密码在6位到16位之间，且两次输入密码必须一致。）");
		}
		if(isInvalidPapper(inputPapper))
		{
			infodl.add("输入的身份证号码位数不正确（必须等于18位）");
		}
		if(!(ss.isInvalidAccount("m_paper",inputPapper)))
		{
			infodl.add("身份证号码已被注册");
		}
		if(infodl.getLength()>0)
		{
			mark=false;
			String backpath="./register.jsp";
			session.setAttribute("result_type",result_type);
			session.setAttribute("result_mark",mark);
			session.setAttribute("result_fail",infodl);
			session.setAttribute("backpath",backpath);
			response.sendRedirect("./login/login_result.jsp");
		}
		else
		{
			Service_general sd=new Service_general();
			Date date=sd.getNowDate();
			Service_search ssearch=new Service_search();
			int lastrecord= ssearch.get_last_row_num("hotel","member")+1;
			MemberDAO mdao=new MemberDAO();
			Service_password sp=new Service_password();
			String changePwd=sp.lockOn(inputPwd);
			mdao.insert_into(lastrecord,realName,sex,date,changePwd,inputEmail,address,inputPapper);
			String backpath="./login_in.jsp";
			session.setAttribute("backpath",backpath);
			session.setAttribute("result_type",result_type);
			session.setAttribute("result_mark",mark);
			response.sendRedirect("./login/login_result.jsp");
		}
		
	}
	private boolean isInvalidEmail(String inputEmail)
	{
		return inputEmail==null||!inputEmail.matches("[a-zA-Z0-9_]+@[0-9a-z]+(\\.[a-z]+)+"); 
	}
    private boolean isInvalidPassword(String inputPwd,String inputPwd2)
    {
    	return inputPwd==null||inputPwd.length()<6||inputPwd.length()>16||!inputPwd.equals(inputPwd2);
    }
    private boolean isInvalidPapper(String inputPapper)
    {
    	return inputPapper==null || inputPapper.length()!=18;
    }
}
