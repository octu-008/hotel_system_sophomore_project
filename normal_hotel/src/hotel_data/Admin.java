package hotel_data;

import java.io.Serializable;
import java.sql.Date;

public class Admin implements Serializable{
  
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private int admin_id;
    private String admin_name;
    private String admin_password;
    private Date admin_entry;
    private String s_admin_entry;
    public Admin()
    {
    	
    }
public int getAdmin_id() {
	return admin_id;
}
public void setAdmin_id(int admin_id) {
	this.admin_id = admin_id;
}
public String getAdmin_name() {
	return admin_name;
}
public void setAdmin_name(String admin_name) {
	this.admin_name = admin_name;
}
public String getAdmin_password() {
	return admin_password;
}
public void setAdmin_password(String admin_password) {
	this.admin_password = admin_password;
}
public Date getAdmin_entry() {
	return admin_entry;
}
public void setAdmin_entry(Date admin_entry) {
	this.admin_entry = admin_entry;
}
public String getS_admin_entry() {
	return s_admin_entry;
}
public void setS_admin_entry(String s_admin_entry) {
	this.s_admin_entry = s_admin_entry;
}
  
}
