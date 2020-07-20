package dao;
import mysql.Mysql_connect;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
public class AdminDAO {
  public void insert_into(int admin_id,String admin_name,String admin_password,Date admin_entry)
  {
	  Mysql_connect mysql=new Mysql_connect();
	  Connection ct=mysql.connect();
	  try {
		  PreparedStatement prstmt=ct.prepareStatement("INSERT INTO hotel.admin "
		  		+ "(`admin_id`, `admin_name`, `admin_password`, `admin_entry`) "
		  		+ "VALUES (?, ?, ?, ?)");
		 prstmt.setInt(1,admin_id);
		 prstmt.setString(2,admin_name);
		 prstmt.setString(3,admin_password);
		 prstmt.setDate(4,new java.sql.Date(admin_entry.getTime()));
		 prstmt.executeUpdate();
		 prstmt.clearParameters();
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
  }
}
