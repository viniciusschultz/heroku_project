package com.utfpr.ativadi.repositories;

import com.utfpr.ativadi.entities.Turma;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TurmaRepository extends CrudRepository<Turma, Long> {
}
