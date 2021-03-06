package com.seedsir.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.seedsir.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    // @Query("select mail from User u order");

    User findByEmailAndPassword( String email, String password );

    User findByEmail( String email );

}
