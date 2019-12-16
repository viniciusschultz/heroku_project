package com.utfpr.ativadi.entities;

public interface ComponenteMateria {
    public long getId();

    public void setId(long id);

    public String getDescricao();

    public void setDescricao(String descricao);

    @Override
    public String toString();
}
