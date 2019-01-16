package com.seedsir.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seedsir.domain.Player;
import com.seedsir.domain.User;
import com.seedsir.repository.PlayerRepository;

@Controller
@RequestMapping( "/betedefoot" )
public class TeamInfosController {

    @Autowired
    private PlayerRepository   playerRepository;
    @Autowired
    private HttpServletRequest request;

    @GetMapping( "/equipe" )
    public String consulter( Model model ) {
        User user = (User) request.getSession().getAttribute( "userSession" );
        List<Player> playerList = playerRepository.findByTeamIdOrderByNamePlayerAsc( user.getFavoriteTeam().getId() );
        model.addAttribute( "players", playerList );
        return "equipe";
    }

}
