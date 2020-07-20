package hotel_data;

import java.io.Serializable;
import java.sql.Date;

public class Checkin_info implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int record;
	private String room_id;
	private String c_name;
	private String c_paper;
	private Date ci_time;
	private String s_ci_time;
	private int ci_days;
	private double ci_deposit;
	private String ci_state;
	public Checkin_info()
	{
		
	}
	public int getRecord() {
		return record;
	}
	public void setRecord(int record) {
		this.record = record;
	}
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_paper() {
		return c_paper;
	}
	public void setC_paper(String c_paper) {
		this.c_paper = c_paper;
	}
	public Date getCi_time() {
		return ci_time;
	}
	public void setCi_time(Date ci_time) {
		this.ci_time = ci_time;
	}
	public String getS_ci_time() {
		return s_ci_time;
	}
	public void setS_ci_time(String s_ci_time) {
		this.s_ci_time = s_ci_time;
	}
	public int getCi_days() {
		return ci_days;
	}
	public void setCi_days(int ci_days) {
		this.ci_days = ci_days;
	}
	public double getCi_deposit() {
		return ci_deposit;
	}
	public void setCi_deposit(double ci_deposit) {
		this.ci_deposit = ci_deposit;
	}
	public String getCi_state() {
		return ci_state;
	}
	public void setCi_state(String ci_state) {
		this.ci_state = ci_state;
	}
	
}
