package hotel_data;

import java.io.Serializable;

public class Room_info implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String room_id;
	private int room_state;
	public Room_info()
	{
		
	}
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public int getRoom_state() {
		return room_state;
	}
	public void setRoom_state(int room_state) {
		this.room_state = room_state;
	}
	
}
