package mysql;

import java.sql.DriverManager;
import java.sql.Connection;

public class Mysql_connect { 
	public Connection connect()
	{
		Connection ct=null;
		try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
	 	      String url="jdbc:mysql://127.0.0.1:3306/hotel?serverTimezone=Asia/Shanghai";
	 		  String username="root";
	 		  String password="114514";
	 		 ct=DriverManager.getConnection(url,username,password);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ct;
	}
}
