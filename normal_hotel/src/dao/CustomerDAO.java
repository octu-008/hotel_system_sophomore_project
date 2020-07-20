package dao;
import mysql.Mysql_connect;
import java.sql.Connection;
import java.sql.PreparedStatement;
public class CustomerDAO {
	public void insert_into(int record_num,String c_name,String c_paper
			,String room_id,String c_memo)
	{
		 Mysql_connect mysql=new Mysql_connect();
		  Connection ct=mysql.connect();
		  try {
			  PreparedStatement prstmt=ct.prepareStatement("INSERT INTO hotel.customer "
				  		+ "(`record_num`, `c_name`, `c_paper`, `room_id`,`c_memo`) "
				  		+ "VALUES (?, ?, ?, ?, ?)");
			  prstmt.setInt(1,record_num);
			  prstmt.setString(2,c_name);
			  prstmt.setString(3,c_paper);
			  prstmt.setString(4,room_id);
			  prstmt.setString(5,c_memo);
			  prstmt.executeUpdate();
			  prstmt.clearParameters();
		  }
		 catch(Exception e)
		  {
			 e.printStackTrace();
		  }
	}
}
