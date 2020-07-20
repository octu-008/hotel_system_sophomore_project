package hotel_data;

import java.io.Serializable;
import java.sql.Date;

public class Book_info implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int record_num;
	private String room_id;
	private String c_name;
	private String c_paper;
	private Date book_in_time;
	private String s_book_time;
	private Date book_quit_time;
	private String book_state;
	public Book_info()
	{
		
	}
	public int getRecord_num() {
		return record_num;
	}
	public void setRecord_num(int record_num) {
		this.record_num = record_num;
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
	
	public String getS_book_time() {
		return s_book_time;
	}
	public void setS_book_time(String s_book_time) {
		this.s_book_time = s_book_time;
	}
	public Date getBook_in_time() {
		return book_in_time;
	}
	public void setBook_in_time(Date book_in_time) {
		this.book_in_time = book_in_time;
	}
	public Date getBook_quit_time() {
		return book_quit_time;
	}
	public void setBook_quit_time(Date book_quit_time) {
		this.book_quit_time = book_quit_time;
	}
	public String getBook_state() {
		return book_state;
	}
	public void setBook_state(String book_state) {
		this.book_state = book_state;
	}
}
