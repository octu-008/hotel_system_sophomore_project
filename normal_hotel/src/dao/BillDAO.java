package dao;
import mysql.Mysql_connect;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
public class BillDAO {
 public void insert_into(int record,String c_name,String c_paper,String room_id,Date 
		 register_time,Date settle_time,int c_type,int days,double cost)
 {
	 Mysql_connect mysql=new Mysql_connect();
	  Connection ct=mysql.connect();
	  try {
		  PreparedStatement prstmt=ct.prepareStatement("INSERT INTO hotel.bill "
			  		+ "(`record`, `c_name`, `c_paper`, `room_id`,`register_time`,`settle_time`,`c_type`,`days`,`cost`) "
			  		+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
		  prstmt.setInt(1,record);
		  prstmt.setString(2,c_name);
		  prstmt.setString(3,c_paper);
		  prstmt.setString(4,room_id);
		  prstmt.setDate(5,new java.sql.Date(register_time.getTime()));
		  prstmt.setDate(6,new java.sql.Date(settle_time.getTime()));
		  prstmt.setInt(7,c_type);
		  prstmt.setInt(8,days);
		  prstmt.setDouble(9,cost);
		  prstmt.executeUpdate();
		  prstmt.clearParameters();
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
 }
}
