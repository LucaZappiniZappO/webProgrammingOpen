/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package system;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 *
 * @author Alvise
 */
public class Config{
    private static String fileName="config.properties";
    private static String fileLocation="";
    private static InputStream input=null;    
    private static Properties prop=null;
    
    private static boolean init(){
        if(input!=null && prop!=null)
            return true;
        try {
            input = new FileInputStream(fileLocation+"\\"+fileName);
            prop=new Properties();
            prop.load(input);
        } catch (IOException ex) {
            Log.write(ex.toString());
            return false;
        }
        return true;
    }
    
    public static void changeFileLocation(String fileName, String fileLocation){
       Config.fileLocation=fileLocation;
       Config.fileName=fileName;
    }
    
    public static String getProperty(String property){
        if(!init())
            return null;
        return prop.getProperty(property);
    }
    
    public  static boolean setProperty(String property,String value){
        if(!init())
            return false;
        return prop.setProperty(value, value)!=null;
        
    }
}