package com.utfpr.ativadi.entities;

import java.io.Serializable;

public class Mensagem implements Serializable {
    public enum Funcao {
        ALTERAR,
        REMOVER,
        ADICIONAR
    }

    private static Mensagem instance;
    public boolean sucess;
    public Funcao function;

    private Mensagem(boolean sucess, Funcao function) {
        this.sucess = sucess;
        this.function = function;
    }

    public static Mensagem getInstance(boolean sucess, Funcao function) {
        if (instance == null) {
            instance = new Mensagem(sucess, function);
        }else{
            instance.sucess = sucess;
            instance.function = function;
        }

        return instance;
    }

    public String show(){
        String result = "";

        if (sucess){
            if (function == Funcao.ADICIONAR)
                result = "Adicionado com Sucesso!";
            else if (function == Funcao.ALTERAR)
                result = "Alterado com Sucesso!";
            else
                result = "Removido com Sucesso!";
        }else{
            if (function == Funcao.ADICIONAR)
                result = "Erro ao Adicionar.";
            else if (function == Funcao.ALTERAR)
                result = "Erro ao Alterar.";
            else
                result = "Erro ao Remover.";
        }

        return result;
    }
}
