package com.example.healthcaresystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.healthcaresystem.model.Doctor;
import com.example.healthcaresystem.service.HealthcareSystemService;

@Controller

public class HomeController {

    @Autowired

    private HealthcareSystemService healthcaresystemService;

    @GetMapping("/")

    public String home(Model model) {

        model.addAttribute("doctors", healthcaresystemService.getAllDoctors());

        model.addAttribute("hospitals", healthcaresystemService.getAllHospitals());

        return "home";
    }

    @PostMapping("/addDoctor")

    public String addDoctor(@ModelAttribute Doctor doctor, Model model) {

        try {
            healthcaresystemService.saveDoctor(doctor);
        } catch (Exception e) {
            model.addAttribute("error", "Doctor couldn't be added" + e.getMessage()); 
            return home(model);
        }
        return "redirect:/";
    }

    @GetMapping("/editDoctor/{id}")

    public String showUpdateForm(@PathVariable("id") Long id, Model model) {

        Doctor doctor = healthcaresystemService.getDoctorById(id);
        model.addAttribute("doctor", doctor);

        model.addAttribute("hospitals", healthcaresystemService.getAllHospitals());
        return "update";
    }

    @PostMapping("/updateDoctor/{id}")

    public String updateDoctor(@PathVariable("id") Long id, @ModelAttribute Doctor doctor, Model model) {

        try {
            healthcaresystemService.updateDoctor(id, doctor);
        } catch (Exception e) {
            model.addAttribute("error", "Couldn't Update due to:" + e.getMessage());
            return "update";
        }
        return "redirect:/";
    }
}