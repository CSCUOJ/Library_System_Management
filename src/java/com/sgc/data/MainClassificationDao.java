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
public class MainClassificationDao {
    
    Connection connection = DatabaseConnect.getConnection();
    PreparedStatement statement;
    
    public void insertMain( Classification main) throws SQLException{
        
        String insertSQL = "INSERT INTO main (MCID,MCName) VALUES (?,?)";
        statement = connection.prepareStatement(insertSQL);
        statement.setString(1,main.getMainId());
        statement.setString(2,main.getMainClass());
        statement.executeUpdate();        
        DatabaseConnect.disconnect();
    }
    
    public List<Classification> searchMain(String txtSearchMain) throws SQLException{
        
        List <Classification> result = new ArrayList<>();
        
        String showSQL = "SELECT * FROM main WHERE MCName LIKE ?";
        
        statement = connection.prepareStatement(showSQL);
        statement.setString(1,txtSearchMain+"%");
        ResultSet rsShow =  statement.executeQuery();
        
        while(rsShow.next()){
            Classification main = new Classification();
            main.setMainId(rsShow.getString("MCID"));
            main.setMainClass(rsShow.getString("MCName"));            
            result.add(main);        
        }
        DatabaseConnect.disconnect();
        return result;
    
    }
    
    public List<Classification> viewMain() throws SQLException{
        List <Classification> result = new ArrayList<>();
        
        String showSQL = "SELECT * FROM main";
        
        statement = connection.prepareStatement(showSQL);
        ResultSet rsShow =  statement.executeQuery();
        
        while(rsShow.next()){
            Classification main = new Classification();
            main.setMainId(rsShow.getString("MCID"));
            main.setMainClass(rsShow.getString("MCName"));            
            result.add(main);        
        }
        DatabaseConnect.disconnect();
        return result;
    
    }
    
    public String getMainId() throws SQLException{
        
        String getIdSQL = "SELECT MCID FROM main ORDER BY MCID";
        
        statement = connection.prepareStatement(getIdSQL);
        ResultSet rsShow =  statement.executeQuery();
        String mcid =null;
        while(rsShow.next()){            
            mcid = rsShow.getString("MCID");                   
        }
        DatabaseConnect.disconnect();
        return mcid;
    }
    public void deleteMain(String id) throws SQLException{
        
        String deleteSQL = "DELETE FROM main WHERE MCID = ?";        
        statement = connection.prepareStatement(deleteSQL);
        statement.setString(1, id);
        statement.executeUpdate();
        DatabaseConnect.disconnect();
    }
    
    public Classification populateMain(String mainId) throws SQLException {
        
        Classification main = new Classification();
        
        String showSQL = "SELECT * FROM main WHERE MCID = ?";
        
        statement = connection.prepareStatement(showSQL);
        statement.setString(1, mainId);
        ResultSet rsMain = statement.executeQuery();

        while (rsMain.next()) {
            main.setMainId(rsMain.getString("MCID"));
            main.setMainClass(rsMain.getString("MCName"));
        }
        DatabaseConnect.disconnect();
        return main;
    }
    
    public void updateMain( Classification main) throws SQLException{
        
        String updateSQL = "UPDATE main SET MCName = ? WHERE MCID = ?";
        statement = connection.prepareStatement(updateSQL);        
        statement.setString(1,main.getMainClass());
        statement.setString(2,main.getMainId());
        statement.executeUpdate();        
        DatabaseConnect.disconnect();
    }
}
