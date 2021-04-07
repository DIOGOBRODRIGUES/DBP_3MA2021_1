/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dados;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author diogo
 */
public class Conexao {
    private static final String drive = "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost:3306/aula5";
    private static final String usuario = "root";
    private static final String senha = "root";
    
    public static Connection getConnection(){
        try {
            Class.forName(drive);
            return DriverManager.getConnection(url, usuario, senha);
        } catch (ClassNotFoundException | SQLException ErroSql) {
            throw new RuntimeException("Erro!não foi possivel conectar"+ErroSql);
        }
    }
    
    public static void closeConnection(Connection con){
        try {
            if(con!= null)
                con.close();
        } catch (SQLException ErroSql) {
            throw new RuntimeException("Erro!não foi possivel fechar"+ErroSql);
        }
    }
    
    
     public static void closeConnection(Connection con, PreparedStatement pstm){
        try {
            if(con!= null)
                con.close();
        } catch (SQLException ErroSql) {
            throw new RuntimeException("Erro!não foi possivel PreparedStatement"+ErroSql);
        }
    }
     public static void closeConnection(Connection con, ResultSet rs){
        try {
            if(con!= null)
                con.close();
        } catch (SQLException ErroSql) {
            throw new RuntimeException("Erro!não foi possivel ResultSet"+ErroSql);
        }
    }
      
    
}
