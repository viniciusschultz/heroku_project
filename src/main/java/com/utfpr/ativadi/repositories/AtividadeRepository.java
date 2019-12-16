package com.utfpr.ativadi.repositories;

import com.utfpr.ativadi.entities.Atividade;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface AtividadeRepository extends CrudRepository<Atividade, Long> {
    List<Atividade> findByDescricao(String descricao);
}
