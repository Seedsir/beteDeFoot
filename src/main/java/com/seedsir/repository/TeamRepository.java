package com.seedsir.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.seedsir.domain.Team;

@Repository
public interface TeamRepository extends JpaRepository<Team, Integer> {

    // @Query("select t from Team t order by t.teamName asc")
    List<Team> findAllByOrderByTeamNameAsc();

}
