package com.seedsir.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seedsir.domain.Bet;
import com.seedsir.domain.Match;
import com.seedsir.domain.Result;
import com.seedsir.domain.User;
import com.seedsir.repository.BetRepository;
import com.seedsir.repository.MatchRepository;
import com.seedsir.repository.ResultRepository;
import com.seedsir.repository.TeamRepository;
import com.seedsir.repository.UserRepository;

@Controller
@RequestMapping( "/betedefoot" )
public class BetController {

    @Autowired
    private TeamRepository   teamRepository;

    @Autowired
    private UserRepository   userRepository;

    @Autowired
    private MatchRepository  matchRepository;

    @Autowired
    private BetRepository    betRepository;

    @Autowired
    private ResultRepository resultRepository;

    @GetMapping( "/Match/Paris/{id}/{resultId}" )
    public String miser( @PathVariable( name = "resultId" ) Integer resultId, Model model,
            @PathVariable( name = "id" ) Integer id ) {
        Optional<Match> matchBet = matchRepository.findById( id );
        model.addAttribute( "match", matchBet.get() );
        Optional<Result> result = resultRepository.findById( resultId );
        model.addAttribute( "result", result.get() );
        return "/Paris";
    }

    @PostMapping( "/validation" )
    @ResponseBody
    public String valider( HttpServletRequest request, @RequestParam( name = "mise" ) float mise,
            @RequestParam( name = "idResult" ) int idResult ) {
        User user = (User) request.getSession().getAttribute( "userSession" );
        if ( user.getTockens() < mise ) {
            return "Vérifier le montant de vos tockens";
        }
        Optional<Result> result = resultRepository.findById( idResult );
        float newSold = user.getTockens() - mise;
        user.setTockens( newSold );
        user = userRepository.save( user );
        Bet userBet = new Bet( user, result.get(), mise );
        betRepository.save( userBet );
        return "ok";
    }
}