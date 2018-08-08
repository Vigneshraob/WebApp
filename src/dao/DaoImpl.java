package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.io.InputStream;

import vo.Things;
import vo.User;

public class DaoImpl extends AbsDao implements DaoI {

	private static DaoI daoi;

	private DaoImpl() {
	}

	public static DaoI getInstance() {
		daoi = new DaoImpl();
		return daoi;
	}

	
	public User getLogin(String uname, String pwd) {
		Connection conn = null;
		User user = null;
		try {
			conn = getConn();
			String sql = "select * from login where name=? and pwd=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, pwd);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setUserid(rs.getString(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeConn(conn);
		}
		return user;
	}

	
	public List<User> getUsers() {
		Connection conn = null;
		List<User> ul = new ArrayList<User>();
		try {
			conn = getConn();
			String sql = "select * from login";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUserid(rs.getString(1));
				user.setUsername(rs.getString(2));
				user.setPassword(rs.getString(3));
				ul.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(conn);
		}
		return ul;
	}

	
	public void regUser(String id, String name, String pwd) {
		Connection conn = null;
		try {
			conn = getConn();
			String sql = "Insert into login values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(id));
			ps.setString(2, name);
			ps.setString(3, pwd);
			int rows = ps.executeUpdate();
			System.out.println(rows + " updated");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(conn);
		}
	}

	
	public TreeSet<String> getstartLetter() {
		Connection conn = null;
		TreeSet<String> stt = new TreeSet<String>();
		try {
			conn = getConn();
			String sql = "Select tstart from things";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				stt.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(conn);
		}
		return stt;
	}

	
	public List<Things> getbyStart(String sl) {
		Connection conn = null;
		List<Things> tlaccsl = new ArrayList<Things>();
		try {
			conn = getConn();
			String sql = "select * from things where tstart=? order by tname";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, sl);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Things th = new Things();
				th.setTid(rs.getString(1));
				th.setTname(rs.getString(2));
				th.setTstart(rs.getString(3));
				th.setTimage(rs.getString(4));
				th.setTdesc(rs.getString(5));
				tlaccsl.add(th);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(conn);
		}
		return tlaccsl;
	}

	
	public List<Things> getsbyStart(String[] sl) {
		Connection conn = null;
		List<Things> tlaccsl = new ArrayList<Things>();
		String query = "";
		for (int i = 0; i < sl.length; i++) {
			if (i == (sl.length - 1))
				query += "?) order by tstart,tname";
			else
				query += "?,";

		}
		String sql = "Select * from things where tstart in (" + query;
		
		try {
			conn = getConn();
			PreparedStatement ps = conn.prepareStatement(sql);
			for (int j = 0; j < sl.length; j++)
				ps.setString(j + 1, sl[j]);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Things th = new Things();
				th.setTid(rs.getString("tid"));
				th.setTname(rs.getString("tname"));
				th.setTimage(rs.getString("timage"));
				th.setTdesc(rs.getString("tdesc"));
				th.setTstart(rs.getString("tstart"));
				tlaccsl.add(th);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(conn);
		}
		return tlaccsl;
	}

	
	public int getThingId() {
		Connection conn = null;
		int rows = 0;
		try {
			conn = getConn();
			String sql = "select max(tid)  from things";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				rows = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(conn);
		}
		return rows;
	}

	
	public void createThing(String id, String name, String slet, String iname,
			String idesc) {
		Connection conn = null;
		try {
			conn = getConn();
			String sql = "Insert into things values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, slet);
			ps.setString(4, iname);
			ps.setString(5, idesc);
			int rs = ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} 
		finally {
			closeConn(conn);
		}

	}

	
	public TreeSet<String> getThingNames() {
		Connection conn = null;
		TreeSet<String> lst=new TreeSet<String>();
		try {
			conn = getConn();
			String sql = "select tname from things";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				lst.add(rs.getString(1));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			closeConn(conn);
		}

		return lst;
	}

	
	public void UpdateSpell(String s1, String s2) {
		Connection conn = null;
		int row=0;
		try {
			conn=getConn();
			String sql="Update things set tname=? where tname=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(2, s1);
			ps.setString(1, s2);
			System.out.println(ps);
			row=ps.executeUpdate();
			System.out.println(row+" row is updated");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConn(conn);
		}

		
	}

	
	public String getDesc(String str1) {
		Connection conn=null;
		String str=null;
		try {
			conn=getConn();
			String sql="select tdesc from things where tname=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, str1);
			System.out.println(ps);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
			str=rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConn(conn);
		}
		return str;
	}

	
	public void UpdateDesc(String s1, String s2) {
		Connection conn = null;
		try {
			conn=getConn();
			String sql="Update things set tdesc=? where tname=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, s1);
			ps.setString(2, s2);
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConn(conn);
		}

		
	}

	
	public List<Things> getEverything() {
		Connection conn = null;
		List<Things> lst= new ArrayList<Things>();
		try {
			conn=getConn();
			String sql="Select * from things order by tname";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Things th= new Things();
				th.setTdesc(rs.getString(5));
				th.setTname(rs.getString(2));
				th.setTimage(rs.getString(4));
				lst.add(th);
				}} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				closeConn(conn);
			}
		return lst;
	}

	
	public void RemoveWord(String[] arr) {
		Connection conn = null;
		int ind=1;
		try {
			conn=getConn();
			String sql="delete from things where tname in (";
			int len = arr.length;
			for(int idx=0;idx<len;idx++){
				if(idx==len-1){
					sql+="? )";
				}else{
					sql+="?,";
				}}
			PreparedStatement ps= conn.prepareStatement(sql);
			for(int idx=0;idx<arr.length;idx++){
				ps.setString(ind,arr[idx]);
			}
			
			ps.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeConn(conn);
		}
	}

	
	public TreeSet<Things> getsbyStartId(String[] sl) {
		Connection conn = null;
		TreeSet<Things>setth = new TreeSet<Things>();
		String query = "";
		for (int i = 0; i < sl.length; i++) {
			if (i == (sl.length - 1))
				query += "?) order by tid,tname";
			else
				query += "?,";

		}
		String sql = "Select * from things where tid in (" + query;
		
		try {
			conn = getConn();
			PreparedStatement ps = conn.prepareStatement(sql);
			for (int j = 0; j < sl.length; j++)
				ps.setString(j + 1, sl[j]);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Things th = new Things();
				th.setTname(rs.getString("tname"));
				th.setTimage(rs.getString("timage"));
				th.setTdesc(rs.getString("tdesc"));
				th.setTstart(rs.getString("tstart"));
				setth.add(th);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(conn);
		}
		return setth;
	}
		
}