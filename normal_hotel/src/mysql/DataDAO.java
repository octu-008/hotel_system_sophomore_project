package mysql;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mysql.Mysql_connect;

public class DataDAO {
  private String database;
  private String table;
  
  public DataDAO(String database,String table)
  {
	  this.database=database;
	  this.table=table;
  }
  public ResultSet selectAll()
  {
	  Mysql_connect mysql=new Mysql_connect();
	  Connection ct=mysql.connect();
	  ResultSet rs=null;
	  try {
		  Statement stmt=ct.createStatement();
		  String sql="select * from "+this.database+"."+this.table;
		  rs=stmt.executeQuery(sql);
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  return rs;
  }
  public ResultSet selectCondition(String cond)
  {
	  String condition=cond;
	  Mysql_connect mysql=new Mysql_connect();
	  Connection ct=mysql.connect();
	  ResultSet rs=null;
	  try {
		  Statement stmt=ct.createStatement();
		  String sql="select * from "+this.database+"."+this.table+" "+condition;
		  rs=stmt.executeQuery(sql);
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  return rs;
  }
 public void update(String set,String where)
 {
	  Mysql_connect mysql=new Mysql_connect();
	  Connection ct=mysql.connect();
	  try {
		  String sql="update "+this.database+"."+this.table+" set "+set+" where "+where;
		  PreparedStatement prstmt=ct.prepareStatement(sql);
		  prstmt.executeUpdate();
		  prstmt.clearParameters();
		  prstmt.close();
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
 }
 public void delete (String where)
 {
	  Mysql_connect mysql=new Mysql_connect();
	  Connection ct=mysql.connect();
	  try {
		  String sql="delete from "+this.database+"."+this.table+"  "+where;
		  PreparedStatement prstmt=ct.prepareStatement(sql);
		  prstmt.executeUpdate();
		  prstmt.clearParameters();
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
 }
 public int get_row()
 {
	 int rows=0;
	 ResultSet rs=selectAll();
	 try {
		 rs.last();
		 rows=rs.getRow();
	 }
	 catch(Exception e)
	 {
		 e.printStackTrace();
	 }
	 return rows;
 }
}
