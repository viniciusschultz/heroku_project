package com.utfpr.ativadi.entities;

import org.hibernate.annotations.GenericGenerator;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.List;

@Entity
@Table(name = "assunto", schema = "ativadi")
public class Assunto implements ComponenteMateria{

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    protected long id;

    @NotBlank(message = "A Descrição é um campo obrigatório")
    @Column(name = "descricao")
    protected String descricao;

    @ManyToMany(mappedBy = "assuntos")
    private List<Materia> materias;

    public Assunto(){}

    public Assunto(long id, String descricao) {
        this.id = id;
        this.descricao = descricao;
    }

    @Override
    public long getId() {
        return id;
    }

    @Override
    public void setId(long id) {
        this.id = id;
    }

    @Override
    public String getDescricao() {
        return descricao;
    }

    @Override
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public List<Materia> getMaterias() {
        return materias;
    }

    public void setMaterias(List<Materia> materias) {
        this.materias = materias;
    }

    public String allMaterias(){
        StringBuilder sb = new StringBuilder();
        for (Materia m : materias) {
            sb.append(m.getDescricao());
        }

        return sb.toString();
    }

    @Override
    public String toString() {

        return  "Assunto{" +
                ", id=" + id +
                ", descricao=" + descricao +
                ", materias=" + allMaterias() +
                '}';
    }
}
