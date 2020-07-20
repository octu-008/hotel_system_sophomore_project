package dao;
import mysql.Mysql_connect;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
public class MessageDAO {
	public void insert_into(int record,String msg_name,
			String msg_contact,String msg_content)
	{
		 Mysql_connect mysql=new Mysql_connect();
		  Connection ct=mysql.connect();
		  try {
			  PreparedStatement prstmt=ct.prepareStatement("INSERT INTO hotel.message "
				  		+ "(`record`, `msg_name`, `msg_contact`, `msg_content`) "
				  		+ "VALUES (?, ?, ?, ?)");
			  prstmt.setInt(1,record);
			  prstmt.setString(2,msg_name);
			  prstmt.setString(3,msg_contact);
			  prstmt.setString(4,msg_content);
			  prstmt.executeUpdate();
			  prstmt.clearParameters();
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
	}
}
