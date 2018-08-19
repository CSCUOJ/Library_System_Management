/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sgc.data;

import com.sgc.model.Classification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Anushanth
 */
public class SubClassificationDao {
    
    Connection connection = DatabaseConnect.getConnection();
    PreparedStatement statement;
        
    public void insertSub(Classification sub) throws SQLException{        
        
        String insertBook = "INSERT INTO sub (SCID,SCName,MCID) VALUES (?,?,?)";
        statement = connection.prepareStatement(insertBook);
        statement.setString(1,sub.getSubId());
        statement.setString(2, sub.getSubClass());
        statement.setString(3,sub.getMainId());
        statement.executeUpdate();
        
        DatabaseConnect.disconnect();
    }
    
    public List<Classification> searchSub(String txtSearchSub) throws SQLException{
        
        List <Classification> result = new ArrayList<>();
        
        String showSQL = "SELECT * FROM sub s INNER JOIN main m ON s.MCID = m.MCID WHERE s.MCID LIKE ? OR SCName LIKE ? OR MCName LIKE ?";
        
        statement = connection.prepareStatement(showSQL);
        statement.setString(1,txtSearchSub+"%");
        statement.setString(2,txtSearchSub+"%");
        statement.setString(3,txtSearchSub+"%");

        ResultSet rsShow =  statement.executeQuery();
        
        while(rsShow.next()){
            Classification sub = new Classification();
            sub.setSubId(rsShow.getString("SCID"));
            sub.setMainClass(rsShow.getString("MCName"));
            sub.setSubClass(rsShow.getString("SCName"));
            
            result.add(sub);        
        }
        DatabaseConnect.disconnect();
        return result;    
    }
    
    public List<Classification> viewSub() throws SQLException{
        
        List <Classification> result = new ArrayList<>();
                
        String showSQL = "SELECT * FROM sub s INNER JOIN main m ON s.MCID=m.MCID";
        
        statement = connection.prepareStatement(showSQL);
        ResultSet rsShow =  statement.executeQuery();
        
        while(rsShow.next()){
            Classification sub = new Classification();
            sub.setSubId(rsShow.getString("SCID"));
            sub.setSubClass(rsShow.getString("SCName"));
            sub.setMainClass(rsShow.getString("MCName"));
            result.add(sub);        
        }
        DatabaseConnect.disconnect();
        return result;    
    }
    
    public String getSubId() throws SQLException{
        
        String showSQL = "SELECT SCID FROM sub ORDER BY SCID";
        
        statement = connection.prepareStatement(showSQL);
        ResultSet rsShow =  statement.executeQuery();
        String scid = null;
        while(rsShow.next()){
            scid = rsShow.getString("SCID");
        }
        DatabaseConnect.disconnect();
        return scid;    
    }
    
    public void deleteSub(String id) throws SQLException{
        
        String showSQL = "DELETE FROM sub WHERE SCID = ?";        
        statement = connection.prepareStatement(showSQL);
        statement.setString(1, id);
        statement.executeUpdate();
        DatabaseConnect.disconnect();
    }
    
    public int countMain(String mcid) throws SQLException{
        
        String sql = "SELECT * FROM sub WHERE MCID = ?";        
        statement = connection.prepareStatement(sql);
        statement.setString(1, mcid);
        ResultSet rsBook = statement.executeQuery();
        int count = 0;
        while(rsBook.next()){
              count ++;          
        }
        DatabaseConnect.disconnect();
        return count;    
    }
    
    public Classification populateSub(String subId) throws SQLException {
        Classification sub = new Classification();

        String showSQL = "SELECT * FROM sub WHERE SCID = ?";

        statement = connection.prepareStatement(showSQL);
        statement.setString(1, subId);
        ResultSet rsMain = statement.executeQuery();

        while (rsMain.next()) {
            sub.setSubId(rsMain.getString("SCID"));
            sub.setMainId(rsMain.getString("MCID"));
            sub.setSubClass(rsMain.getString("SCName"));
        }
        DatabaseConnect.disconnect();
        return sub;
    }
    
    public void updateSub(Classification sub) throws SQLException{
        
        String insertBook = "UPDATE sub SET SCName = ? , MCID = ? WHERE SCID = ?";
        statement = connection.prepareStatement(insertBook);
        
        statement.setString(1, sub.getSubClass());
        statement.setString(2,sub.getMainId());
        statement.setString(3,sub.getSubId());
        statement.executeUpdate();
        
        DatabaseConnect.disconnect();
    }
}
