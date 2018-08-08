package dao;

import java.util.*;

import vo.Things;
import vo.User;

public interface DaoI {
	User getLogin(String uname,String pwd);
	List<User> getUsers();
	void regUser(String id,String name, String pwd);
	TreeSet<String> getstartLetter();
	List<Things> getbyStart(String sl);
	List<Things> getsbyStart(String[] sl);
	TreeSet<Things> getsbyStartId(String[] sl);
	int getThingId();
	void createThing(String id,String name,String slet,String iname,String idesc);
	TreeSet<String> getThingNames();
	String getDesc(String str1);
	void UpdateSpell(String s1,String s2);
	void UpdateDesc(String s1,String s2);
	List<Things> getEverything();
	void RemoveWord(String[] arr);
}
