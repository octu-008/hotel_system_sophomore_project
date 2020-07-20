package service;

import java.text.SimpleDateFormat;
import java.util.Date;
public class Service_general {
  public Date getNowDate()
  {
	  Date date=new Date();
	  SimpleDateFormat dateFormat=new SimpleDateFormat("yyy-MM-dd");
	  dateFormat.format(date);
	  return date;
  }
  public Date strtoDate(String year,String month,String day)
  {
	  Date newdate=new Date();
  	SimpleDateFormat dataFormat= new SimpleDateFormat("yyyy-MM-dd");	
  	String str=year+"-"+month+"-"+day;
  	try {
  	Date date=dataFormat.parse(str);
  	dataFormat.format(date);
  	newdate=new java.sql.Date(date.getTime());
  	}
  	catch(Exception e)
  	{
  		e.printStackTrace();
  	}
  	return newdate;
  }
  public Date strtoDate(String datestr)
  {
	  Date newdate=new Date();
	  SimpleDateFormat dataFormat= new SimpleDateFormat("yyyy-MM-dd");
	  try {
			Date date=dataFormat.parse(datestr);
			dataFormat.format(date);
			newdate=new java.sql.Date(date.getTime());
	  }
	  	catch(Exception e)
	  	{
	  		e.printStackTrace();
	  	}
	  return newdate;
  }
}
