/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Alvise
 */
public class Log {
    private static BufferedWriter Bw=null;
    
    public static void write(String s){
        
        if(Bw==null)
            try {
                Bw=new BufferedWriter((new FileWriter("C:\\Users\\Utente\\Desktop\\log.txt",true)));
            DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            Date date = new Date();
            String d=dateFormat.format(date);
            Bw.newLine();
            Bw.append(d+": ");
            Bw.append(s);
            Bw.close();
            Bw=null;
        } catch (IOException ex) {
            Logger.getLogger(Log.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    
}
