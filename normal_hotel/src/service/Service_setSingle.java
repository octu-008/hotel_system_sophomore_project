package service;

import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import hotel_data.Notice;

import hotel_data.Admin;
import hotel_data.DataList;
import hotel_data.Member;
import hotel_data.Room_detail;
import mysql.DataDAO;

public class Service_setSingle {
	public void set_Room_detail(String roomtype,HttpSession session)
    {
    	Service_search ss=new Service_search ();
    	DataList room_details=new DataList();
    	String cond="where type='"+roomtype+"'";
    	room_details=ss.search_Room_detail(cond);
    	Room_detail room_detail=(Room_detail)room_details.getList()[0];
    	session.setAttribute("room_detail",room_detail);
    	/*
		Room_detail rd=new Room_detail();
		DataDAO ddao=new DataDAO("hotel","room_detail");
		String cond="where type='"+roomtype+"'";
		ResultSet rs=ddao.selectCondition(cond);
		try {
			rs.next();
			rd.setType(rs.getString(1));
			rd.setRoom_name(rs.getString(2));
			rd.setPrice(rs.getDouble(3));
			rd.setFactor(rs.getString(4));
			rd.setPerson(rs.getInt(5));
			rd.setMeal(rs.getString(6));
			rd.setImg_path(rs.getString(7));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		session.setAttribute("room_detail",rd);
		*/
    }
    public void set_Member(String inputEmail,HttpSession session)
    {
    	Service_search ss=new Service_search ();
    	DataList members=new DataList();
    	String cond="where m_email='"+inputEmail+"'";
    	members=ss.search_Member(cond);
    	Member member=(Member)members.getList()[0];
    	session.setAttribute("member",member);
    	
    	
    	/*DataDAO ddao=new DataDAO("hotel","member");
    	String condition="where m_email='"+inputEmail+"'";
    	ResultSet rs=ddao.selectCondition(condition);
    	Member member=new Member();
    	try {
    		rs.next();
    		member.setAccount(rs.getInt(1));
    		member.setM_name(rs.getString(2));
    		member.setM_gender(rs.getString(3));
    		member.setM_entry(rs.getDate(4));
    		member.setM_password(rs.getString(5));
    		member.setM_email(rs.getString(6));
    		member.setM_address(rs.getString(7));
    		member.setM_paper(rs.getString(8));
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	session.setAttribute("member",member);
    	*/
    }
	public void set_Admin(String inputName,HttpSession session)
	{
		Service_search ss=new Service_search ();
		DataList admin=new DataList();
		String cond="where admin_name='"+inputName+"'";
		admin=ss.search_Admin(cond);
		Admin ad=(Admin)admin.getList()[0];
		session.setAttribute("admin",ad);
		
		/*DataDAO ddao=new DataDAO("hotel","admin");
    	String condition="where admin_name='"+inputName+"'";
    	ResultSet rs=ddao.selectCondition(condition);
    	Admin admin=new Admin();
    	try {
    		rs.next();
    		admin.setAdmin_id(rs.getInt(1));
    		admin.setAdmin_name(rs.getString(2));
    		admin.setAdmin_password(rs.getString(3));
    		admin.setAdmin_entry(rs.getDate(4));
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	session.setAttribute("admin",admin);
    	*/
	}
	public void set_Latest_notice(HttpSession session)
	{
		Service_search ss=new Service_search ();
	    DataList notices=new DataList();
	    notices=ss.search("notice","order by n_date DESC");
		Notice latestNotice=new Notice();
		latestNotice=(Notice)notices.getList()[0];
		session.setAttribute("latestNotice",latestNotice);
	}
}
