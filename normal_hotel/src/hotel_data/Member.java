package hotel_data;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int account;
	private String m_name;
	private String m_gender;
	private Date m_entry;
	private String s_m_entry;
	private String m_password;
	private String m_email;
	private String m_address;
	private String m_paper;
	public Member()
	{
		
	}
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public Date getM_entry() {
		return m_entry;
	}
	public void setM_entry(Date m_entry) {
		this.m_entry = m_entry;
	}
	public String getS_m_entry() {
		return s_m_entry;
	}
	public void setS_m_entry(String s_m_entry) {
		this.s_m_entry = s_m_entry;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public String getM_paper() {
		return m_paper;
	}
	public void setM_paper(String m_paper) {
		this.m_paper = m_paper;
	}
	
	
}
