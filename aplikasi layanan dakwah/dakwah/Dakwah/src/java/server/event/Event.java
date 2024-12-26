/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package server.event;

import config.Connect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * 
 */
@WebService(serviceName = "Event")
public class Event {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "addEvent")
    public String addEvent(@WebParam(name = "name") String name,
            @WebParam(name = "description") String description,
            @WebParam(name = "location") String location) {
        //TODO write your implementation code here:
        String sql = "INSERT INTO event (name, description, location, status) VALUES (?,?,?,?)";
        
        try(
                PreparedStatement statement = Connect.getConnect().prepareStatement(sql)
                ){
            statement.setString(1, name);
            statement.setString(2, description);
            statement.setString(3, location);
            statement.setString(4, "Belum DiMulai");
            
            statement.executeUpdate();
            
            return "Berhasil Menambahkan";
        }catch (Exception ex){
            return ex.getMessage();
        }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "updateEvent")
    public String updateEvent(@WebParam(name = "name") String name,
            @WebParam(name = "description") String description,
            @WebParam(name = "location") String location,
            @WebParam(name = "id") int ID) {
        //TODO write your implementation code here:
        String sql = "UPDATE event "
                + "SET name = ?, description = ?, location = ?"
                + " WHERE event_id = ?";
        
        try(
                PreparedStatement statement = Connect.getConnect().prepareStatement(sql)
                ){
            statement.setString(1, name);
            statement.setString(2, description);
            statement.setString(3, location);
            statement.setInt(4, ID);
            
            int status = statement.executeUpdate();
            
            if(status > 0){
                return "Berhasi Update";
            }
            
            return "Gagal Update";
        }catch (Exception ex){
            return ex.getMessage();
        }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getEvent")
    public List<Object> getEvent() {
        //TODO write your implementation code here:
        String sql = "SELECT event_id, name, description, date, location, status FROM event";
        List<Object> list = new ArrayList<>();
         try(
                 PreparedStatement st = Connect.getConnect().prepareStatement(sql);
                 ResultSet rs = st.executeQuery();
                 ){

             while(rs.next()){
                    int id = rs.getInt("event_id");
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    String date = rs.getDate("date").toString();
                    String location = rs.getString("location");
                    String status = rs.getString("status"); // Mengambil tanggal dalam format string

                    list.add(
                        "<tr class=\"data\" onclick=\"edit(event)\">"
                        + "<td>" + id + "</td>"
                        + "<td>" + name + "</td>"
                        + "<td>" + description + "</td>"
                        + "<td>" + date + "</td>"
                        + "<td>" + location + "</td>"
                        + "<td>" + status + "</td>"
                        + "</tr>"
                    );

             }
             return list;
         }catch (Exception exception){
             throw new RuntimeException(exception.getMessage());
         }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "delete")
    public String delete(@WebParam(name = "id") int id) {
        //TODO write your implementation code here:
        String sql = "DELETE FROM event WHERE event_id = ?";
        
        try(
                PreparedStatement statement = Connect.getConnect().prepareStatement(sql)
                ){
            statement.setInt(1, id);

            int isCreated = statement.executeUpdate();
            
            if(isCreated > 0){
                return "Data Berhasil DiHapus";
            }
            
            return "Data Tidak Berhasil DiHapus";
        }catch (java.sql.SQLException exception){
            throw new RuntimeException(exception.getMessage());
        }
    }
    
    
    
    
    

    /**
     * This is a sample web service operation
     */
    
    
    
}
