/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dados.Conexao;
import modelo.Curso;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author diogo
 */
public class CursoDao {
    
    public void adicionar (Curso curso){
        Connection con = Conexao.getConnection();
        PreparedStatement pstm = null;
        
        try {
            pstm = con.prepareStatement("insert into Curso (tot_cred, nome_curso, cood_curso) values (?, ?, ?)");
            pstm.setString(1,Integer.toString(curso.getTot_cred()));
            pstm.setString(2, curso.getNome_curso());
            pstm.setInt(3, curso.getCood_curso());
            
            pstm.execute();
            JOptionPane.showMessageDialog(null, "Adicionado com Sucesso", "Sucesso", JOptionPane.INFORMATION_MESSAGE);
                    
        } catch (SQLException ErroSql) {
            JOptionPane.showMessageDialog(null, "Erro ao adicionar ao Banco", "Erro", JOptionPane.ERROR_MESSAGE);
        }
        
        finally{
            Conexao.closeConnection(con, pstm);
    }
        
    }
    
}
