package com.seedsir.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seedsir.domain.Player;
import com.seedsir.repository.PlayerRepository;

@Controller
@RequestMapping( "/betedefoot" )
public class PlayerInfosController {

    @Autowired
    private PlayerRepository playerRepository;

    @GetMapping( "/player/{id}" )
    public String consulter( @PathVariable( name = "id" ) Integer id, Model model ) {
        Optional<Player> optPlayer = playerRepository.findById( id );
        if ( !optPlayer.isPresent() ) {
            return "404";
        }
        Player player = optPlayer.get();
        model.addAttribute( "player", player );
        return "player";
    }

}
