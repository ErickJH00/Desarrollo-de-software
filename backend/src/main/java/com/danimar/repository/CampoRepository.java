package com.danimar.repository;

import com.danimar.model.Campo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CampoRepository extends JpaRepository<Campo, Long> {
    List<Campo> findByExamenId(Long examenId);
}
