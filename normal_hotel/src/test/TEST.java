package test;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import mysql.DataDAO;
import dao.MessageDAO;
import dao.Room_infoDAO;
import service.Service_password;
public class TEST {

	public static void main(String[] args) throws ParseException {
       String test="password";
       System.out.println(test);
       Service_password testt=new Service_password();
       String locktest=testt.lockOn(test);
       System.out.println(locktest);
       String lockofftest=testt.lockOff(locktest);
       System.out.println(lockofftest);
	}

}
