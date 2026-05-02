package com.example.healthcaresystem.repository;

import com.example.healthcaresystem.model.Hospital;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository

public interface HospitalRepository extends JpaRepository<Hospital, Long> {
    
}