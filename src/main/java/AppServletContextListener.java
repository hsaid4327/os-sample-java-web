
import java.io.*;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class AppServletContextListener implements ServletContextListener {

    private static Properties properties = new Properties();

    static {
         //load properties file
                 try {
                             // absolute path on server outside the war 
                                         // where properties files are stored
                	        
                             
                             String absolutePath = "/tmp/schools-first/application.properties"; 
                             File file = new File(absolutePath);
                             properties.load(new FileInputStream(file));
                             String value = properties.getProperty("test");
                             
                             
                        } catch (Exception e) {
                                 e.printStackTrace();
                        }
        }

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	public void contextInitialized(ServletContextEvent arg0) {
		
		
	}

 }
        
                                                                                                       
