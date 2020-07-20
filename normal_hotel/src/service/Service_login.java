package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mysql.Mysql_connect;

public class Service_login {
	 private String database;
	  private String table;
	  public Service_login(String database,String table)
	  {
		  this.database=database;
		  this.table=table;
	  }
 public boolean isInvalidAccount(String type,String account)
 {
	 boolean mark=true;
	 Mysql_connect mysql=new Mysql_connect();
	 Connection ct=mysql.connect();
	 String condition="where "+type+"="+"'"+account+"'";
	 String sql="select * from "+this.database+"."+this.table+" "+condition;
	try {
		PreparedStatement prstmt=ct.prepareStatement(sql);
		ResultSet rs=prstmt.executeQuery();
		if(rs.next())
		{
			mark=false;
		}
		prstmt.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	 return mark;
 }
 public boolean isPwdMatch(String type,String account,String inputPwd,int pos)
 {
	 boolean mark=false;
	 Mysql_connect mysql=new Mysql_connect();
	 Connection ct=mysql.connect();
	 String condition="where "+type+"="+"'"+account+"'";
	 String sql="select * from "+this.database+"."+this.table+" "+condition;
	 try
	 {
			PreparedStatement prstmt=ct.prepareStatement(sql);
			ResultSet rs=prstmt.executeQuery();
			rs.next();
			String pwd=rs.getString(pos);
			Service_password sp=new Service_password();
			String changePwd=sp.lockOff(pwd);
			if(inputPwd.equals(changePwd))
			{
				mark=true;
			}
			prstmt.close();
	 }
	 catch(Exception e)
	 {
		 e.printStackTrace();
	 }
	 return mark;
 }
}
