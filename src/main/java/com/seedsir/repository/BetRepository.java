package com.seedsir.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.seedsir.domain.Bet;
import com.seedsir.domain.Bet.FooPK;

@Repository
public interface BetRepository extends JpaRepository<Bet, FooPK> {

}
