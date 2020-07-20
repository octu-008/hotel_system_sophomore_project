package dao;
import mysql.DataDAO;
import mysql.Mysql_connect;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class Room_infoDAO {
	public void insert_into(String room_id,String room_state)
	{
		 Mysql_connect mysql=new Mysql_connect();
		  Connection ct=mysql.connect();
		  try {
			  PreparedStatement prstmt=ct.prepareStatement("INSERT INTO hotel.room_info "
				  		+ "(`room_id`, `room_state`) "
				  		+ "VALUES (?, ?)");
			  prstmt.setString(1,room_id);
			  prstmt.setString(2,room_state);
			  prstmt.executeUpdate();
			  prstmt.clearParameters();
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
	}
	public int count_room(String roomtype,int state)
	{
		int mark=0;
		Mysql_connect mysql=new Mysql_connect();
		Connection ct=mysql.connect();
		String cond="where room_id like'"+roomtype+"%' and room_state='"+state+"'";
		DataDAO ddao=new DataDAO("hotel","room_info");
		ResultSet rs=ddao.selectCondition(cond);
		try {
			rs.last();
			mark=rs.getRow();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return mark;
	}
}
