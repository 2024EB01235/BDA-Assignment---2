package com.example.healthcaresystem.service;

import com.example.healthcaresystem.model.*;
import com.example.healthcaresystem.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service

public class HealthcareSystemService {

    @Autowired

    private DoctorRepository doctorRepository;

    @Autowired

    private HospitalRepository HospitalRepository;

    public List<Doctor> getAllDoctors() {

        return doctorRepository.findAllDoctorsWithHospitals();

    }

    public List<Hospital> getAllHospitals() {

        return HospitalRepository.findAll();
    }

    public void saveDoctor (Doctor doctor) {

        doctorRepository.save(doctor);
    }

    public Doctor getDoctorById(Long id) {

        return doctorRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid Doctor ID:" + id));
    }

    public void updateDoctor(Long id, Doctor updateDoctor) {

        Doctor existingDoctor = getDoctorById(id);
        
        existingDoctor.setName(updateDoctor.getName());

        existingDoctor.setSpecialization(updateDoctor.getSpecialization());

        existingDoctor.setHospital(updateDoctor.getHospital());

        doctorRepository.save(existingDoctor);
    }
} 