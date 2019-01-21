package examWorkflow;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class testLogin {

	public Login login; 
	
	@BeforeEach
	void setUp() throws Exception {
		login = new Login();
		login.setUsrname("John");
		login.setPass("pass");
	}
	
	@Test
	public void testGetUsr() {
		login.setUsrname("d");
		String username = login.getUsrname();
		assertNotNull(username);
	}

}
