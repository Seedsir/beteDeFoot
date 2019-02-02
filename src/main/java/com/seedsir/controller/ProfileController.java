package com.seedsir.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.seedsir.repository.BetRepository;
import com.seedsir.repository.TeamRepository;
import com.seedsir.repository.UserRepository;

@Controller
@RequestMapping( "/betedefoot" )
public class ProfileController {

    private static final Logger LOGGER = LoggerFactory.getLogger( ProfileController.class );

    @Autowired
    private TeamRepository      teamRepository;

    @Autowired
    private UserRepository      userRepository;

    @Autowired
    private BetRepository       betRepository;

    @GetMapping( "/profile" )
    public String consulter( User user, Model model ) {
        List<Team> teamList = teamRepository.findAllByOrderByTeamNameAsc();

        // List<Bet> listBet=betRepository.findById( user.getId() )
        model.addAttribute( "teams", teamList );
        return "/Profil";
    }

    @PostMapping( "/profile" )
    public String updateUser( HttpServletRequest request, User user, BindingResult bindingResult ) {
        if ( bindingResult.hasErrors() ) {
            LOGGER.info( "Il y a des erreurs" );
            return "redirect:profile";
        }
        HttpSession session = request.getSession();
        userRepository.save( user );
        session.setAttribute( "userSession", user );
        return "redirect:profile";
    }
}
