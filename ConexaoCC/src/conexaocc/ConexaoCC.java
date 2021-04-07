/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexaocc;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *+
 * @author diogo
 */
public class ConexaoCC {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        ConexaoCC conexao = new ConexaoCC();
        Connection con = conexao.conectar();
        conexao.desconectar(con);
    }
    
    public Connection conectar(){
        Connection con = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aula5","root","root");
            System.out.println("Conectou o banco de dados");
        } catch (SQLException ex) {
            System.out.println("Erro: não conectou no DB"+ex);
        } catch(ClassNotFoundException ex){
            System.out.println("Erro não encontrou o DB"+ex);
        }
        return con;
    }
    
    public void desconectar(Connection con){
        try {
            if(con!=null && !con.isClosed()){
                con.close();
                System.out.println("Desconectou do banco de dados");
            }
        } catch (SQLException ex) {
            System.out.println("Não consegiu desconectar o banco"+ex);
        }
        }
    
}
