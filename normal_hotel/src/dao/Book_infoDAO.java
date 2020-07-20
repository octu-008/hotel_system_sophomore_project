package dao;
import mysql.Mysql_connect;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
public class Book_infoDAO {
	public void insert_into(int record_num,String room_id,
			String c_name,String c_paper,Date book_time,Date in_time,String book_state)
	{
		java.sql.Date bt=new java.sql.Date(book_time.getTime());
		java.sql.Date it=new java.sql.Date(in_time.getTime());
		 Mysql_connect mysql=new Mysql_connect();
		  Connection ct=mysql.connect();
		  try {
			  PreparedStatement prstmt=ct.prepareStatement("INSERT INTO hotel.book_info "
				  		+ "(`record_num`, `room_id`, `c_name`, `c_paper`,`book_in_time`,`book_quit_time`,`book_state`) "
				  		+ "VALUES (?, ?, ?, ?, ?, ?, ?)");
			  prstmt.setInt(1,record_num);
			  prstmt.setString(2,room_id);
			  prstmt.setString(3,c_name);
			  prstmt.setString(4,c_paper);
			  prstmt.setDate(5,bt);
			  prstmt.setDate(6,it);
			  prstmt.setString(7,book_state);
			  prstmt.executeUpdate();
			  prstmt.clearParameters();
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
	}
}
