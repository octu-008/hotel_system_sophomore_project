package dao;
import mysql.Mysql_connect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;
public class NoticeDAO {
	public void insert_into(int record,String n_tittle,String author,String n_content,Date n_date)
	{
		Mysql_connect mysql=new Mysql_connect();
		Connection ct=mysql.connect();
		java.sql.Date n_date_s=new java.sql.Date(n_date.getTime());
		try {
			PreparedStatement prstmt=ct.prepareStatement("INSERT INTO hotel.notice "
			  		+ "(`record`,`n_tittle`, `author`, `n_content`, `n_date`) "
			  		+ "VALUES (?, ?, ?, ?, ?)");
			prstmt.setInt(1,record);
			prstmt.setString(2,n_tittle);
			prstmt.setString(3,author);
			prstmt.setString(4,n_content);
			prstmt.setDate(5,n_date_s);
			prstmt.executeUpdate();
			prstmt.clearParameters();
		}
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
	}
}
