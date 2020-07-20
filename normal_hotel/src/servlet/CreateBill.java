package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel_data.Book_info;
import hotel_data.Checkin_info;
import hotel_data.DataList;
import mysql.DataDAO;
import service.Service_general;
import service.Service_search;
import dao.BillDAO;
/**
 * Servlet implementation class CreateBill
 */
@WebServlet("/billcreate.do")
public class CreateBill extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateBill() {
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
		String function=request.getParameter("function");
		 String strRecord=request.getParameter("record");
		 String customerType=request.getParameter("customerType");
		 String resut_type="入住记录编号#"+strRecord;
		 if(isNum(strRecord))
		 {
			 if(customerType.equals("#"))
			 {
				 resut_type+="操作";
				 DataList result_fail=new DataList();
				 result_fail.add("没有选择客户类型");
				 session.setAttribute("result_fail",result_fail);
				 session.setAttribute("result_mark",false);
				 session.setAttribute("result_type",resut_type);
				 session.setAttribute("backpath","../data.view?table=checkin_info");
				 response.sendRedirect("./admin/admin_result.jsp");
			 }
			 else 
			 {
			 int record=0;	
			 record=Integer.valueOf(strRecord);
			 if(function.equals("confirm"))
			 {
				 resut_type+="创建账单";
				 if(changeConfirm(record,customerType)) {
				 session.setAttribute("result_mark",true);
				 session.setAttribute("result_type",resut_type);
				 session.setAttribute("backpath","../data.view?table=checkin_info");
				 response.sendRedirect("./admin/admin_result.jsp");
				 }
				 else
				 {
					 DataList result_fail=new DataList();
					 result_fail.add("输入预订编号有误(编号不存在或编号状态不为预定中)");
					 session.setAttribute("result_fail",result_fail);
					 session.setAttribute("result_mark",false);
					 session.setAttribute("result_type",resut_type);
					 session.setAttribute("backpath","../data.view?table=checkin_info");
					 response.sendRedirect("./admin/admin_result.jsp");
				 }
			 }
			 else if(function.equals("quit"))
			 {
				 resut_type+="中途退房";
				 Service_general sg=new Service_general();
				 Date quitTime=sg.getNowDate();
				 if(changeQuit(record,quitTime,customerType))
				 {
					 session.setAttribute("result_mark",true);
					 session.setAttribute("result_type",resut_type);
					 session.setAttribute("backpath","../data.view?table=checkin_info");
					 response.sendRedirect("./admin/admin_result.jsp");
				 }
				 else
				 {
					 DataList result_fail=new DataList();
					 result_fail.add("输入预订编号有误(编号不存在或编号状态不为预定中)");
					 session.setAttribute("result_fail",result_fail);
					 session.setAttribute("result_mark",false);
					 session.setAttribute("result_type",resut_type);
					 session.setAttribute("backpath","../data.view?table=checkin_info");
					 response.sendRedirect("./admin/admin_result.jsp");
				 }
			 }
			 }
		 }
		 else
		 {
			 DataList result_fail=new DataList();
			 result_fail.add("输入预订编号有误(编号不存在或编号状态不为预定中)");
			 session.setAttribute("result_fail",result_fail);
			 session.setAttribute("result_mark",false);
			 session.setAttribute("result_type",resut_type);
			 session.setAttribute("backpath","../data.view?table=checkin_info");
			 response.sendRedirect("./admin/admin_result.jsp");
		 }

	}
	public boolean isNum(String resut_type)
	{
		boolean mark=false;
		if(resut_type.matches("[1-9][0-9]*"))
		{
			mark=true;
		}
		return mark;
	}
	public boolean changeConfirm(int record,String customerType)
	{
		boolean mark=false;
		String where="record="+record;
		String cond_where="where "+where;
		Service_search ss=new Service_search();
		DataList rls=ss.search_Checkin_info(cond_where);
		if(rls.getLength()!=0)
    	{
		Checkin_info cifo=(Checkin_info)rls.getList()[0];
   
		if(cifo.getCi_state().equals("入住中"))
		{
			//确认入住状态无误后进行以下操作
			int custType=Integer.valueOf(customerType);
			DataDAO ddao=new DataDAO("hotel","Checkin_info");
			String set="ci_state='按时退房'";
			ddao.update(set,where);
			String room_id=cifo.getRoom_id();
			ddao=new DataDAO("hotel","room_info");
			set="room_state=0";
			where="room_id='"+room_id+"'";
			ddao.update(set,where);
			double cost=cifo.getCi_deposit()/0.4;
			cost=(double)Math.round(cost*100)/100;
			cond_where="where c_name='"+cifo.getC_name()+"' and room_id='"+cifo.getRoom_id()+"' and book_in_time='"+cifo.getCi_time()+"'";
			rls=ss.search_Book_info(cond_where);
			Book_info bifo=(Book_info)rls.getList()[0];
			Date quitTime=bifo.getBook_quit_time();
			//上述代码旨在从入住记录中获得新建账单要使用到信息
			//下面即是往数据库中账单表新建账单记录的代码
			BillDAO bdao=new BillDAO();
			int rows=ss.get_row("hotel","bill")+1;
			bdao.insert_into(rows,cifo.getC_name(),cifo.getC_paper(),cifo.getRoom_id(),cifo.getCi_time(),quitTime,custType,cifo.getCi_days(),cost);
		    mark=true;
		}
    	}
		return mark;
	}
	public boolean changeQuit(int record,Date quitTime,String customerType)
	{
		boolean mark=false;
		
		String where="record="+record;
		String cond_where="where "+where;
		Service_search ss=new Service_search();
		DataList rls=ss.search_Checkin_info(cond_where);
		if(rls.getLength()!=0)
    	{
		Checkin_info cifo=(Checkin_info)rls.getList()[0];
		if(cifo.getCi_state().equals("入住中"))
		{
			int custType=Integer.valueOf(customerType);
			DataDAO ddao=new DataDAO("hotel","Checkin_info");
			String set="ci_state='中途退房'";
			ddao.update(set,where);
			String room_id=cifo.getRoom_id();
			ddao=new DataDAO("hotel","room_info");
			set="room_state=0";
			where="room_id='"+room_id+"'";
			ddao.update(set,where);			
			BillDAO bdao=new BillDAO();
			int rows=ss.get_row("hotel","bill")+1;
			bdao.insert_into(rows,cifo.getC_name(),cifo.getC_paper(),cifo.getRoom_id(),cifo.getCi_time(),quitTime,custType,cifo.getCi_days(),cifo.getCi_deposit());
		    mark=true;
		}
    	}
		return mark;
	}
}
