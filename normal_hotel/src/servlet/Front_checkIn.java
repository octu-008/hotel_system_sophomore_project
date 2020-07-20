package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Checkin_info;
import hotel_data.DataList;
import hotel_data.Room_detail;
import hotel_data.Room_info;
import mysql.DataDAO;
import service.Service_general;
import service.Service_search;

/**
 * Servlet implementation class Front_checkIn
 */
@WebServlet("/checkIn.front")
public class Front_checkIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Front_checkIn() {
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
		String resut_type="入住登记";
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
			long l_days=(q_date.getTime()-i_date.getTime() )/(24*60*60*1000);
        	int days=(int)l_days;
        	double deposit=getDeposit(roomId,i_date,q_date,l_days);
        	Checkin_info cidao=new Checkin_info();
           	Service_search ss=new Service_search();
        	int rows=ss.get_row("hotel","checkin_info")+1;
        	cidao.insert_into(rows,roomId,mainName,mainPapper,i_date,days,deposit,"入住中");
    		
        	DataDAO ddao=new DataDAO("hotel","room_info");
			String where="room_id='"+roomId+"'";
			ddao.update("room_state='-1'",where);
			
        	session.setAttribute("result_mark",true);
	    	session.setAttribute("result_type",resut_type);
	    	session.setAttribute("backpath","../data.view?table=checkin_info");
	    	response.sendRedirect("./admin/admin_result.jsp");
		}
		else
		{
			session.setAttribute("result_fail",result_fail);
    		session.setAttribute("result_mark",false);
	    	session.setAttribute("result_type",resut_type);
	    	session.setAttribute("backpath","../data.view?table=checkin_info");
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
	  public double getDeposit(String room_id,Date i_date,Date q_date, long l_days)
	  {
		  double deposit=0.0;
		  String type=room_id.substring(0,3);
      	String cond="where type='"+type+"'";
    	Service_search ss=new Service_search();
      	DataList rls=ss.search_Room_detail(cond);
      	Room_detail rd=(Room_detail)rls.getList()[0];
        double price=rd.getPrice();
    	deposit=price*l_days*0.4;
    	deposit=(double)Math.round(deposit*100)/100;
		  return deposit;
	  }
}
