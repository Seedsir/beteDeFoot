package com.seedsir.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table( name = "EQUIPE" )
public class Team {

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY )
    @Column( name = "ID_EQUIPE" )
    private int          id;
    @Column( name = "NOM_EQUIPE" )
    private String       teamName;
    private String       palmares;
    private String       dirigeants;
    private String       entrainneur;
    @Column( name = "DATE_CREATION" )
    private Date         dateDeCreation;
    // private List<Match> listMatchs;
    private String       stadium;
    @OneToMany( mappedBy = "team" )
    private List<Player> players;

}
