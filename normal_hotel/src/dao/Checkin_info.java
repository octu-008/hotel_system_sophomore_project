package dao;
import mysql.Mysql_connect;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
public class Checkin_info {
	public void  insert_into(int record,String room_id,String c_name,
			String c_paper,Date ci_time,int ci_days,double ci_deposit,String ci_state )
	{
		java.sql.Date cit=new java.sql.Date(ci_time.getTime());
		 Mysql_connect mysql=new Mysql_connect();
		  Connection ct=mysql.connect();
		  try {
			  PreparedStatement prstmt=ct.prepareStatement("INSERT INTO hotel.checkin_info "
				  		+ "(`record`, `room_id`, `c_name`, `c_paper`,`ci_time`,`ci_days`,`ci_deposit`,`ci_state`) "
				  		+ "VALUES (?, ?, ?, ?, ?, ?, ?,?)");
			  prstmt.setInt(1,record);
			  prstmt.setString(2,room_id);
			  prstmt.setString(3,c_name);
			  prstmt.setString(4,c_paper);
			  prstmt.setDate(5,cit);
			  prstmt.setInt(6,ci_days);
			  prstmt.setDouble(7,ci_deposit);
			  prstmt.setString(8,ci_state);
			  prstmt.executeUpdate();
			  prstmt.clearParameters();
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
	}
}
