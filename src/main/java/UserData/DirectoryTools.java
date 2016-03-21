package UserData;
import java.io.*;
public class DirectoryTools {
	public void createDirectory (String dirname) {
	
	    System.out.println("Creating Directory in Java");
	
	    
	    File dir = new File(dirname);
	 
	    dir.mkdirs();
	    
	    System.out.println("New directory created !!!");
	}
}
