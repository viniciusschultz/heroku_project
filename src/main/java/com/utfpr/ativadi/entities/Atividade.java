package com.utfpr.ativadi.entities;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
public class Atividade implements AtividadeFlyweight{

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    private long id;

    @NotBlank(message = "A Descrição é um campo obrigatório")
    private String descricao;

    @NotNull(message = "O Grau Escolar é um campo obrigatório")
    private int grau;

    private String urlExterna;

    public Atividade(){}

    public Atividade(long id, String descricao, int grau, String urlExterna) {
        this.id = id;
        this.descricao = descricao;
        this.grau = grau;
        this.urlExterna = urlExterna;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Override
    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getGrau() {
        return grau;
    }

    public void setGrau(int grau) {
        this.grau = grau;
    }

    public String getUrlExterna() {
        return urlExterna;
    }

    public void setUrlExterna(String urlExterna) {
        this.urlExterna = urlExterna;
    }

    @Override
    public String toString() {
        return "Atividade{" +
                "id=" + id +
                ", descricao='" + descricao + '\'' +
                ", grau=" + grau +
                ", urlExterna='" + urlExterna + '\'' +
                '}';
    }
}