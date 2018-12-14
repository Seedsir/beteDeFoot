package com.seedsir.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table( name = "UTILISATEUR" )
public class User {

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY )
    @Column( name = "ID_UTILISATEUR" )
    private int    id;
    private String pseudo;
    @Column( name = "MOT_DE_PASSE" )
    private String password;
    private String email;
    @JoinColumn( name = "ID_EQUIPE_PREF" )
    @ManyToOne
    private Team   favoriteTeam;
    private float  tockens;
    private String avatar;

    public User( String pseudo, String password, String email, Team favoriteTeam ) {
        this.pseudo = pseudo;
        this.password = password;
        this.email = email;
        this.favoriteTeam = favoriteTeam;
    }
}
