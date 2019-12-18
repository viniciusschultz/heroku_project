package com.utfpr.ativadi.entities;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Entity
@Table(name = "materia", schema = "ativadi")
public class Materia implements ComponenteMateria, Serializable {

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    protected long id;

    @NotBlank(message = "A Descrição é um campo obrigatório")
    @Column(name = "descricao")
    protected String descricao;

    @ManyToMany(cascade = CascadeType.DETACH)
    @JoinTable(name = "materia_assunto",
            joinColumns = @JoinColumn(name = "id_materia", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "id_assunto", referencedColumnName = "id", table = "assunto"))
    protected List<Assunto> assuntos;

    @NotNull(message = "O Grau Escolar é um campo obrigatório")
    protected int grau;

    @NotBlank(message = "O Objetivo é um campo obrigatório")
    protected String objetivos;

    @NotNull(message = "A Situação é um campo obrigatório")
    protected boolean ativo;

    public Materia(){}

    public Materia(long id, String descricao, int grau, String objetivos, boolean ativo) {
        this.id = id;
        this.descricao = descricao;
        this.grau = grau;
        this.objetivos = objetivos;
        this.ativo = ativo;
        this.assuntos = new ArrayList<>();
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

    public int getGrau() {
        return grau;
    }

    public void setGrau(int grau) {
        this.grau = grau;
    }

    public String getObjetivos() {
        return objetivos;
    }

    public void setObjetivos(String objetivos) {
        this.objetivos = objetivos;
    }

    public boolean isAtivo() {
        return ativo;
    }

    public void setAtivo(boolean ativo) {
        this.ativo = ativo;
    }

    public List<Assunto> getAssuntos() {
        return assuntos;
    }

    public void setAssuntos(List<Assunto> assuntos) {
        this.assuntos = assuntos;
    }

    public void Adicionar(Assunto assunto){
        assuntos.add(assunto);
    }

    public void Remover(Assunto assunto){
        assuntos.remove(assunto);
    }

    @Override
    public String toString() {
        return  "Materia{" +
                ", id=" + id +
                ", descricao=" + descricao +
                ", assuntos=" + assuntos.stream().map(n-> String.valueOf(n.getDescricao())).collect(Collectors.joining(",","{","}")) +
                ", grau=" + grau +
                ", objetivos='" + objetivos + '\'' +
                ", ativo=" + ativo +
                '}';
    }
}
