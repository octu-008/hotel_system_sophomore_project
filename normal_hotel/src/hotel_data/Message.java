package hotel_data;

import java.io.Serializable;

public class Message implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int record;
	private String msg_name;
	private String msg_contact;
	private String msg_content;
	public Message()
	{
		
	}
	public int getRecord() {
		return record;
	}
	public void setRecord(int record) {
		this.record = record;
	}
	public String getMsg_name() {
		return msg_name;
	}
	public void setMsg_name(String msg_name) {
		this.msg_name = msg_name;
	}
	public String getMsg_contact() {
		return msg_contact;
	}
	public void setMsg_contact(String msg_contact) {
		this.msg_contact = msg_contact;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	
}
