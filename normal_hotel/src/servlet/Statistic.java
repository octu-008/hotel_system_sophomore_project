package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hotel_data.Bill;
import hotel_data.DataList;
import service.Service_search;
/**
 * Servlet implementation class Statistic
 */
@WebServlet("/statistic.view")
public class Statistic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Statistic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		DataList bills=(DataList)session.getAttribute("bills");
		double totalprice_0=0.0;
		totalprice_0=countBill(bills.getList(),bills.getLength());
		double totalprice_1=0.0;
		double totalprice_2=0.0;
		double totalprice_3=0.0;
		double totalprice_4=0.0;
		totalprice_1=totalPrice_Type(1);
		totalprice_2=totalPrice_Type(2);
		totalprice_3=totalPrice_Type(3);
		totalprice_4=totalPrice_Type(4);
		session.setAttribute("totalprice_0",totalprice_0);
		session.setAttribute("totalprice_1",totalprice_1);
		session.setAttribute("totalprice_2",totalprice_2);
		session.setAttribute("totalprice_3",totalprice_3);
		session.setAttribute("totalprice_4",totalprice_4);
		response.sendRedirect("./admin/admin_billmag.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

	}
    public double totalPrice_Type(int c_type)
    {
		double totalprice=0.0;
    	Service_search ss=new Service_search();
    	String cond="where c_type="+c_type;
    	DataList tpt=ss.search_Bill(cond);
    	totalprice=countBill(tpt.getList(),tpt.getLength());
    	return totalprice;
    }
    public double countBill(Object[] objs,int length)
    {
    	double total=0.0;
    	if(length>0)
    	{
    		Bill[] tbs=new Bill[length];
    		for(int j=0;j<length;j++)
    		{
    			tbs[j]=new Bill();
    			tbs[j]=(Bill)objs[j];
    		}
    		 for(Bill tb:tbs)
    		    {
    			 total+=tb.getCost();
    		    }
    	}
    	return total;
    }
}
