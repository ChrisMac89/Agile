/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import examWorkflow.Login;
import java.lang.reflect.Field;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Chris
 */
public class LoginTest {
    
    public LoginTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getUsrname method, of class Login.
     */
    @Test
    public void testGetUsrname() {
      //  System.out.println("getUsrname");
       // Login instance = new Login();
       // String expResult = "";
       // String result = instance.getUsrname();
        //assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
       // fail("The test case is a prototype.");
       
       Login l = new Login();
    	String empty = l.getUsrname(); //should be true
    	assertNotNull(empty);
    }

    /**
     * Test of getPass method, of class Login.
     */
    @Test
    public void testGetPass() {
        //System.out.println("getPass");
        //Login instance = new Login();
        //String expResult = "";
        //String result = instance.getPass();
        //assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
        
               Login l = new Login();
    	String empty = l.getPass(); //should be true
    	assertNotNull(empty);
    }
    
   
    /**
     * Test of setUsrname method, of class Login.
     */
/*    @Test
    public void testSetUsrname() {
        System.out.println("setUsrname");
        String x = "";
        Login instance = new Login();
        instance.setUsrname(x);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }*/

    /**
     * Test of setPass method, of class Login.
     */
    @Test
    public void testSetPass() {
        //creates an object for testing
        final Login login = new Login();
        //sets a function with the information inside of it as "foo"
        login.setPass("bar");
        //using the assert equals function, tests to see if they equal each other.
        assertEquals("Fields didn't match", login.getPass(), "bar");
    }

    /**
     * Test of queryUsrname method, of class Login.
     */
   /*@Test
    public void testQueryUsrname() {
        System.out.println("queryUsrname");
        String username = "";
        Login instance = new Login();
        instance.queryUsrname(username);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }*/

    /**
     * Test of queryPass method, of class Login.
     */
   /* @Test
    public void testQueryPass() {
        System.out.println("queryPass");
        String username = "";
        Login instance = new Login();
        instance.queryPass(username);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }*/

    /**
     * Test of verifyPass method, of class Login.
     */
    @Test
    public void testVerifyPass() {
        
        
        System.out.println("verifyPass");
        //testing to see if passwords match in the method. 
        String password = "";
        Login instance = new Login();
        
        //expected that the variables match. 
        boolean expResult = true;
        boolean result = instance.verifyPass(password);
        assertEquals(expResult, result);
       
    }
    
        @Test
    public void testSetUsrname() throws NoSuchFieldException, IllegalAccessException {
        //creates an object for testing
        final Login login = new Login();

        //sets a function with the information inside of it as "foo"
        login.setUsrname("foo");
        
        //using the assert equals function, tests to see if they equal each other.
        assertEquals("Fields didn't match", login.getUsrname(), "foo");
    }

    
}
