package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel_data.DataList;
import service.Service_search;

/**
 * Servlet implementation class View_data
 */
@WebServlet("/data.view")
public class View_data extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public View_data() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession();
		String table=request.getParameter("table");
		Service_search ss=new Service_search();
		String room_detail_view=request.getParameter("room_detail_view");
		switch(table)
		{
		 case "book_info":
			 DataList book_infos=new DataList();
			 book_infos=ss.search("book_info","");
			 session.setAttribute("book_infos",book_infos);
			 response.sendRedirect("./admin/admin_bookmag.jsp");
			 break;
		 case "checkin_info":
			 DataList checkin_infos=new DataList();
			 checkin_infos=ss.search("checkin_info","");
			 session.setAttribute("checkin_infos",checkin_infos);
			 DataList room_infos=new DataList();
			 room_infos=ss.search("room_info"," ");
			 session.setAttribute("room_infos",room_infos);
			 response.sendRedirect("./admin/admin_accommodation.jsp");
			 break;
		 case "member":
			 DataList members=new DataList();
			 members=ss.search("member","");
			 session.setAttribute("members",members);
			 response.sendRedirect("./admin/admin_usermag.jsp");
			 break;
		 case  "bill":
			 DataList bills=new DataList();
			 bills=ss.search("bill","");
			 session.setAttribute("bills",bills);
			 response.sendRedirect("./statistic.view");
			 break;
		 case "message":
			 DataList messages=new DataList();
			 messages=ss.search("message","order by record DESC");
			 session.setAttribute("messages",messages);
			 response.sendRedirect("./admin/admin_message.jsp");
			 break;
		 case "notice":
			 DataList notices=new DataList();
			 notices=ss.search("notice","order by n_date DESC");
			 session.setAttribute("notices",notices);
			 response.sendRedirect("./admin/admin_notice.jsp");
			 break;
		 case "room_detail":
			 DataList room_details=new DataList();
			 room_details=ss.search("room_detail","");
			 session.setAttribute("room_details",room_details);
			 int room_0010_num=ss.get_room_num("001",0);
			 int room_0020_num=ss.get_room_num("002",0);
			 int room_0030_num=ss.get_room_num("003",0);
			 session.setAttribute("room_0010_num",room_0010_num);
			 session.setAttribute("room_0020_num",room_0020_num);
			 session.setAttribute("room_0030_num",room_0030_num);
			 if(room_detail_view.equals("member"))
			 {
				response.sendRedirect("./user/user_room_info.jsp"); 
			 }
			 else if(room_detail_view.equals("admin"))
			 {
				 response.sendRedirect("./admin/admin_accommodation.jsp");
			 }
			 break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
    
}
