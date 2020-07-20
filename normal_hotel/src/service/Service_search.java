package service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import hotel_data.*;
import mysql.Mysql_connect;
public class Service_search {
 public DataList search_Book_info(String cond)
 {
	 DataList rls=new DataList();
	 Mysql_connect mysql=new Mysql_connect();
	 Connection ct=mysql.connect();
	 String sql="select * from hotel.book_info "+cond;
	 try {
	 PreparedStatement prstmt=ct.prepareStatement(sql);
	 ResultSet rs=prstmt.executeQuery();
	 while(rs.next())
	 {
		 Book_info bif=new Book_info();
		 bif.setRecord_num(rs.getInt(1));
		 bif.setRoom_id(rs.getString(2));
		 bif.setC_name(rs.getString(3));
		 bif.setC_paper(rs.getString(4));
		 bif.setBook_in_time(rs.getDate(5));
		 bif.setBook_quit_time(rs.getDate(6));
		 bif.setBook_state(rs.getString(7));
		 rls.add(bif);
	 }
	 prstmt.close();
	 }
	 catch(Exception e)
	  {
		 e.printStackTrace();
	  }
	 return rls;
 }
 public DataList search_Checkin_info(String cond)
 {
	 DataList rls=new DataList();
	 Mysql_connect mysql=new Mysql_connect();
	 Connection ct=mysql.connect();
	 String sql="select * from hotel.checkin_info "+cond;
	 try {
		 PreparedStatement prstmt=ct.prepareStatement(sql);
		 ResultSet rs=prstmt.executeQuery();
		 while(rs.next())
		 {
			 Checkin_info cif=new Checkin_info();
			 cif.setRecord(rs.getInt(1));
			 cif.setRoom_id(rs.getString(2));
			 cif.setC_name(rs.getString(3));
			 cif.setC_paper(rs.getString(4));
			 cif.setCi_time(rs.getDate(5));
			 cif.setCi_days(rs.getInt(6));
			 cif.setCi_deposit(rs.getDouble(7));
			 cif.setCi_state(rs.getString(8));
			 rls.add(cif);
		 }
		 prstmt.close();
	 }
	 catch(Exception e)
	  {
		 e.printStackTrace();
	  }
	 return rls;
 }
 public DataList search_Member(String cond)
 {
	 DataList rls=new DataList();
	 Mysql_connect mysql=new Mysql_connect();
	 Connection ct=mysql.connect();
	 String sql="select * from hotel.member "+cond;
	 try {
		 PreparedStatement prstmt=ct.prepareStatement(sql);
		 ResultSet rs=prstmt.executeQuery();
		 while(rs.next())
		 {
			 Member m=new Member();
			 m.setAccount(rs.getInt(1));
			 m.setM_name(rs.getString(2));
			 m.setM_gender(rs.getString(3));
			 m.setM_entry(rs.getDate(4));
			 m.setM_password(rs.getString(5));
			 m.setM_email(rs.getString(6));
			 m.setM_address(rs.getString(7));
			 m.setM_paper(rs.getString(8));
			 rls.add(m);
		 }
		 prstmt.close();
	 }
	 catch(Exception e)
	  {
		 e.printStackTrace();
	  }
	 return rls;
 }
 public DataList search_Bill(String cond)
 {
	 DataList rls=new DataList();
	 Mysql_connect mysql=new Mysql_connect();
	 Connection ct=mysql.connect();
	 String sql="select * from hotel.bill "+cond;
	 try {
		 PreparedStatement prstmt=ct.prepareStatement(sql);
		 ResultSet rs=prstmt.executeQuery();
		 while(rs.next())
		 {
		       Bill  bill=new Bill();
			   bill.setRecord(rs.getInt(1));
			   bill.setC_name(rs.getString(2));
			   bill.setC_paper(rs.getString(3));
			   bill.setRoom_id(rs.getString(4));
			   bill.setRegister_time(rs.getDate(5));
			   bill.setSettle_time(rs.getDate(6));
			   bill.setC_type(rs.getInt(7));
			   bill.setDays(rs.getInt(8));
			   bill.setCost(rs.getDouble(9));
			   rls.add(bill);
		 }
		 prstmt.close();
	 }
	 catch(Exception e)
	  {
		 e.printStackTrace();
	  }
	 return rls;
 }
 public DataList search_Message(String cond)
 {
	 DataList rls=new DataList();
	 Mysql_connect mysql=new Mysql_connect();
	 Connection ct=mysql.connect();
	 String sql="select * from hotel.message "+cond;
	 try {
		 PreparedStatement prstmt=ct.prepareStatement(sql);
		 ResultSet rs=prstmt.executeQuery();
		 while(rs.next())
		 {
		 Message mess=new Message();
		 mess.setRecord(rs.getInt(1));
		 mess.setMsg_name(rs.getString(2));
		 mess.setMsg_contact(rs.getString(3));
		 mess.setMsg_content(rs.getString(4));
		 rls.add(mess);
		 }
		 prstmt.close();
	 }
	 catch(Exception e)
	  {
		 e.printStackTrace();
	  }
	 return rls;
 }
 public DataList search_Notice(String cond)
 {
	 DataList rls=new DataList();
	 Mysql_connect mysql=new Mysql_connect();
	 Connection ct=mysql.connect();
	 String sql="select * from hotel.notice "+cond;
	 try {
		 PreparedStatement prstmt=ct.prepareStatement(sql);
		 ResultSet rs=prstmt.executeQuery();
		 while(rs.next())
		 {
			 Notice n=new Notice();
			 n.setRecord(rs.getInt(1));
			 n.setN_tittle(rs.getString(2));
			 n.setAuthor(rs.getString(3));
			 n.setN_content(rs.getString(4));
			 n.setN_date(rs.getDate(5));
			 rls.add(n);
		 }
		 prstmt.close();
	 }
	 catch(Exception e)
	  {
		 e.printStackTrace();
	  }
	 return rls;
 }
 public DataList search_Room_info(String cond)
 {
	 DataList rls=new DataList();
	 Mysql_connect mysql=new Mysql_connect();
	 Connection ct=mysql.connect();
	 String sql="select * from hotel.room_info "+cond;
	 try {
		 PreparedStatement prstmt=ct.prepareStatement(sql);
		 ResultSet rs=prstmt.executeQuery();
		 while(rs.next())
		 {
			 Room_info rif=new Room_info();
			 rif.setRoom_id(rs.getString(1));
			 rif.setRoom_state(rs.getInt(2));
			 rls.add(rif);
		 }
		 prstmt.close();
	 }
	 catch(Exception e)
	  {
		 e.printStackTrace();
	  }
	 return rls;
 }
 public DataList search_Room_detail(String cond)
 {
	 DataList rls=new DataList();
	 Mysql_connect mysql=new Mysql_connect();
	 Connection ct=mysql.connect();
	 String sql="select * from hotel.room_detail "+cond;
	 try {
		 PreparedStatement prstmt=ct.prepareStatement(sql);
		 ResultSet rs=prstmt.executeQuery();
		 while(rs.next())
		 {
			 Room_detail de=new Room_detail();
             de.setType(rs.getString(1));
             de.setRoom_name(rs.getString(2));
             de.setPrice(rs.getDouble(3));
             de.setFactor(rs.getString(4));
             de.setPerson(rs.getInt(5));
             de.setMeal(rs.getString(6));
             de.setImg_path(rs.getString(7));
			 rls.add(de);
		 }
		 prstmt.close();
	 }
	 catch(Exception e)
	 {
		 e.printStackTrace();
	 }
	 return rls;
 }
 public DataList search_Admin(String cond)
 {
	 DataList rls=new DataList();
	 Mysql_connect mysql=new Mysql_connect();
	 Connection ct=mysql.connect();
	 String sql="select * from hotel.admin "+cond;
	 try {
		 PreparedStatement prstmt=ct.prepareStatement(sql);
		 ResultSet rs=prstmt.executeQuery();
		 while(rs.next())
		 {
			 Admin ad=new Admin();
			 ad.setAdmin_id(rs.getInt(1));
			 ad.setAdmin_name(rs.getString(2));
			 ad.setAdmin_password(rs.getString(3));
			 ad.setAdmin_entry(rs.getDate(4));
			 rls.add(ad);
		 }
	 }
	 catch(Exception e)
	 {
		 e.printStackTrace();
	 }
	 return rls;
 }
 public int get_row(String database,String table)
 {
	 int rows=0;
	 Mysql_connect mysql=new Mysql_connect();
	 Connection ct=mysql.connect();
	 String sql="select * from "+database+"."+table;
	 try {
		 PreparedStatement prstmt=ct.prepareStatement(sql);
		 ResultSet rs=prstmt.executeQuery();
		 rs.last();
		 rows=rs.getRow();
	 }
	 catch(Exception e)
	  {
		 e.printStackTrace();
	  }
	 return rows;
 }
 public int get_last_row_num(String database,String table)
 {
	 int lastrowNum=0;
	 Mysql_connect mysql=new Mysql_connect();
	 Connection ct=mysql.connect();
	 String sql="select * from "+database+"."+table;
	 try
	 {
		 PreparedStatement prstmt=ct.prepareStatement(sql);
		 ResultSet rs=prstmt.executeQuery();
		 rs.last();
		 if(rs!=null)
		 {
		 lastrowNum=rs.getInt(1);
		 }
	 }
	 catch(Exception e)
	  {
		 e.printStackTrace();
	  }
	 return lastrowNum;
 }
 public int get_row_with_cond(String database,String table,String cond)
 {
	 int rows=0;
	 Mysql_connect mysql=new Mysql_connect();
	 Connection ct=mysql.connect();
	 String sql="select * from "+database+"."+table+" "+cond;
	 try {
		 PreparedStatement prstmt=ct.prepareStatement(sql);
		 ResultSet rs=prstmt.executeQuery();
		 rs.last();
		 rows=rs.getRow();
	 }
	 catch(Exception e)
	  {
		 e.printStackTrace();
	  }
	 return rows;
 }
 public int get_room_num(String type,int state)
 {
	 int num=0;
	 Mysql_connect mysql=new Mysql_connect();
	 Connection ct=mysql.connect();
	 String sql="select count(*) from hotel.room_info where room_id like '"+type+"%' and room_state="+state+" ";
	 try {
		 PreparedStatement prstmt=ct.prepareStatement(sql);
		 ResultSet rs=prstmt.executeQuery();
		 rs.next();
		 num=rs.getInt(1);
	 }
	 catch(Exception e)
	  {
		 e.printStackTrace();
	  }
	 return num;
 }
 public DataList search(String table,String cond)
 {
	 DataList rls=new DataList();
	 switch(table)
	 {
	 case "book_info":rls=search_Book_info(cond);break;
	 case "checkin_info":rls=search_Checkin_info(cond);break;
	 case "member":rls=search_Member(cond);break;
	 case  "bill":rls=search_Bill(cond);break;
	 case "message":rls=search_Message(cond);break;
	 case "notice":rls=search_Notice(cond);break;
	 case "room_info":rls=search_Room_info(cond);break;
	 case "room_detail":rls=search_Room_detail(cond);break;
	 default:break;
	 }
	 return rls;
 }
} 
