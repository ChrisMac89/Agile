/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common_things;

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
public class CommentRetrievingTest {

    public CommentRetrievingTest() {
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
     * Test of receiveComment method, of class CommentRetrieving.
     */
    //First test passed to make sure that the method isn't returning a null
    /*@Test
    public void testReceiveComment() 
    {
        String n = "";
        CommentRetrieving comment = new CommentRetrieving();
        n = comment.receiveComment(n);
        assertNotNull(n);
    }*/


    //}
    //This will test to see if a stored comment can be displayed on screen. 
    /*@Test
    public void testReceiveComment() {

        String x = "";
        CommentRetrieving comment = new CommentRetrieving();
        x = comment.receiveComment(x);
        System.out.println(x);
    }*/
    
    
    //checks to see if an incorrect entry returns false. If it does it passes.
    /* @Test
    public void testIncorrectEntry() {

        //sets boolean to true to make sure it changes
        boolean x = true;
        CommentRetrieving comment = new CommentRetrieving();
        x = comment.incorrectEntry();
        System.out.println(x);
        assertFalse(x);
    }*/
    
    
    //This test will be used to see if data is matching it's expected output
    //Test passed 100% 
    @Test
    public void testMatchingData()
    {
        String matching = "test";
        String match = "";
        CommentRetrieving comment = new CommentRetrieving();
        match = comment.receiveComment(match);
        
        assertEquals("these variable do not match.", matching, match);
    }

}


