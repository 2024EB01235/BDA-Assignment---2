package com.example.healthcaresystem.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.healthcaresystem.model.Doctor;

@Repository

public interface DoctorRepository extends JpaRepository<Doctor, Long> {

    @Query("SELECT D FROM Doctor D JOIN FETCH D.hospital ORDER BY D.id ASC")
    List<Doctor> findAllDoctorsWithHospitals();

}