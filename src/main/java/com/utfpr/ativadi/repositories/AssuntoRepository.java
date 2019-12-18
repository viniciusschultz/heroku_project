package com.utfpr.ativadi.repositories;

import com.utfpr.ativadi.entities.Assunto;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface AssuntoRepository extends CrudRepository<Assunto, Long> {

    @Query(value = "SELECT * FROM ativadi.assunto", nativeQuery = true)
    public List<Assunto> findAll();

    @Query(value = "SELECT * FROM ativadi.assunto a WHERE a.id = :id", nativeQuery = true)
    public Optional<Assunto> findById(@Param("id") Long id);
}
