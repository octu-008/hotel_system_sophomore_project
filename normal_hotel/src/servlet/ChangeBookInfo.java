package servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import javax.servlet.http.HttpSession;
import mysql.DataDAO;
import service.Service_search;
import hotel_data.DataList;
import hotel_data.Room_detail;
import hotel_data.Book_info;
import dao.Checkin_info;
/**
 * Servlet implementation class ChangeBookInfo
 */
@WebServlet("/book_info.change")
public class ChangeBookInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeBookInfo() {
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
		String function=request.getParameter("function");
	    String strRecord_num=request.getParameter("record_num");
	    HttpSession session=request.getSession();
	    DataList result_fail=new DataList();
	    String resut_type="预订编号#"+strRecord_num;
	    if(isNum(strRecord_num))
	    {
	    	int record_num=Integer.valueOf(strRecord_num);
	    	if(function.equals("confirm"))
		    {
		    	resut_type+="确认入住";
		    	if(changeConfirm(record_num)) {
		    	session.setAttribute("result_mark",true);
		    	session.setAttribute("result_type",resut_type);
		    	session.setAttribute("backpath","../data.view?table=book_info");
		    	response.sendRedirect("./admin/admin_result.jsp");
		    	}
		    	else
		    	{
		    		result_fail.add("输入预订编号有误(编号不存在或编号状态不为预定中)");
		    		session.setAttribute("result_fail",result_fail);
		    		session.setAttribute("result_mark",false);
			    	session.setAttribute("result_type",resut_type);
			    	session.setAttribute("backpath","../data.view?table=book_info");
			    	response.sendRedirect("./admin/admin_result.jsp");
		    	}
		    	}
		    else if(function.equals("overdue"))
		    {
		    	resut_type+="取消";
		    	if(changeOverdue(record_num)) {
			    session.setAttribute("result_mark",true);
		    	session.setAttribute("result_type",resut_type);
		    	session.setAttribute("backpath","../data.view?table=book_info");
		    	response.sendRedirect("./admin/admin_result.jsp");
		    	}
		    	else
		    	{
		    		result_fail.add("输入预订编号有误(编号不存在或编号状态不为预定中)");
		    		session.setAttribute("result_fail",result_fail);
		    		session.setAttribute("result_mark",false);
			    	session.setAttribute("result_type",resut_type);
			    	session.setAttribute("backpath","../data.view?table=book_info");
			    	response.sendRedirect("./admin/admin_result.jsp");
		    	}
		    	}
	    }
	    else
	    {
	    	result_fail.add("输入预订编号有误(编号不存在或编号状态不为预定中)");
    		session.setAttribute("result_fail",result_fail);
    		session.setAttribute("result_mark",false);
	    	session.setAttribute("result_type",resut_type);
	    	session.setAttribute("backpath","../data.view?table=book_info");
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
    public boolean changeConfirm(int record_num)
    {   
        boolean mark=false;
	    String where="record_num="+record_num;
	    String cond_where="where "+where;
    	Service_search ss=new Service_search();
    	DataList rls=ss.search_Book_info(cond_where);
    	if(rls.getLength()!=0)
    	{
    	Book_info bifo=(Book_info)rls.getList()[0];
    	
    	if(bifo.getBook_state().equals("预订中")) 
    	{
    		//确认预订记录状态为预订中时即可进行下列操作
    		DataDAO ddao=new DataDAO("hotel","book_info");
        	String set="book_state='确认入住'";
        	ddao.update(set,where);
        	String room_id=bifo.getRoom_id();
        	ddao=new DataDAO("hotel","room_info");
        	set="room_state=-1";
        	where="room_id='"+room_id+"'";
        	ddao.update(set,where);
        	String type=room_id.substring(0,3);
        	String cond="where type='"+type+"'";
        	rls=ss.search_Room_detail(cond);
        	Room_detail rd=(Room_detail)rls.getList()[0];
            double price=rd.getPrice();
            long l_days=(bifo.getBook_quit_time().getTime()-bifo.getBook_in_time().getTime() )/(24*60*60*1000);
        	int days=(int)l_days;
            double deposit=price*l_days*0.4;
        	deposit=(double)Math.round(deposit*100)/100;
            int rows=ss.get_row("hotel","checkin_info")+1;
            //上述均为了从预订记录中提取创建入住记录所需要的信息
            //下方即是创建入住记录的代码，将新的记录插入到数据库的表中
        	Checkin_info cidao=new Checkin_info();
        	cidao.insert_into(rows,bifo.getRoom_id(),bifo.getC_name(),bifo.getC_paper(),bifo.getBook_in_time(),days,deposit,"入住中");
    	    mark=true;
    	}
    	}
    	return mark;
    }
    public boolean changeOverdue(int record_num)
    {   
    	boolean mark=false;
    	String where="record_num="+record_num;
    	String cond_where="where "+where;
    	Service_search ss=new Service_search();
    	DataList rls=ss.search_Book_info(cond_where);
    	if(rls.getLength()!=0)
    	{
    	Book_info bifo=(Book_info)rls.getList()[0];
    	if(bifo.getBook_state().equals("预订中")) {
    		DataDAO ddao=new DataDAO("hotel","book_info");
        	String set="book_state='过期/取消'";
        	ddao.update(set,where);
        	String room_id=bifo.getRoom_id();
        	ddao=new DataDAO("hotel","room_info");
        	set="room_state=0";
        	where="room_id='"+room_id+"'";
        	ddao.update(set,where);	
        	mark=true;
    	}
    	}
    	return mark;
    }
}
