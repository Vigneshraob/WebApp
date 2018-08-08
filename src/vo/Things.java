package vo;

import java.util.Comparator;

public class Things implements Comparable<Things> {

	private String tid;
	private String tname;
	private String tstart;
	private String timage;
	private String tdesc;
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTstart() {
		return tstart;
	}
	public void setTstart(String tstart) {
		this.tstart = tstart;
	}
	public String getTimage() {
		return timage;
	}
	public void setTimage(String timage) {
		this.timage = timage;
	}
	public String getTdesc() {
		return tdesc;
	}
	public void setTdesc(String tdesc) {
		this.tdesc = tdesc;
	}
	@Override
	public String toString() {
		return tid+" "+tname+" "+tstart+" "+timage+" "+" "+tdesc;
	}

	public int compareTo(Things o) {
		String s1=this.getTname();
		String s2=o.tname;
		return s1.compareTo(s2);
	}
	
	
	
}
