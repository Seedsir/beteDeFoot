package com.seedsir.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
@Entity
@Table( name = "UTILISATEUR" )
public class User {

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY )
    @Column( name = "ID_UTILISATEUR" )
    private int       id;
    @NotBlank
    private String    pseudo;
    @Column( name = "MOT_DE_PASSE" )
    @NotBlank
    private String    password;
    @Email
    private String    email;
    @JoinColumn( name = "ID_EQUIPE_PREF" )
    @ManyToOne
    @NotNull
    private Team      favoriteTeam;
    private float     tockens;
    private String    avatar;
    @OneToMany( mappedBy = "id.user" )
    private List<Bet> bets = new ArrayList<>();

    public User() {
    }

    public User( String pseudo, String password, String email, Team favoriteTeam ) {
        this.pseudo = pseudo;
        this.password = password;
        this.email = email;
        this.favoriteTeam = favoriteTeam;
    }

}
