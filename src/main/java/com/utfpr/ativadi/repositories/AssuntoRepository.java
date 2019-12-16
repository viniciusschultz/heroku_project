package com.utfpr.ativadi.repositories;

import com.utfpr.ativadi.entities.Assunto;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AssuntoRepository extends CrudRepository<Assunto, Long> {
}
