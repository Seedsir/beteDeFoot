package com.seedsir.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.seedsir.domain.Match;

@Repository
public interface MatchRepository extends JpaRepository<Match, Integer> {

    Match findTopByMatchDateAfter( Date date );

    List<Match> findByDayNumber( int dayNumber );

    Match findById( int id );

}
