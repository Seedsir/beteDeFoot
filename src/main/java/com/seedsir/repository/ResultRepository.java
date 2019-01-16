package com.seedsir.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.seedsir.domain.Result;

public interface ResultRepository extends JpaRepository<Result, Integer> {

    List<Result> findByMatchId( int idMatch );
}
