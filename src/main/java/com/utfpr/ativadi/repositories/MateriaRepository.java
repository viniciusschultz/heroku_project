package com.utfpr.ativadi.repositories;

import com.utfpr.ativadi.entities.Materia;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MateriaRepository extends CrudRepository<Materia, Long> {
}
