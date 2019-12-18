package com.utfpr.ativadi.repositories;

import com.utfpr.ativadi.entities.Professor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface ProfessorRepository extends CrudRepository<Professor, Long> {
    @Query(value = "SELECT * FROM ativadi.professor", nativeQuery = true)
    public List<Professor> findAll();

    @Query(value = "SELECT * FROM ativadi.professor p WHERE p.id = :id", nativeQuery = true)
    public Optional<Professor> findById(@Param("id") Long id);
}
