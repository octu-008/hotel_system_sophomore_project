package dao;
import mysql.Mysql_connect;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
public class MemberDAO {
	public void insert_into(int account,String m_name,String m_gender,Date m_entry,
			String m_password,String m_email,String m_address,String m_paper )
	{
		java.sql.Date mysql_time=new java.sql.Date(m_entry.getTime());
		 Mysql_connect mysql=new Mysql_connect();
		  Connection ct=mysql.connect();
		  try {
			  PreparedStatement prstmt=ct.prepareStatement("INSERT INTO hotel.member "
				  		+ "(`account`, `m_name`, `m_gender`, `m_entry`,`m_password`,`m_email`,`m_address`,`m_paper`) "
				  		+ "VALUES (?, ?, ?, ?, ?, ?, ?,?)");
			  prstmt.setInt(1,account);
			  prstmt.setString(2,m_name);
			  prstmt.setString(3,m_gender);
			  prstmt.setDate(4,mysql_time);
			  prstmt.setString(5,m_password);
			  prstmt.setString(6,m_email);
			  prstmt.setString(7,m_address);
			  prstmt.setString(8,m_paper);
			  prstmt.executeUpdate();
			  prstmt.clearParameters();
			  prstmt.close();
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
	      }
	}
}
