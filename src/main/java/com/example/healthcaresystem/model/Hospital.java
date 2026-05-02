package com.example.healthcaresystem.model;

import jakarta.persistence.*;
import java.util.List;

@Entity

@Table(name = "hospitals")

public class Hospital {

    @Id

    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Long id;

    @Column(nullable = false, name = "hospital_name")

    private String name;

    @Column(nullable = false)

    private String location;

    @OneToMany(mappedBy = "hospital", cascade = CascadeType.ALL)

    private List<Doctor> doctors;

    // Getters and Setters

    public Long getId() { return id; }

    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }

    public void setName(String name) { this.name = name; }

    public String getLocation() { return location; }

    public void setLocation(String location) { this.location = location; }

    public List<Doctor> getDoctors() {return doctors; }

    public void setDoctors(List<Doctor> doctors) { this.doctors = doctors; }
    
}