package com.seedsir.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table( name = "JOUEUR" )
@Data
public class Player {

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY )
    @Column( name = "ID_JOUEUR" )
    private int    id;
    @Column( name = "NOM_JOUEUR" )
    private String namePlayer;
    @Column( name = "PRENOM_JOUEUR" )
    private String lastNamePlayer;
    @Column( name = "DATE_NAISSANCE" )
    private Date   bornDate;
    @Column( name = "VILLE_NAISSANCE" )
    private String bornTown;
    @Column( name = "TAILLE" )
    private float  size;
    @Column( name = "POIDS" )
    private int    weight;
    @Column( name = "POSTE" )
    private String role;
    @Column( name = "CARRIERE" )
    private String carrier;
    @Column( name = "MEILLEUR_PIED" )
    private char   bestFoot;
    @Column( name = "PALMARES" )
    private String palmares;
    @JoinColumn( name = "ID_EQUIPE_JOUEUR" )
    @ManyToOne
    private Team   team;
}
