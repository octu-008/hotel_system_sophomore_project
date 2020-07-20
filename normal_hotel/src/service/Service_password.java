package service;

public class Service_password {
	public String lockOn(String source)
	{
		String after="";
		char[] p=source.toCharArray();
		int n=p.length;
		char[] after_c=new char[n];
		for(int k=0;k<n;k++)
		{
			int lockp=p[k]+9;
			after_c[k]=(char)lockp;
		}
		after=new String(after_c);
		return after;
	}
   public String lockOff(String source)
   {
	   String after="";
		char[] p=source.toCharArray();
		int n=p.length;
		char[] after_c=new char[n];
		for(int k=0;k<n;k++)
		{
			int lockp=p[k]-9;
			after_c[k]=(char)lockp;
		}
		after=new String(after_c);
	   return after;
   }
}
