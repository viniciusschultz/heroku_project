package com.utfpr.ativadi.entities;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "atividade", schema = "ativadi")
public class Atividade implements AtividadeFlyweight{

    @Id
    private long id;

    @NotBlank(message = "A Descrição é um campo obrigatório")
    private String descricao;

    @NotNull(message = "O Grau Escolar é um campo obrigatório")
    private int grau;

    @Column(name = "url_externa")
    private String url_externa;

    public Atividade(){}

    public Atividade(long id, String descricao, int grau, String url_externa) {
        this.id = id;
        this.descricao = descricao;
        this.grau = grau;
        this.url_externa = url_externa;
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

    public String getUrl_externa() {
        return url_externa;
    }

    public void setUrl_externa(String url_externa) {
        this.url_externa = url_externa;
    }

    @Override
    public String toString() {
        return "Atividade{" +
                "id=" + id +
                ", descricao='" + descricao + '\'' +
                ", grau=" + grau +
                ", url_externa='" + url_externa + '\'' +
                '}';
    }
}
