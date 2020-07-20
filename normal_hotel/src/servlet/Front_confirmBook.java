package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mysql.DataDAO;
import dao.Book_infoDAO;
import hotel_data.DataList;
import hotel_data.Room_info;
import service.Service_general;
import service.Service_search;

/**
 * Servlet implementation class Front_confirmBook
 */
@WebServlet("/confirmBook.front")
public class Front_confirmBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Front_confirmBook() {
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
		String i_year=request.getParameter("i_year");
		String i_month=request.getParameter("i_month");
		String i_day=request.getParameter("i_day");
		String q_year=request.getParameter("q_year");
		String q_month=request.getParameter("q_month");
		String q_day=request.getParameter("q_day");
		String roomId=request.getParameter("roomId");
		String mainPapper=request.getParameter("mainPapper");
		String mainName=request.getParameter("mainName");
		String aibo_name_1=request.getParameter("aibo_name_1");
		String aibo_paper_1=request.getParameter("aibo_paper_1");
		String aibo_name_2=request.getParameter("aibo_name_2");
		String aibo_paper_2=request.getParameter("aibo_paper_2");
		String resut_type="预订";
		Service_general sg=new Service_general();
		Date i_date=sg.strtoDate(i_year,i_month,i_day);
		Date q_date=sg.strtoDate(q_year,q_month,q_day);
		DataList result_fail=new DataList();
		boolean before=i_date.before(q_date);
		if(!before)
		{
			result_fail.add("日期选择有误");
		}
		if(!isFreeRoom(roomId))
		{
			result_fail.add("输入房间号有误或对应房间状态不为空闲");
		}
		if(isInvalidPapper(mainPapper))
		{
			result_fail.add("联系人证件号码不符合规范（等于18位）");
		}
		if(result_fail.getLength()==0)
		{
			if(aibo_name_1!=null && (!aibo_name_1.equals("")) )
			{
				mainName=mainName+","+aibo_name_1;
			}
			if(aibo_name_2!=null && (!aibo_name_2.equals("")) )
			{
				mainName=mainName+","+aibo_name_2;
			}
			if(aibo_paper_1!=null && (!aibo_paper_1.equals("")) )
			{
				mainPapper=mainPapper+","+aibo_paper_1;
			}
			if(aibo_paper_2!=null && (!aibo_paper_2.equals("")) )
			{
				mainPapper=mainPapper+","+aibo_paper_2;
			}
           	Service_search ss=new Service_search();
			int record_num=ss.get_row("hotel","book_info")+1;
			
			Book_infoDAO bifdao=new Book_infoDAO();
			bifdao.insert_into(record_num,roomId,mainName,mainPapper,i_date,q_date,"预订中");
			
			DataDAO ddao=new DataDAO("hotel","room_info");
			String where="room_id='"+roomId+"'";
			ddao.update("room_state='1'",where);
			
			session.setAttribute("result_mark",true);
	    	session.setAttribute("result_type",resut_type);
	    	session.setAttribute("backpath","../data.view?table=book_info");
	    	response.sendRedirect("./admin/admin_result.jsp");
		}
		else
		{
			session.setAttribute("result_fail",result_fail);
    		session.setAttribute("result_mark",false);
	    	session.setAttribute("result_type",resut_type);
	    	session.setAttribute("backpath","../data.view?table=book_info");
	    	response.sendRedirect("./admin/admin_result.jsp");
		}
		
	}
    private boolean isInvalidPapper(String inputPapper)
    {
    	return inputPapper==null || inputPapper.length()!=18;
    }
    private boolean isFreeRoom(String roomId)
    {
    	boolean mark=false;
    	DataList infodl=new DataList();
		Service_search ss=new Service_search();
		String sql="where room_id='"+roomId+"'";
		infodl=ss.search_Room_info(sql);
		if(infodl.getLength()!=0)
		{
			Room_info rinfo=new Room_info();
			rinfo=(Room_info)infodl.getList()[0];
			if(rinfo.getRoom_state()==0)
			{
				mark=true;
			}
		}
    	return mark;
    }
}
