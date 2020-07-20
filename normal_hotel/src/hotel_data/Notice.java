package hotel_data;

import java.util.Date;
import java.io.Serializable;

public class Notice implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int record;
	private String n_tittle;
	private String author;
	private String n_content;
	private Date n_date;
	public int getRecord() {
		return record;
	}
	public void setRecord(int record) {
		this.record = record;
	}

	public String getN_tittle() {
		return n_tittle;
	}
	public void setN_tittle(String n_tittle) {
		this.n_tittle = n_tittle;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public Date getN_date() {
		return n_date;
	}
	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
	
}
