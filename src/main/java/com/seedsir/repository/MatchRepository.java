package com.seedsir.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.seedsir.domain.Match;

@Repository
public interface MatchRepository extends JpaRepository<Match, Integer> {

}
