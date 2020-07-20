package hotel_data;

import java.io.Serializable;

public class DataList implements Serializable{
	private Object[] list;
	private int length=0;
	public DataList()
	{
		
	}
    public void add(Object item)
    {
    	if(length==0)
    	{
    		length++;
    	    list=new Object[1];
    	    list[0]=item;
    	}
    	else
    	{
    		Object[] term=list;
    		length++;
    		list=new Object[length];
    		for(int i=0;i<length-1;i++)
    		{
    			list[i]=new Object();
    			list[i]=term[i];
    		}
    		list[length-1]=new Object();
    		list[length-1]=item;
    	}
    }
	public Object[] getList() {
		return list;
	}
	public void setList(Object[] list) {
		this.list = list;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	
}
