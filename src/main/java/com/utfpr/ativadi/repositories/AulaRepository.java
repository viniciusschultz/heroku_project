package com.utfpr.ativadi.repositories;

import com.utfpr.ativadi.entities.AulaConcrete;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AulaRepository extends CrudRepository<AulaConcrete, Long> {
}
