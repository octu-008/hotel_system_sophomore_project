package hotel_data;

import java.io.Serializable;
import java.sql.Date;

public class Bill implements Serializable{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int record;
	 private String c_name;
	 private String c_paper;
	 private String room_id;
	 private Date register_time;
	 private String s_register_time;
	 private Date settle_time;
	 private String s_settle_time;
	 private int c_type;
	 private int days;
	 private double cost;
	 public Bill()
	 {
		 
	 }
	public int getRecord() {
		return record;
	}
	public void setRecord(int record) {
		this.record = record;
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
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public Date getRegister_time() {
		return register_time;
	}
	public void setRegister_time(Date register_time) {
		this.register_time = register_time;
	}
	public String getS_register_time() {
		return s_register_time;
	}
	public void setS_register_time(String s_register_time) {
		this.s_register_time = s_register_time;
	}
	public Date getSettle_time() {
		return settle_time;
	}
	public void setSettle_time(Date settle_time) {
		this.settle_time = settle_time;
	}
	public String getS_settle_time() {
		return s_settle_time;
	}
	public void setS_settle_time(String s_settle_time) {
		this.s_settle_time = s_settle_time;
	}
	public int getC_type() {
		return c_type;
	}
	public void setC_type(int c_type) {
		this.c_type = c_type;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}
	 
	 
}
