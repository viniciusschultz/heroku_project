package com.utfpr.ativadi.entities;

import java.text.Normalizer;
import java.util.HashMap;

public class AtividadeFactory {
    private static HashMap<String, AtividadeFlyweight> cacheAtividade = new HashMap<String, AtividadeFlyweight>();

    public static void loadCache(Iterable<Atividade> allActivities){
        for (AtividadeFlyweight oldAct:  allActivities)
            cacheAtividade.put(removerAcentos(oldAct.getDescricao().toUpperCase()), oldAct);
    }

    public static AtividadeFlyweight getAtividade(Atividade atividade){
        AtividadeFlyweight result = cacheAtividade.get(removerAcentos(atividade.getDescricao().toUpperCase()));
        if (result == null) {
            result = atividade;
            cacheAtividade.put(removerAcentos(atividade.getDescricao().toUpperCase()), result);
        }
        return result;
    }

    private static String removerAcentos(String valorAcentuado){
        return Normalizer
               .normalize(valorAcentuado, Normalizer.Form.NFD)
               .replaceAll("[^\\p{ASCII}]", "");
    }


}
