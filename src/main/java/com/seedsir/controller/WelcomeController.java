package com.seedsir.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/betedefoot" )
public class WelcomeController {

    @GetMapping( "/Acceuil" )
    public String acceuil( Model model ) {

        return "acceuil";
    }

}
