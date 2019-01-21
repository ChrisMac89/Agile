/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package examWorkflow;


public class Login {
	
	// variable declarations
	String usrname;
	String pass;
	
	// constructor to initialise login obj
	public Login() {
		usrname = "";
		pass = "";
	}

	// getters and setters for variables
	public String getUsrname() {
		return usrname;
	}
	
	public String getPass() {
		return usrname;
	}
	
	public void setUsrname(String x) {
		usrname = x;
	}
	
	public void setPass(String x) {
		pass = x;
	}
	
	// query database for username
	public void queryUsrname(String username) {
		
	}
	
	// query database for password
	public void queryPass(String username) {
		
	}
	
	// verify if 2 passwords match or not 
	public boolean verifyPass(String password) {
		if(password == pass) { return true; }
		else { return false; }

	}
	
	
}
