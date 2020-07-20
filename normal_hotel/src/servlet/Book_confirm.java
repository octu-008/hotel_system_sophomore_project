package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Room_infoDAO;
import hotel_data.DataList;
import mysql.DataDAO;
import dao.Book_infoDAO;
import dao.CustomerDAO;
import hotel_data.Member;
/**
 * Servlet implementation class Book_confirm
 */
@WebServlet("/bookConfirm.do")
public class Book_confirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Book_confirm() {
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
		String roomtype=(String)session.getAttribute("roomtype");
		Date i_date=(Date)session.getAttribute("i_date");
		Date q_date=(Date)session.getAttribute("q_date");
		String num=(String)session.getAttribute("num");
		int num_i=Integer.parseInt(num);
		String aibo_name_1=request.getParameter("aibo_name_1");
		String aibo_paper_1=request.getParameter("aibo_paper_1");
		
		String aibo_name_2=request.getParameter("aibo_name_2");
		String aibo_paper_2=request.getParameter("aibo_paper_2");
		
		String memo=request.getParameter("memo");
		
		Member member=(Member)session.getAttribute("member");
		String members=member.getM_name();
		if(aibo_name_1!=null && (!aibo_name_1.equals("")) )
		{
			members=members+","+aibo_name_1;
		}
		if(aibo_name_2!=null && (!aibo_name_2.equals("")) )
		{
			members=members+","+aibo_name_2;
		}
		String papers=member.getM_paper();
		if(aibo_paper_1!=null && (!aibo_paper_1.equals("")) )
		{
			papers=papers+","+aibo_paper_1;
		}
		if(aibo_paper_2!=null && (!aibo_paper_2.equals("")) )
		{
			papers=papers+","+aibo_paper_2;
		}
		Room_infoDAO rifdao=new Room_infoDAO();
		int realnum=rifdao.count_room(roomtype,0);
		DataList infodl=new DataList();
		String result_type="预订房间";
		boolean mark=true;
		if(realnum < num_i)//再次确认是否房间数量满足要求
		{
			//不满足要求跳转到出错提示页面
			mark=false;
			String backpath="./user_room_info.jsp";
			infodl.add("房间数量不足。建议取消订单并重新预订。");
			session.setAttribute("result_type",result_type);
			session.setAttribute("result_mark",mark);
			session.setAttribute("result_fail",infodl);
			session.setAttribute("backpath",backpath);
			response.sendRedirect("./user/user_result.jsp");
		}
		else
		{
			//预订成功
			confirm_room(roomtype,num_i,members,papers,i_date,q_date,memo);//将预订信息插入到数据库的预订信息表中
			//跳转到成功后的页面
			session.removeAttribute(roomtype);
			session.setAttribute("result_type",result_type);
			session.setAttribute("result_mark",mark);
			session.setAttribute("backpath","./user_book_rooms.jsp");
			response.sendRedirect("./cancel.do");
		}
	}
	public void confirm_room(String roomtype,int num_i,String members,String papers,
			Date i_date,Date q_date,String memo)
	{
		DataDAO ddao=new DataDAO("hotel","room_info");
		DataDAO ddao2=new DataDAO("hotel","book_info");
		Book_infoDAO bifdao=new Book_infoDAO();
		int record_num=ddao2.get_row()+1;
		String cond="where room_id like'"+roomtype+"%' and room_state='"+0+"'";
		ResultSet rs=ddao.selectCondition(cond);
		String set="room_state='1'";
		String where="";
		String room_ids="";
		try {
			for(int i=0;i<num_i;i++)
			{
				rs.next();
				where="(room_id ='"+rs.getString(1)+"')";
				ddao.update(set,where);
				bifdao.insert_into(record_num,rs.getString(1),members,papers,i_date,q_date,"预订中");
				room_ids+=rs.getString(1)+"";
				record_num++;
			}
		}
		catch(Exception e)
		{
		e.printStackTrace();	
		}
		customer_in(members,papers,room_ids,memo);
	}
	public void customer_in(String members,String papers,String room_id,String c_memo)
	{
		 CustomerDAO cdao=new  CustomerDAO();
		 DataDAO ddao=new DataDAO("hotel","customer");
		 int i=ddao.get_row()+1;
		 cdao.insert_into(i,members,papers,room_id,c_memo);
	}
}
