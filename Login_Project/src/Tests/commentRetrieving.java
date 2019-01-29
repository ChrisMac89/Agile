/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package examWorkflow;

import java.util.Scanner;

/**
 *
 * @author Chris
 */
public class CommentRetrieving {

    public String receiveComment(String n) {
        
        if (n != null) 
        {
            //this function will return a string to match with the one in 
            //the rest
            n = "test";
            System.out.println(n);
            return n;
        } 
        
        else 
        {
            return null;
        }

    }
    
    public boolean incorrectEntry()
    {
        return false;
    }
    
    
}

}
