package com.seedsir.controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seedsir.domain.Match;
import com.seedsir.domain.User;
import com.seedsir.repository.MatchRepository;

@Controller
@RequestMapping( "/betedefoot" )
public class ListMatchController {

    @Autowired
    private MatchRepository matchRepository;

    @GetMapping( "/ListeMatchs" )
    public String consulter( User user, Model model ) {
        LocalDate localDate = LocalDate.now().minusMonths( 3 );
        Date date = Date.from( localDate.atStartOfDay( ZoneId.systemDefault() ).toInstant() );
        Match nextMatch = matchRepository.findTopByMatchDateAfter( date );
        List<Match> matchs = matchRepository.findByDayNumber( nextMatch.getDayNumber() );
        model.addAttribute( "matchs", matchs );
        return "/ListeMatchs";
    }

    @GetMapping( "/visiteur" )
    public String visiter( User user, Model model ) {
        LocalDate localDate = LocalDate.now().minusMonths( 3 );
        Date date = Date.from( localDate.atStartOfDay( ZoneId.systemDefault() ).toInstant() );
        Match nextMatch = matchRepository.findTopByMatchDateAfter( date );
        List<Match> matchs = matchRepository.findByDayNumber( nextMatch.getDayNumber() );
        model.addAttribute( "matchs", matchs );
        return "visiteur";
    }

    @GetMapping( "/Match/{id}" )
    public String parier( Model model, @PathVariable( "id" ) Integer id ) {
        Optional<Match> matchBet = matchRepository.findById( id );
        model.addAttribute( "match", matchBet.get() );
        model.addAttribute( "results", matchBet.get().getResults() );
        return "Match";
    }

}
