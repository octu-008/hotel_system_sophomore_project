package hotel_data;

import java.io.Serializable;

public class Room_detail implements Serializable {
 private String type;
 private String room_name;
 private Double price;
 private String factor;
 private int person;
 private String meal;
 private String img_path;
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getRoom_name() {
	return room_name;
}
public void setRoom_name(String room_name) {
	this.room_name = room_name;
}
public Double getPrice() {
	return price;
}
public void setPrice(Double price) {
	this.price = price;
}
public String getFactor() {
	return factor;
}
public void setFactor(String factor) {
	this.factor = factor;
}
public int getPerson() {
	return person;
}
public void setPerson(int person) {
	this.person = person;
}
public String getMeal() {
	return meal;
}
public void setMeal(String meal) {
	this.meal = meal;
}
public String getImg_path() {
	return img_path;
}
public void setImg_path(String img_path) {
	this.img_path = img_path;
}
 
}
