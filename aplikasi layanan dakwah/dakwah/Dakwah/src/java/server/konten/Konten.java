/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package server.konten;

import config.Connect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *

 */
@WebService(serviceName = "Konten")
public class Konten {

    @WebMethod(operationName = "addKonten")
    public String addKonten(@WebParam(name = "title") String title, 
            @WebParam(name = "link") String link, @WebParam(name = "description") String description, 
            @WebParam(name = "maker") String maker) {
        
        String sql = "INSERT INTO konten (title, link, description, maker) "
                + "VALUES "
                + "(?, ?, ?, ?)";
        try(
                PreparedStatement statement = Connect.getConnect().prepareStatement(sql)
                ){
            statement.setString(1, title);
            statement.setString(2, link);
            statement.setString(3, description);
            statement.setString(4, maker);

            int isCreated = statement.executeUpdate();
            
            if(isCreated > 0){
                return "Data Berhasil DiTambahkan";
            }
            
            return "Data Tidak Berhasil Ditamhakan";
        }catch (Exception exception){
            throw new RuntimeException(exception.getMessage());
        }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getKonten")
    public List<Object> getKonten(){
        String sql = "SELECT id_konten, title, link, description, maker, date FROM konten";
        List<Object> list = new ArrayList<>();
         try(
                 PreparedStatement st = Connect.getConnect().prepareStatement(sql);
                 ResultSet rs = st.executeQuery();
                 ){

             while(rs.next()){
                    int id = rs.getInt("id_konten");
                    String title = rs.getString("title");
                    String link = rs.getString("link");
                    String description = rs.getString("description");
                    String maker = rs.getString("maker");
                    String date = rs.getDate("date").toString(); // Mengambil tanggal dalam format string

                    list.add(
                        "<tr class=\"data\" onclick=\"edit(event)\">"
                        + "<td>" + id + "</td>"
                        + "<td>" + title + "</td>"
                        + "<td>" + link + "</td>"
                        + "<td>" + description + "</td>"
                        + "<td>" + maker + "</td>"
                        + "<td>" + date + "</td>"
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
    @WebMethod(operationName = "updateKonten")
    public String updateKonten(@WebParam(name = "title") String title,
            @WebParam(name = "link") String link, @WebParam(name = "description") String description,
            @WebParam(name = "maker") String maker ,@WebParam(name = "id") int id) {
        //TODO write your implementation code here:
        
        String sql = "UPDATE konten "
                + "SET title = ?, link = ?, description = ?, maker = ? "
                + "WHERE id_konten = ?";
        try(
                PreparedStatement statement = Connect.getConnect().prepareStatement(sql)
                ){
            statement.setString(1, title);
            statement.setString(2, link);
            statement.setString(3, description);
            statement.setString(4, maker);
            statement.setInt(5, id);

            int isCreated = statement.executeUpdate();
            
            if(isCreated > 0){
                return "Data Berhasil DiUpdate";
            }
            
            return "Data Tidak Berhasil DiUpdate";
        }catch (java.sql.SQLException exception){
            throw new RuntimeException(exception.getMessage());
        }
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "deleteKonten")
    public String deleteKonten(@WebParam(name = "ID") int ID) {
        //TODO write your implementation code here:
        String sql = "DELETE FROM konten WHERE id_konten = ?";
        
        try(
                PreparedStatement statement = Connect.getConnect().prepareStatement(sql)
                ){
            statement.setInt(1, ID);

            int isCreated = statement.executeUpdate();
            
            if(isCreated > 0){
                return "Data Berhasil DiHapus";
            }
            
            return "Data Tidak Berhasil DiHapus";
        }catch (java.sql.SQLException exception){
            throw new RuntimeException(exception.getMessage());
        }
    }
}
