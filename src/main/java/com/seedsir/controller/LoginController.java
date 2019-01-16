package com.seedsir.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seedsir.domain.Team;
import com.seedsir.domain.User;
import com.seedsir.repository.TeamRepository;
import com.seedsir.repository.UserRepository;

@Controller
@RequestMapping( "/betedefoot" )
public class LoginController {

    private static final Logger LOGGER = LoggerFactory.getLogger( LoginController.class );

    @Autowired
    private TeamRepository      teamRepository;

    @Autowired
    private UserRepository      userRepository;

    @GetMapping( "/Connexion" )
    public String connexion( Model model ) {
        model.addAttribute( "attr", "Bastien" );
        return "Connexion";
    }

    @PostMapping( "/Connexion" )
    public String connectUser( HttpServletRequest request, String email, String motdepasse ) {
        User user = userRepository.findByEmailAndPassword( email, motdepasse );
        if ( user == null ) {
            return "redirect:Connexion";
        }
        HttpSession session = request.getSession();
        session.setAttribute( "userSession", user );
        return "redirect:ListeMatchs";
    }

    @GetMapping( "/Inscription" )
    public String inscription( Model model ) {
        List<Team> teamList = teamRepository.findAllByOrderByTeamNameAsc();
        model.addAttribute( "teams", teamList );
        return "Inscription";
    }

    @PostMapping( "/Inscription" )
    public String saveUser( @Valid User user, BindingResult bindingResult ) {
        if ( bindingResult.hasErrors() ) {
            LOGGER.info( "Il y a des erreurs" );
            return "redirect:Inscription";
        }
        userRepository.save( user );
        return "redirect:Connexion";
    }
}
