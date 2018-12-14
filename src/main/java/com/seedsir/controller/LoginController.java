package com.seedsir.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seedsir.domain.Team;
import com.seedsir.repository.TeamRepository;

@Controller
@RequestMapping( "/betedefoot" )
public class LoginController {

    @Autowired
    private TeamRepository teamRepository;

    @GetMapping( "/Connexion" )
    public String connexion( Model model ) {
        model.addAttribute( "attr", "Bastien" );
        return "Connexion";
    }

    @GetMapping( "/Inscription" )
    public String inscription( Model model ) {
        List<Team> teamList = teamRepository.findAllByOrderByTeamNameAsc();
        model.addAttribute( "teams", teamList );
        return "Inscription";
    }

}
