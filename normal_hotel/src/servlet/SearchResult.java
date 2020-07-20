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
 * Servlet implementation class SearchResult
 */
@WebServlet("/searchResu.view")
public class SearchResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchResult() {
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
		String rtable=request.getParameter("rtable");
		String search_select_cond=request.getParameter("search_select_cond");
		String search_cond=request.getParameter("search_cond");
	    String cond=getCondsql(rtable,search_select_cond,search_cond);
	    Service_search ss=new Service_search();
	    switch(rtable)
	    {
	    case "book_info":
			 DataList rbook_infos=new DataList();
			 rbook_infos=ss.search("book_info",cond);
			 session.setAttribute("rbook_infos",rbook_infos);
			 response.sendRedirect("./admin/admin_bookmag.jsp");
			 break;
		 case "checkin_info":
			 DataList rcheckin_infos=new DataList();
			 rcheckin_infos=ss.search("checkin_info",cond);
			 session.setAttribute("rcheckin_infos",rcheckin_infos);
			 response.sendRedirect("./admin/admin_accommodation.jsp");
			 break;
		 case "member":
			 DataList rmembers=new DataList();
			 rmembers=ss.search("member",cond);
			 session.setAttribute("rmembers",rmembers);
			 response.sendRedirect("./admin/admin_usermag.jsp");
			 break;
		 case  "bill":
			 DataList rbills=new DataList();
			 rbills=ss.search("bill",cond);
			 session.setAttribute("rbills",rbills);
			 response.sendRedirect("./admin/admin_billmag.jsp");
			 break;
		 case "message":
			 DataList rmessages=new DataList();
			 rmessages=ss.search("message",cond);
			 session.setAttribute("rmessages",rmessages);
			 response.sendRedirect("./admin/admin_message.jsp");
			 break;
		 case "notice":
			 DataList rnotices=new DataList();
			 rnotices=ss.search("notice",cond);
			 session.setAttribute("rnotices",rnotices);
			 response.sendRedirect("./admin/admin_notice.jsp");
			 break;
		 case "":
			 DataList rroom_infos=new DataList();
			 rroom_infos=ss.search("room_info"," ");
			 session.setAttribute("rroom_infos",rroom_infos);
			 break;
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
	public String getCondsql(String rtable,String search_select_cond,String search_cond)
	{
		String r="";
		switch(rtable)
		{
		 case "book_info":
			switch(search_select_cond)
			{
			case "record_num":
				if(isNum(search_cond))
				{
				r="where record_num="+Integer.valueOf(search_cond)+" ";
				}
				else
				{
					r="where record_num=0";
				}
				break;
			default:
				r="where "+search_select_cond+" like '"+search_cond+"%'";
				break;
			}
			 break;
		 case "checkin_info":
			 switch(search_select_cond)
				{
				case "record":
					if(isNum(search_cond))
					{
					r="where record="+Integer.valueOf(search_cond)+" ";
					}
					else
					{
						r="where record=0";
					}
					break;
				default:
					r="where "+search_select_cond+" like '"+search_cond+"%'";
					break;
				}
			 break;
		 case "member":
			 r="where "+search_select_cond+" like '"+search_cond+"%'";
			 break;
		 case  "bill":
			 r="where "+search_select_cond+" like '"+search_cond+"%'";
			 break;
		 case "message":break;
		 case "notice":break;
		 case "room_info":break;
		}
		return r;
	}
}
