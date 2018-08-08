package web;

import java.util.Set;
import java.util.TreeSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


import dao.DaoI;
import dao.DaoImpl;

/**
 * Application Lifecycle Listener implementation class MyListener
 *
 */
public class MyListener implements ServletContextListener {

  
    public void contextInitialized(ServletContextEvent event)  { 
        DaoI daoi=DaoImpl.getInstance();
        TreeSet<String> st=daoi.getstartLetter();
        ServletContext sc= event.getServletContext();
        sc.setAttribute("Start", st);
        
    }

	
   
    public void contextDestroyed(ServletContextEvent arg0)  { 
         System.out.println("context destroyed");
    }
	
}
