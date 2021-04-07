/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author diogo
 */
public class Curso {
    private int cod_curso;
    private int tot_cred;
    private String nome_curso;
    private int cood_curso;
    
    
    public Curso(){
        
    }

    public Curso(int cod_curso, int tot_cred, String nome_curso, int cood_curso) {
        this.cod_curso = cod_curso;
        this.tot_cred = tot_cred;
        this.nome_curso = nome_curso;
        this.cood_curso = cood_curso;
    }

    public int getCod_curso() {
        return cod_curso;
    }

    public void setCod_curso(int cod_curso) {
        this.cod_curso = cod_curso;
    }

    public int getTot_cred() {
        return tot_cred;
    }

    public void setTot_cred(int tot_cred) {
        this.tot_cred = tot_cred;
    }

    public String getNome_curso() {
        return nome_curso;
    }

    public void setNome_curso(String nome_curso) {
        this.nome_curso = nome_curso;
    }

    public int getCood_curso() {
        return cood_curso;
    }

    public void setCood_curso(int cood_curso) {
        this.cood_curso = cood_curso;
    }
    
    
}
